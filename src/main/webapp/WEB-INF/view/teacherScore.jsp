<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/13
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>老师评分页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-table-tool-self{
            display: none;
        }
        .layui-icon-ok{
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div align="center">
    <table id="demo" lay-filter="test"></table>
</div>
<script type="text/html" id="toolbarDemo">
        <div class="layui-input-inline">
            <button class="layui-btn layui-btn-sm" lay-event="submit">提交</button>
        </div>
    </div>
</script>
<form action="">

</form>
<script>
    layui.use(['table','layer','jquery'], function() {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;

        //第一个实例
        table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo'//添加工具栏
            , height: 350
            , width: 400
            , url: '/getTeacherScore' //数据接口
            , page: false
            , cols: [[ //表头
                {type: 'checkbox'}
                , {field: 'courseName', title: '课程', width: 165, sort: true, align: 'center'}
                , {field: 'state', title: '状态', /*hide:'true',*/ width: 100, sort: true, align: 'center'}
                , {field: 'score', edit:'text', title: '分数', width: 180, align: 'center'}
            ]]
        });
        //监听事件,监听lay-filter="test"的元素的工具栏
        table.on('toolbar(test)', function(obj){
            switch(obj.event){
                case 'submit':
                    $.ajax({
                        url:'gradeList',
                        type:'post',
                        data:{
                            
                        },
                        success:function (data) {
                            if("true" == data){
                                layer.msg('提交成功');
                            }else{
                                layer.msg('提交失败');
                            }
                        },
                        error:function (data) {
                            layer.msg("执行失败");
                        }
                    })
                    break;
            }
        });

    })
</script>
</body>
</html>

