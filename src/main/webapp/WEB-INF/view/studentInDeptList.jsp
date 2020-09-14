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
    </style>
</head>
<body>
<script type="text/html" id="toolbarDemo">
    <div align="left">
        <h2>学生列表</h2>
    </div>
    <div align="right">
        <div class="layui-input-inline">
            <input type="text" id="name" name="name" placeholder="请输入职工姓名" class="layui-input">
        </div>
        <button class="layui-btn layui-btn-sm" lay-event="query">查询</button>
    </div>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>
<script>
    layui.use(['table', "layer"], function () {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;
        //实现一个表格实例
        table.render({
            elem: '#demo'
            , width: 780
            , toolbar: '#toolbarDemo'//添加工具栏
            , url: '/getStudentByDeptno' //数据接口
            , page: true //开启分页
            , limit: 5//每页显示几条数据
            , limits: [5, 10, 15]
            , cols: [[ //表头
                {type: 'numbers', title: '序号', width: 80}
                , {field: 'sid', title: '编号', width: 220, hide: true}
                , {field: 'sname', title: '学生姓名',align:'center', width: 120}
                , {field: 'sex', title: '性别', align:'center', width: 100}
                , {field: 'birthday', title: '出生日期', align:'center', width: 110}
                , {field: 'phone', title: '电话', align:'center',width: 110}
                , {field: 'collegename', title: '所属学院', align:'center', width: 100}
                , {fixed: 'right', title: '操作', width: 150, align: 'center', toolbar: '#barDemo'}
            ]]
        });

        //监听事件监听lai-filter为test的元素的工具栏
        table.on('toolbar(test)', function (obj) {//obj只按钮
            switch (obj.event) {
                case 'query':
                    var name = $("#name").val();
                    table.reload("demo", {//demo对应table的id
                        where: {
                            name: name
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
            if (layEvent === 'delete') {
                layer.confirm("确定要删除吗？", "删除学生", function () {
                    var id = data.id;
                    $.ajax({
                        url: "deleteStudent",
                        type: "post",
                        data: {
                            id: id
                        },
                        success: function (data) {
                            if (data) {
                                layer.msg(data);
                            }
                            table.reload("demo", function () {
                                url:"getAllStudent"
                            })
                        },
                        error: function () {
                            layer.msg("执行失败")
                        }
                    })
                });
            } else if (layEvent === 'edit') {
                var cid = data.cid;
                layer.open({
                    type: 2,//弹出完整div,type=1,弹出隐藏div
                    title: '修改学生信息',
                    content: "toGetStudentById?cid=" + cid,
                    shadeClose: true,
                    area: ['680px', '570px'],
                    end: function () {
                        //刷新当前页
                        $(".layui-laypage-btn").click();
                    }
                })
            }
        });
    });
</script>
</body>
</html>
