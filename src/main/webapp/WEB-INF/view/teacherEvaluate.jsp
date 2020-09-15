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
<%--
                    <input type="text" name="finalScore" id="finalScore" required lay-verify="required" placeholder="请输入分数" autocomplete="off" class="layui-input">
--%>
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
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
                $.ajax({
                    url:"AddEvaluate",
                    type:"post",
                    data:{
                        ename:$("#ename").val(),
                        job:$("#job").val(),
                        hiredate:$("#hiredate").val(),
                        sal:$("#sal").val()
                    },
                    dataType:"text",//默认值为text
                    success:function (data) {
                        if("true" == data){
                            layer.msg('新增成功');
                            setTimeout('closeAdd()',1000)
                        }else{
                            layer.msg('新增失败');
                            setTimeout('closeAdd()',1000)
                        }
                    },
                    error:function (data) {
                        layer.msg("执行失败");
                        setTimeout('closeAdd()',1000)
                    }
                })
            });

            //员工输入姓名后失去焦点
            $("#ename").blur(function () {
                $.ajax({
                    url:"TestAjaxServlet",//要请求的后台资源
                    type:"get",//ajax请求类型
                    data:{//向服务器发送的数据
                        ename:$("#ename").val()
                    },
                    dataType:"text",//向服务器响应数据类型
                    //dataType:"json",
                    success:function (data) {
                        $("#enameDiv").text(data);
                    },
                    error:function (data) {
                        layer.msg("执行失败")
                    }
                })
            });


            ///监听提交
            form.on('submit(formDemo)', function(data){
                layer.msg(JSON.stringify(data.field));
                //return false;
            });
        });
        var closeAdd = function () {
            parent.location.reload();//刷新父页面
        }
    </script>
</body>
</html>

