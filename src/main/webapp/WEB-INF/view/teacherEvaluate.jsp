<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/14
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>老师评价页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
    <div style="display: flex;justify-content: center">
        <div class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">整体分数</label>
                <div class="layui-input-inline">
                    <select name="finalScore" lay-verify="required" id="finalScore">
                        <option value=""></option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">综合评价</label>
                <textarea rows="8" cols="25" name="comment" id="comment"></textarea>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="formDemo" id="addEvaluate">提交</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        //Demo
        layui.use('form', function(){
            var form = layui.form;
            $ = layui.$;
            //点击提交按钮
            $("#addEvaluate").click(function () {
                if($("#comment").val() == ""){
                    layer.msg('综合评价不能为空',{icon: 3})
                }else{
                    layer.confirm('确定要提交吗?提交之后不可在进行修改！',function(){
                        $.ajax({
                            url:"addEvaluate",
                            type:"post",
                            data:{
                                finalScore:$("#finalScore").val(),
                                comment:$("#comment").val(),
                                sid:'${sid}'
                            },
                            dataType:"text",//默认值为text
                            success:function (data) {
                                if(data){
                                    layer.msg('提交成功',{icon: 6});
                                    setTimeout('closeAdd()',1000)
                                }else{
                                    layer.msg('提交失败');
                                    setTimeout('closeAdd()',1000)
                                }
                            },
                            error:function (data) {
                                layer.msg("执行失败");
                                setTimeout('closeAdd()',1000)
                            }
                        })
                    })
                }
            });
        });
        var closeAdd = function () {
            parent.location.reload();//刷新父页面
        }
</script>
</body>
</html>

