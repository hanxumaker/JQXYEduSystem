<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/14
  Time: 10:34
  To change this template use File | Settings | File Templates.
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/13
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>班级管理</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>

    <style>
        .layui-table-tool-self {
            display: none;
        }
    </style>
    <style>
        .layui-table-tool-temp {
            padding-right: 0px;
        }
    </style>
</head>
<body>
<div align="center">
    <h1 style="margin: 30px 0px 20px 0px">班级管理</h1>
    <table id="demo" lay-filter="test"></table>
</div>

<script type="text/html" id="toolbarDemo">
    <div align="right">
        <div class="layui-btn-container layui-input-inline">
            <button class="layui-btn layui-btn-sm" lay-event="add">添加班级</button>
        </div>
    </div>
</script>
<%--<script type="text/html" id="toolbarDemo1">
    <div class="layui-btn-container layui-input-inline">
        <button class="layui-btn layui-btn-sm" lay-event="update">停用</button>
        <button class="layui-btn layui-btn-sm" lay-event="del">删除</button>
    </div>
</script>--%>
<script>
    layui.use(['table', 'layer'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;
        //第一个实例
        table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo' //添加工具栏
            , width: 820
            , url: '/getAllClasses' //数据接口
            , page: false//关闭分页
            , cols: [[ //表头
                {field: 'cid', title: '编号', width: 150, sort: true, hide: true}
                , {type: 'numbers', title: '序号', width: 200}
                , {field: 'cname', title: '班次', width: 200,align:'center'}
                , {field: 'tid', title: '老师编号', width: 200,align:'center',hide: true}
                , {field: 'tname', title: '班级老师', width: 200,align:'center',
                    templet: function (data) {
                        if (data.tname == null ||data == "") {
                            return "已毕业"
                        } else {
                            return data.tname
                        }
                    }
                }
                , {field: 'tool', title: '操作', width: 200, align:'center',
                    templet: function (data) {
                        if (data.tname == null ||data == "") {
                           return ""
                        } else {
                            return "<button class='layui-btn layui-btn-sm' lay-event='change'>老师更换</button>"
                        }
                    }
                }
            ]]
        });

        //监听事件 监听lay-filter为test的员工工具栏

        table.on('toolbar(test)', function (obj) {
            switch (obj.event) {
                case 'add':
                    layer.open({
                        type: 2, //弹出完整jsp ，1的时候弹出隐藏div
                        title: '添加班级',
                        shadeClose: true, //点击遮罩关闭弹框
                        content: 'addClass',
                        area: ['500px', '400px'],
                        end: function () {
                            //刷新当前页面
                            $(".layui-laypage-btn").click();
                        }
                    });
                    break;
            }

        });


        //行内操作实现
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            switch (obj.event) {
               /* case 'courseTool':
                    var cid = data.cid;
                    layer.open({
                        type: 2, //弹出完整jsp ，1的时候弹出隐藏div
                        title: '课程管理',
                        shadeClose: true, //点击遮罩关闭弹框
                        content: 'ClassToCourse?cid=' + cid,
                        area: ['500px', '300px'],
                        end: function () {
                            //刷新当前页面
                            $(".layui-laypage-btn").click();
                        }
                    });
                    break;*/
                case 'change':
                    layer.confirm('确定要修改吗？', {title:'更换老师'}, function () {
                        var cid = data.cid;
                        layer.open({
                            type: 2, //弹出完整jsp ，1的时候弹出隐藏div
                            title: '更换老师',
                            shadeClose: true, //点击遮罩关闭弹框
                            content: 'changeTeacher?cid=' + cid,
                            area: ['500px', '400px'],
                            end: function () {
                                //刷新当前页面
                                $(".layui-laypage-btn").click();
                            }
                        });
                    });
                    break;

            }
        });

    });
</script>

</body>

</html>
