/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : zblog

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-06-07 17:19:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` varchar(19) NOT NULL,
  `name` varchar(25) NOT NULL,
  `leftv` int(11) NOT NULL,
  `rightv` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('7rrEQFhwIORxfDPK5wE', 'MQ', '3', '4', '1', '2017-06-07 14:50:28');
INSERT INTO `category` VALUES ('Mf2DuehP8rWqS8EzyXB', 'Root', '1', '2', '1', '2014-12-18 19:37:58');
INSERT INTO `category` VALUES ('Mf2DuehP8rWqS8EzyXD', 'JAVA', '2', '3', '1', '2017-06-07 13:54:50');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` varchar(19) NOT NULL,
  `postid` varchar(19) NOT NULL,
  `parent` varchar(19) DEFAULT NULL,
  `creator` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `url` varchar(80) NOT NULL,
  `agent` varchar(120) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `content` varchar(200) NOT NULL,
  `status` enum('wait','approve','reject','trash') NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comment_post` (`postid`),
  KEY `index_parent` (`parent`) USING BTREE,
  CONSTRAINT `index_comment` FOREIGN KEY (`parent`) REFERENCES `comment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `index_comment_post` FOREIGN KEY (`postid`) REFERENCES `post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('b9CPdUtYfVbztk2Y8uD', '8', null, 'tops', 'tops@126.com', 'http://www.baidu.com', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '127.0.0.1', '这文章很好', 'approve', '2017-06-07 16:51:15');
INSERT INTO `comment` VALUES ('JYx7j5afnOGZRsiqDmw', '8', 'b9CPdUtYfVbztk2Y8uD', 'admin', 'manager@zblog.com', 'http://localhost:8080/zblog', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.3; WOW64; Trident/7.0)', '127.0.0.1', '阿斯蒂芬asf', 'wait', '2017-06-07 16:53:27');

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` varchar(19) NOT NULL,
  `name` varchar(80) NOT NULL,
  `url` varchar(100) NOT NULL,
  `notes` varchar(150) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `creator` varchar(20) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('2RaTV2MkZDgKauwKDF3', '123', 'http://hao123.com', 'http://hao123.com', '1', 'admin', '2017-06-07 10:45:21');
