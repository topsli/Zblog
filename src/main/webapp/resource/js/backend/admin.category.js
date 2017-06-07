zblog.register("zblog.category");
$(function(){
    $.ajax({
        type:"GET",
        url:zblog.getDomainLink("categorys/index"),
        dataType:"json",
        success:function(data){
            if(!data) return ;
            $('#tree').treeview({data:data,nodeIcon:"glyphicon glyphicon-star-empty"});
        }
    });
});

zblog.category.insert=function(){
    var newCategory=$("#newCategory").val();
    if(!newCategory) return ;
    alert(zblog.getDomainLink("categorys/add"));
    var select = $("#tree .node-selected");
    $.ajax({
        type:"POST",
        url:zblog.getDomainLink("categorys/add"),
        dataType:"json",
        data:{parent:select.text(),name:newCategory},
        success:function(msg){
            if(msg&&msg.success){
                window.location.reload();
                zdialog.hide('insert-box');
            }else{
                alert(msg.msg);
            }
        }
    });
}

zblog.category.remove=function(){

    var select = $("#tree .node-selected").text();
    if(!select) return ;
    alert(zblog.getDomainLink("categorys/remove"))
    $.ajax({
        type:"post",
        url:zblog.getDomainLink("categorys/remove"),
        dataType:"json",
        data: {categoryName:select},
        success:function(msg){
            if(msg&&msg.success){
                window.location.reload();
            }else{
                alert("删除失败");
            }
        }
    });
}