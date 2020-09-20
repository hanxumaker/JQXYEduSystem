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
    <title>评分项管理</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>

    <style>
        .layui-table-tool-self {
            display: none;
        }
    </style>
    <style>
        .layui-table-cell .layui-form-checkbox[lay-skin="primary"] {
            top: 50%;
            transform: translateY(-50%)
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
    <h1 style="margin: 30px 0px 20px 0px">评分项管理</h1>
    <table id="demo" lay-filter="test"></table>
</div>

<script type="text/html" id="toolbarDemo">
    <div align="right">
        <div class="layui-btn-container layui-input-inline">
            <button class="layui-btn layui-btn-sm" lay-event="add">添加评分项</button>
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
            , url: '/getAllAnalytesList' //数据接口
            , page: false//关闭分页
            , cols: [[ //表头
                 {field: 'id', title: '编号', width: 150, sort: true, hide: true}
                , {type: 'numbers', title: '序号', width: 200}
                , {field: 'aname', title: '评分项', width: 200 }
                , {
                    field: 'state', title: '应用状态', width: 200,
                    templet: function (data) {
                        if (data.state == 0) {
                            return "已停用"
                        } else {
                            return "在使用"
                        }
                    }
                }
                , {field: 'tool', title: '操作', width: 200,
                    templet: function (data) {
                        if (data.state == 0) {
                            return "<button class='layui-btn layui-btn-sm' lay-event='update'>启用</button>" +
                                "<button class='layui-btn layui-btn-sm' lay-event='del'>删除</button>"
                        } else {
                            return "<button class='layui-btn layui-btn-danger layui-btn-sm' lay-event='update'>停用</button>" +
                            "<button class='layui-btn layui-btn-sm' lay-event='del'>删除</button>"
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
                        title: '添加评分项',
                        shadeClose: true, //点击遮罩关闭弹框
                        content: 'addAnalytes',
                        area: ['400px', '200px'],
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
                case 'del':
                    layer.confirm('确定要删除吗？', '删除', function () {
                        var id = data.id;
                        $.ajax({
                            url: "deleteAna",
                            type: "post",
                            data: {
                                id: id
                            },
                            success: function (data) {
                                layer.msg(data);
                                //重新加载表格
                                table.reload("demo", function () {
                                    url:"getAllAnalytesList"
                                })
                            },
                            error: function () {
                                layer.msg("执行失败")
                            }
                        })
                    });
                    break;
                case 'update':
                    layer.confirm('确定要修改吗？', '修改状态', function () {
                        var id = data.id;
                        var state = data.state;
                        $.ajax({
                            url: "updateAna",
                            type: "post",
                            data: {
                                id: id,
                                state : state
                            },
                            success: function (data) {
                                layer.msg(data);
                                //重新加载表格
                                table.reload("demo", function () {
                                    url :"getAllAnalytesList"
                                })
                            },
                            error: function () {
                                layer.msg("执行失败")
                            }
                        })
                    });
                    break;

            }
        });

    });
</script>

</body>

</html>