INSERT INTO `link` VALUES ('2SBGkQrunUU1Ifa8pO8', 'w3school', 'http://www.w3school.com.cn', 'w3school 12345', '1', 'admin', '2017-06-07 10:00:06');
INSERT INTO `link` VALUES ('6ChkuVe0kfLY8ZiDnqZ', 'JavaTalk', 'http://www.zhouhaocheng.cn', null, '1', 'admin', '2015-01-06 17:27:31');

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('description', 'description', 'Spring Mybatis Ehcache Shiro Lucene FreeMarker');
INSERT INTO `options` VALUES ('postid', 'postid', '9');
INSERT INTO `options` VALUES ('post_allowComment', 'post_allowComment', 'true');
INSERT INTO `options` VALUES ('post_maxshow', 'post_maxshow', '10');
INSERT INTO `options` VALUES ('subtitle', 'subtitle', 'Just another zblog website');
INSERT INTO `options` VALUES ('title', 'title', 'Zblog');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` varchar(19) NOT NULL,
  `title` varchar(100) NOT NULL,
  `excerpt` varchar(350) DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `type` enum('post','page') NOT NULL,
  `parent` varchar(19) DEFAULT NULL,
  `categoryid` varchar(19) DEFAULT NULL,
  `pstatus` varchar(10) NOT NULL,
  `cstatus` varchar(10) NOT NULL,
  `ccount` int(11) NOT NULL,
  `rcount` int(11) NOT NULL,
  `creator` varchar(19) NOT NULL,
  `createTime` datetime NOT NULL,
  `lastUpdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_post_category` (`categoryid`),
  KEY `index_post_user` (`creator`),
  CONSTRAINT `index_post_category` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `index_post_user` FOREIGN KEY (`creator`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('6', 'SDFASF', 'ASFASF', 'ASFASF', 'post', 'Root', 'Mf2DuehP8rWqS8EzyXD', 'publish', 'open', '0', '1', 'uHHi9gvg81UXn4PLlLE', '2017-06-07 14:54:04', '2017-06-07 14:54:04');
INSERT INTO `post` VALUES ('7', 'sad', 'asfasf', 'asfasf', 'post', 'Root', 'Mf2DuehP8rWqS8EzyXD', 'publish', 'open', '0', '2', 'uHHi9gvg81UXn4PLlLE', '2017-06-07 15:20:28', '2017-06-07 15:20:28');
INSERT INTO `post` VALUES ('8', 'TCP的三次握手和四次分手分析', '一直使用Java，对TCP协议没有太多应用，不过做数据抓包时还是经常接触(推荐一个Mac下挺好用的抓包攻工具Packet Peeper，没有Wireshark强大但是支持TCP dump的所有filter语法)，这里只做基础的分析。 我们需要知道，我们程序的数据首先会打到TCP的Segment中，然后TCP的Segment会打到IP的Packet中，然后再打到以太网Ethernet的Frame中，传到对端后，各个层解析自己的协议，然后把数据交给更高层的协议处理。OSI的七层模型如下： 功能 协议族 应用层(Application Layer) 文件传输、电子邮件、文件服务、虚拟终端 HTTP、SNMP、FTP、SMTP、DNS、Telnet 表示层(Present Layer) 数据格式化、', '<p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; line-height: 21px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;\">一直使用Java，对TCP协议没有太多应用，不过做数据抓包时还是经常接触(推荐一个Mac下挺好用的抓包攻工具Packet Peeper，没有Wireshark强大但是支持TCP dump的所有filter语法)，这里只做基础的分析。</p>\n<p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; line-height: 21px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;\">我们需要知道，我们程序的数据首先会打到TCP的Segment中，然后TCP的Segment会打到IP的Packet中，然后再打到以太网Ethernet的Frame中，传到对端后，各个层解析自己的协议，然后把数据交给更高层的协议处理。OSI的七层模型如下：</p>\n<table width=\"1163\" style=\"width: 1093px;\">\n <thead>\n  <tr class=\"firstRow\">\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\"><br></td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">功能</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">协议族</td>\n  </tr>\n </thead>\n <tbody>\n  <tr>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">应用层(Application Layer)</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">文件传输、电子邮件、文件服务、虚拟终端</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">HTTP、SNMP、FTP、SMTP、DNS、Telnet</td>\n  </tr>\n  <tr>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">表示层(Present Layer)</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">数据格式化、代码转换、数据加解密</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">无</td>\n  </tr>\n  <tr>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">会话层(Session Layer)</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">解除或建立与别的节点的联系</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">无</td>\n  </tr>\n  <tr>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">传输层(Transport Layer)</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">提供端对端的接口</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">TCP、UDP</td>\n  </tr>\n  <tr>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">网络层(Internet Layer)</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">为数据包选择路由</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">IP、ICMP、RIP、BGP、IGMP</td>\n  </tr>\n  <tr>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">数据链路层(DataLink Layer)</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">传输有地址的帧以及错误检测功能</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">SLIP、CSLIP、ARP、PPP、MTU</td>\n  </tr>\n  <tr>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">物理层(Physical Layer)</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">以二进制格式在物理媒体上传输数据</td>\n   <td style=\"border-color: rgb(204, 204, 204); padding: 15px;\">ISO2110、IEEE802、IEEE802.2</td>\n  </tr>\n </tbody>\n</table>\n<h3 style=\"line-height: 21.294px; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; white-space: normal;\">TCP协议数据包头格式</h3>\n<p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; line-height: 21px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;\"><a href=\"http://blog.zhouhaocheng.cn/post/uploads/2015/10/tcp_head_2.jpg\" style=\"border: none; outline: none; color: rgb(0, 161, 158);\"><img title=\"tcp_head\" alt=\"tcp_head\" src=\"http://blog.zhouhaocheng.cn/post/uploads/2015/10/tcp_head_thumb.jpg\" width=\"700\" height=\"284\" style=\"border: 0px none; height: auto; max-width: 100%; width: auto; display: inline;\"></a></p>\n<p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; line-height: 21px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;\">图上比较重要的字段：</p>\n<ul style=\"list-style-type: none;\">\n <li>Sequence Number:用来标识从TCP发端向TCP收端发送的数据字节流，它表示在这个报文段中的的第一个数据字节在数据流中的序号；主要用来解决网络报乱序的问题；</li>\n <li>Acknowledgment Number:32位确认序列号包含发送确认的一端所期望收到的下一个序号，因此，确认序号应当是上次已成功收到数据字节序号加1。不过，只有当标志位中的ACK标志（下面介绍）为1时该确认序列号的字段才有效。主要用来解决不丢包的问题；</li>\n <li>TCP Flags:TCP包的类型，有CWR、ECE、URG、ACK、PSH、RST、SYN、FIN这几种。</li>\n <li>Window：窗口和滑动窗口，用来进行流量控制。连接建立时，各端分配一块缓冲区用来存储接收的数据，并将缓冲区的尺寸发送给另一端，接收方发送的确认信息中包含了自己剩余的缓冲区尺寸，剩余缓冲区空间的数量叫做窗口。数据接收时窗口变小，数据读取时窗口变大。</li>\n</ul>\n<h3 style=\"line-height: 21.294px; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; white-space: normal;\">TCP连接的建立与断开</h3>\n<p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; line-height: 21px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;\">&nbsp;&nbsp;&nbsp; 在TCP/IP协议中，连接是通过三次握手进行初始化的。三次握手的目的是同步连接双方的序列号和确认号并交换TCP窗口大小信息。以保证应用层接收到的数据不会因为网络上的传输的问题而乱序。</p>\n<p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; line-height: 21px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;\"><a href=\"http://blog.zhouhaocheng.cn/post/uploads/2015/10/tcp_open_close_2.jpg\" style=\"border: none; outline: none; color: rgb(0, 161, 158);\"><img title=\"tcp_open_close\" alt=\"tcp_open_close\" src=\"http://blog.zhouhaocheng.cn/post/uploads/2015/10/tcp_open_close_thumb.jpg\" width=\"219\" height=\"244\" style=\"border: 0px none; height: auto; max-width: 100%; width: auto; display: inline;\"></a></p>\n<p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; line-height: 21px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;\">其中建立连接流程如下：</p>\n<ul style=\"list-style-type: none;\">\n <li>第一次握手：建立连接时，客户端发送SYN包（SYN=j）到服务器，并进入SYN_SEND状态，等待服务器B确认。</li>\n <li>第二次握手：服务器收到SYN包，必须确认客户端的SYN（ACK=j+1），同时自己也发送一个SYN包（SYN=k），即SYN+ACK包，此时服务器进入SYN_RECV状态。</li>\n <li>第三次握手：客户端收到服务器的SYN＋ACK包，向服务器发送确认包ACK（ACK=k+1），此包发送完毕，客户端和服务器进入ESTABLISHED状态，完成三次握手。</li>\n</ul>\n<p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; line-height: 21px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;\">&nbsp;&nbsp;&nbsp; 由于TCP连接是全双工的，因此每个方向都必须单独进行关闭。这个原则是当一方完成它的数据发送任务后就能发送一个FIN来终止这个方向的连接。收到一个 FIN只意味着这一方向上没有数据流动，一个TCP连接在收到一个FIN后仍能发送数据。首先进行关闭的一方将执行主动关闭，而另一方执行被动关闭。客户端或服务器均可主动发起close动作。</p>\n<ul style=\"list-style-type: none;\">\n <li>第一次分手：客户端发送一个FIN，用来关闭客户端到服务器的数据传送，客户端进入<code>FIN_WAIT_1</code>状态。</li>\n <li>第二次分手：服务端收到这个FIN，它发回一个ACK，确认序号为收到的序号加1。客户端进入<code>FIN_WAIT_2</code>状态，服务端进入<code>CLOSE_WAIT</code>状态。</li>\n <li>第三次分手：服务端向客户端发送FIN报文段，请求关闭连接，服务端进入LAST_ACK状态。</li>\n <li>第四次分手：客户端接受FIN并发回ACK报文确认，并将确认序号设置为收到序号加1，客户端进入TIME_WAIT状态。</li>\n</ul>\n<p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; line-height: 21px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;\">客户端TCP状态变化：<br>CLOSED-&gt;SYN_SENT-&gt;ESTABLISHED-&gt;FIN_WAIT_1-&gt;FIN_WAIT_2-&gt;TIME_WAIT-&gt;CLOSED<br>服务器TCP状态变化：<br>CLOSED-&gt;LISTEN-&gt;SYN_REVD-&gt;ESTABLISHED-&gt;CLOSE_WAIT-&gt;LAST_ACK-&gt;CLOSED</p>\n<h3 style=\"line-height: 21.294px; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; white-space: normal;\">TCP状态详解</h3>\n<ul style=\"list-style-type: none;\">\n <li>LISTEN - 监听TCP端口的连接请求。</li>\n <li>SYN_SENT -在发送连接请求后等待服务端的第二个报文。</li>\n <li>SYN_REVD - 在收到和发送一个连接请求后等待对连接请求的确认。</li>\n <li>ESTABLISHED- 连接建立完成，数据可以传输。</li>\n <li>FIN_WAIT_1 - 等待远程TCP的FIN报文，它与FIN_WAIT_2的区别是：FIN_WAIT_1状态实际上是当SOCKET在ESTABLISHED状态时，它想主动关闭连接，向对方发送了FIN报文，此时该SOCKET即进入到FIN_WAIT_1状态。而当对方回应ACK报文后，则进入到FIN_WAIT_2状态，当然在实际的正常情况下，无论对方何种情况下，都应该马上回应ACK报文，所以FIN_WAIT_1状态一般是比较难见到的，而FIN_WAIT_2状态还有时常常可以用netstat看到。</li>\n <li>FIN_WAIT_2 - 等待远程TCP的FIN报文，FIN_WAIT_2状态下的SOCKET，表示半连接，也即有一方要求close连接，但另外还告诉对方，我暂时还有点数据需要传送给你，稍后再关闭连接。在Java也是支持这种半关闭socket的。</li>\n <li>CLOSE_WAIT - 被动关闭方才会出现的状态，被动方接受FIN并返回ACK时，进入到CLOSE_WAIT状态，然后看是否还有数据发送给对方，如果没有的话，那么就发送FIN报文给对方，也即关闭连接。所以你在CLOSE_WAIT状态下，需要完成的事情是等待你去关闭连接。如果你的服务器中出现大量CLOSE_WAIT，应该要考虑检查代码。</li>\n <li>CLOSING - 表示发送FIN报文后，并没有收到对方的ACK报文，反而却也收到了对方的FIN报文(如果双方几乎在同时close一个SOCKET的话，那么就出现了双方同时发送FIN报文的情况，也即会出现CLOSING状态，表示双方都正在关闭SOCKET连接。)。</li>\n <li>LAST_ACK - 被动关闭一方在发送FIN报文后，最后等待对方的ACK报文。当收到ACK报文后，也即可以进入到CLOSED可用状态了。</li>\n <li>TIME_WAIT -表示收到了对方的FIN报文，并发送出了ACK报文，就等2MSL(Max Segment Lifetime，TCP协议用以保证被重新分配的socket不会受到之前残留的延迟重发报文影响的机制,是必要的逻辑保证。)后即可回到CLOSED可用状态了。如果FIN_WAIT_1状态下，收到了对方同时带FIN标志和ACK标志的报文时，可以直接进入到TIME_WAIT状态，而无须经过FIN_WAIT_2状态。</li>\n <li>CLOSED - 没有任何连接状态。</li>\n</ul>\n<p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; line-height: 21px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;\">参考：</p>\n<p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; line-height: 21px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;\"><a href=\"http://coolshell.cn/articles/11564.html\" style=\"border: none; outline: none; color: rgb(0, 161, 158);\">http://coolshell.cn/articles/11564.html</a></p>\n<p><br></p>', 'post', 'Root', 'Mf2DuehP8rWqS8EzyXD', 'publish', 'open', '1', '17', 'uHHi9gvg81UXn4PLlLE', '2017-06-07 15:24:45', '2017-06-07 15:24:45');
INSERT INTO `post` VALUES ('9', 'CHROME开发者工具的小技巧', 'Chrome的开发者工具是个很强大的东西，相信程序员们都不会陌生，不过有些小功能可能并不为大众所知，所以，写下这篇文章罗列一下可能你所不知道的功能，有的功能可能会比较实用，有的则不一定，也欢迎大家补充交流。 话不多话，我们开始。 代码格式化 有很多css/js的代码都会被 minify 掉，你可以点击代码窗口左下角的那个 { }  标签，chrome会帮你给格式化掉。  ', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1.5em; line-height: 1.7em; color: rgb(66, 66, 66); font-family: \">Chrome的开发者工具是个很强大的东西，相信程序员们都不会陌生，不过有些小功能可能并不为大众所知，所以，写下这篇文章罗列一下可能你所不知道的功能，有的功能可能会比较实用，有的则不一定，也欢迎大家补充交流。</p>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1.5em; line-height: 1.7em; color: rgb(66, 66, 66); font-family: \">话不多话，我们开始。</p>\n<h4 style=\"box-sizing: border-box; font-family: Lato, sans-serif; line-height: 1.1; color: rgb(33, 33, 33); margin-top: 50px; margin-bottom: 10px; font-size: 24px; clear: both; padding: 10px; border-left: 3px solid rgb(228, 228, 228); text-align: justify; white-space: normal; background: rgb(245, 245, 245);\">代码格式化</h4>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1.5em; line-height: 1.7em; color: rgb(66, 66, 66); font-family: \">有很多css/js的代码都会被 minify 掉，你可以点击代码窗口左下角的那个&nbsp;<strong style=\"box-sizing: border-box;\"><code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \">{ }</code></strong>&nbsp;&nbsp;标签，chrome会帮你给格式化掉。</p>\n<p><img src=\"http://localhost:8080/zblog/post/uploads/2017/06/logo.png\" title=\"logo.png\" alt=\"logo.png\"></p>\n<p>&nbsp;</p>', 'post', 'Root', 'Mf2DuehP8rWqS8EzyXD', 'publish', 'open', '0', '8', 'uHHi9gvg81UXn4PLlLE', '2017-06-07 15:31:11', '2017-06-07 15:34:54');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` varchar(19) NOT NULL,
  `name` varchar(15) NOT NULL,
  `postid` varchar(19) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `postid` (`postid`),
  CONSTRAINT `tag_post_index` FOREIGN KEY (`postid`) REFERENCES `post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('37YzftWhJYSBFF7lN8V', 'sa', '7', '2017-06-07 15:20:28');
INSERT INTO `tag` VALUES ('FYIsuozQtKbyAWdZQJU', 'SA', '6', '2017-06-07 14:54:04');
INSERT INTO `tag` VALUES ('QwTA1cTVbNNJICw5idZ', 'JS', '9', '2017-06-07 15:34:54');

-- ----------------------------
-- Table structure for upload
-- ----------------------------
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `id` varchar(19) NOT NULL,
  `postid` varchar(19) DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `path` varchar(100) NOT NULL,
  `creator` varchar(25) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_upload_post` (`postid`),
  CONSTRAINT `index_upload_post` FOREIGN KEY (`postid`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload
-- ----------------------------
INSERT INTO `upload` VALUES ('mG8JpmDO03evNTy3pyj', '9', 'logo.png', '/post/uploads/2017/06/logo.png', 'uHHi9gvg81UXn4PLlLE', '2017-06-07 15:30:33');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(19) NOT NULL,
  `nickName` varchar(25) NOT NULL,
  `realName` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `role` enum('admin','editor','contributor') NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `creator` varchar(15) DEFAULT NULL,
  `lastUpdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`nickName`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('GvgTEPaoVkjF0fCK425', 'test', 'test1234', 'e10adc3949ba59abbe56e057f20f883e', 'test@126.com', 'N', 'contributor', '', '2017-06-06 17:36:47', null, '2017-06-06 17:36:47');
INSERT INTO `user` VALUES ('u69uEwFTQ0UJhnV9rkc', 'likun', 'likun', 'e10adc3949ba59abbe56e057f20f883e', 'likun@126.com', 'N', 'contributor', 'likun@126.com', '2017-06-07 09:42:11', null, '2017-06-07 09:42:11');
INSERT INTO `user` VALUES ('uHHi9gvg81UXn4PLlLE', 'admin', '东方上人', 'e10adc3949ba59abbe56e057f20f883e', 'manager@zblog.com', 'N', 'admin', null, '2014-12-31 18:49:44', null, '2014-12-31 18:49:48');

-- ----------------------------
-- View structure for view_category
-- ----------------------------
DROP VIEW IF EXISTS `view_category`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_category` AS select `n`.`id` AS `id`,`n`.`name` AS `name`,count(`n`.`id`) AS `level`,`n`.`visible` AS `visible` from (`category` `n` join `category` `p`) where (`n`.`leftv` between `p`.`leftv` and `p`.`rightv`) group by `n`.`id` order by `n`.`leftv` ;
