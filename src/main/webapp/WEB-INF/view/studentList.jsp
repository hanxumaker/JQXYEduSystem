<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>学生管理</title>
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
    <h1 style="margin: 30px 0px 20px 0px">学生管理</h1>
    <table id="demo" lay-filter="test"></table>
</div>

<script type="text/html" id="toolbarDemo">
    <div align="right">
        <div class="layui-input-inline">
            <input type="text" id="filter" placeholder="请输入学生姓名" class="layui-input">
        </div>
        <div class="layui-input-inline">
            <select id="classfilter" class="layui-form-select">
                <option value="">请选择班级</option>
                <c:forEach var="class123" items="${class123}">
                    <option value="${class123.cid}">${class123.cname}</option>
                </c:forEach>
            </select>
        </div>

        <div class="layui-btn-container layui-input-inline">
            <button class="layui-btn layui-btn-sm" lay-event="query">查询</button>
            <button class="layui-btn layui-btn-sm" lay-event="add">添加学生</button>
            <%--
                        <button class="layui-btn layui-btn-sm" lay-event="delete">删除</button>
            --%>
        </div>
    </div>

</script>
<script type="text/html" id="toolbarDemo1">
    <div class="layui-btn-container layui-input-inline">
        <button class="layui-btn layui-btn-sm" lay-event="update">修改</button>
        <button class="layui-btn layui-btn-sm" lay-event="del">删除</button>
    </div>
</script>
<script>
    layui.use(['table', 'layer'], function () {
        var table = layui.table;
        var layer = layui.layer;
         $ = layui.jquery;
        //第一个实例
        table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo' //添加工具栏
            , width: 1370
            , url: '/getAllStudents' //数据接口
            , page: true//开启分页
            , limit: 5//每页显示几条数据
            , limits: [3, 5, 10, 20]
            , cols: [[ //表头
                {field: 'sid', title: '学号', width: 150, sort: true, hide: true, align: 'center',}
                , {type: 'numbers', title: '学生序号', width: 100, align: 'center'}
                , {field: 'sname', title: '姓名', width: 100, align: 'center'}
                , {field: 'sex', title: '性别', width: 100, align: 'center'}
                , {field: 'nation', title: '民族', width: 100, align: 'center'}
                , {field: 'address', title: '家庭住址', width: 150, align: 'center'}
                , {field: 'school', title: '学校', width: 150, align: 'center'}
                , {field: 'major', title: '专业', width: 150, align: 'center'}
                , {field: 'birthday', title: '出生年份', width: 150, align: 'center'}
                , {field: 'phone', title: '电话号码', width: 150, align: 'center'}
                , {field: 'state', title: '状态', width: 150, align: 'center',hide: true}
                , {field: 'tool', title: '操作', width: 200, toolbar: '#toolbarDemo1',align: 'center'}
            ]]
        });

        //监听事件 监听lay-filter为test的员工工具栏

        table.on('toolbar(test)', function (obj) {

            switch (obj.event) {
                case 'query':
                    var filter = $("#filter").val();
                    var cid = $("#classfilter").val();
                    table.reload("demo", {//demo对应的是table的id
                        //where对应的是过滤条件
                        where: {
                            sname: filter,
                            cid: cid
                        },
                        page: {
                            curr: 1
                        }
                    });
                    break;
                case 'add':
                    layer.open({
                        type: 2, //弹出完整jsp ，1的时候弹出隐藏div
                        title: '添加学生',
                        shadeClose: true, //点击遮罩关闭弹框
                        content: 'addStudent',
                        area: ['1000px', '600px'],
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
                    layer.confirm('确定要删除吗？', '删除命令', function () {
                        var id = data.sid;
                        if (data.state > 5) {
                            layer.msg(data.sname + "已经工作了，无法删除")
                        } else {
                            $.ajax({
                                url: "deleteStudent",
                                type: "post",
                                data: {
                                    sid: id
                                },
                                success: function (data) {
                                    layer.msg(data);
                                    //重新加载表格
                                    table.reload("demo", function () {
                                        url:"getAllTeachers"
                                    })
                                },
                                error: function () {
                                    layer.msg("执行失败")
                                }
                            })
                        }

                    });
                    break;
                case 'update':
                    var sid = data.sid;
                    layer.open({
                        type: 2,//弹出完整div;type:1弹出隐藏div
                        title: '修改学生信息',
                        content: 'editStudent?sid=' + sid ,
                        shadeClose: true,//点击遮罩，关闭弹框
                        area: ['900px', '500px'],
                        end: function () {
                            //刷新当前页
                            $(".layui-laypage-btn").click();
                        }
                    });
                    break;
            }
        });


    });
    var closeAdd = function () {
        parent.location.reload();//刷新父页面
    }
</script>

</body>

</html>
