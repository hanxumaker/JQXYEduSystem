<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/9/13
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>部门员工列表</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-table-tool-self {
            display: none;
        }

        .layui-table-cell .layui-form-checkbox[lay-skin="primary"] {
            top: 50%;
            transform: translateY(-50%)
        }
        .layui-table-tool-temp{
            padding-right:0px;
        }
    </style>
</head>
<body>
<div align="center">
    <span style="font-size: 25px;font-family: 华文楷体;font-weight: bold;">金桥员工列表</span>
</div>
<div align="center">
    <table id="demo" lay-filter="test"></table>
</div>
<script type="text/html" id="toolbarDemo">
    <div align="right">
        <div class="layui-input-inline">
            <input type="text" id="sname" name="sname" placeholder="请输入员工姓名" class="layui-input">
        </div>
        <button class="layui-btn layui-btn-sm" lay-event="query">查询</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="check">查看</a>
</script>
<script>
    layui.use(['table', "layer","form"], function () {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;
        //实现一个表格实例
        table.render({
            elem: '#demo'
            , width: 790
            , toolbar: '#toolbarDemo'//添加工具栏
            , url: '/getStudentsByDeptno' //数据接口
            , where: {
                deptno:${deptno}
            }
            , page: true //开启分页
            , limit: 5//每页显示几条数据
            , limits: [5, 10, 15]
            , cols: [[ //表头
                {type: 'numbers', title: '序号', width: 80}
                , {field: 'sid', title: '编号', width: 220, hide: true}
                , {field: 'sname', title: '姓名', align: 'center', width: 100}
                , {field: 'sex', title: '性别', align: 'center', width: 100}
                , {field: 'address', title: '籍贯', align: 'center', width: 80}
                , {field: 'phone', title: '电话', align: 'center', width: 100}
                , {field: 'school', title: '毕业学校', align: 'center', width: 100}
                , {
                    field: 'state', title: '状态', align: 'center', width: 100,
                    templet: function (data) {
                        switch (data.state) {
                            case 9:
                                return "工作三年";
                            case 8:
                                return "工作两年";
                            case 7:
                                return "工作一年";
                            case 6:
                                return "转正期";
                        }
                    }
                }
                , {fixed: 'right', title: '操作', width: 120, align: 'center', toolbar: '#barDemo'}
            ]]
        });

        //监听事件监听lai-filter为test的元素的工具栏
        table.on('toolbar(test)', function (obj) {//obj只按钮
            switch (obj.event) {
                case 'query':
                    var sname = $("#sname").val();
                    table.reload("demo", {//demo对应table的id
                        where: {
                            sname: sname
                        },//where代表过滤条件
                        page: {
                            curr: 1
                        }
                    });
                    break;
            }
        });
        //监听行工具事件
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'check') {
                location.href = "toCheckEvaluation?sid=" + data.sid;
            }
        });
    });
</script>
</body>
</html>
