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
    <title>经理管理</title>
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
</head>
<body>
<div align="center">
    <h1 style="margin: 30px 0px 20px 0px">经理管理</h1>
    <table id="demo" lay-filter="test"></table>
</div>

<script type="text/html" id="toolbarDemo">
    <div align="right">
        <div class="layui-input-inline">
            <input type="text" id="filter" placeholder="请输入经理姓名" class="layui-input">
        </div>
        <div class="layui-btn-container layui-input-inline">
            <button class="layui-btn layui-btn-sm" lay-event="query">查询</button>
            <button class="layui-btn layui-btn-sm" lay-event="add">添加经理</button>
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
        var $ = layui.jquery;
        //第一个实例
        table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo' //添加工具栏
            , width: 800
            , url: '/getAllManagers' //数据接口
            , page: true//开启分页
            , limit: 5//每页显示几条数据
            , limits: [3, 5, 10, 20]
            , cols: [[ //表头
                {type: 'checkbox', width: 30, hide: true}
                , {field: 'id', title: '经理编号', width: 150, sort: true, hide: true}
                , {type: 'numbers', title: '序号', width: 200}
                , {field: 'mname', title: '经理姓名', width: 200}
                , {
                    field: 'deptno', title: '所属部门', width: 150,
                    templet: function (data) {
                        switch (data.deptno) {
                            case 2 :
                                return "研发中心";
                            case 3 :
                                return "技术部";
                            case 4 :
                                return "人力资源部";
                        }
                    }
                }
                , {field: 'tool', title: '操作', width: 200, toolbar: '#toolbarDemo1'}
            ]]
        });

        //监听事件 监听lay-filter为test的员工工具栏

        table.on('toolbar(test)', function (obj) {
            switch (obj.event) {
                case 'query':
                    var filter = $("#filter").val();
                    table.reload("demo", {//demo对应的是table的id
                        //where对应的是过滤条件
                        where: {name: filter},
                        page: {
                            curr: 1
                        }
                    });
                    break;
                case 'add':
                    layer.open({
                        type: 2, //弹出完整jsp ，1的时候弹出隐藏div
                        title: '添加经理',
                        shadeClose: true, //点击遮罩关闭弹框
                        content: 'addManager',
                        area: ['600px', '450px'],
                        end: function () {
                            //刷新当前页面
                            $(".layui-laypage-btn").click();
                        }
                    });
                    break;
                case 'delete':
                    //获取选中行
                    var checkStatus = table.checkStatus('demo');//demo为表格的id
                    //获取选中行的数据
                    var data = checkStatus.data;
                    if (data.length < 1) {
                        layer.msg('请选择要删除的老师');
                    } else {
                        layer.confirm('确认要删除吗？', '删除', function () {
                            var tid = "";
                            for (var i = 0; i < data.length; i++) {

                                if (data[i].state == 0) {
                                    layer.msg(data[i].tname + "正在授课期间，无法删除")
                                } else {
                                    tid += data[i].tid + ',';
                                }
                            }
                            tid = tid.substring(0, tid.length - 1);
                            /*location.href = "deleteTeacher?tid=" +tid;*/
                        });
                    }
                    break;
            }

        });


        //行内操作实现
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            switch (obj.event) {
                case 'del':
                    layer.confirm('确定要删除吗？', '删除命令', function () {
                        var id = data.id;
                        var mname = data.mname;
                        $.ajax({
                            url: "deleteManager",
                            type: "post",
                            data: {
                                id: id,
                                mname: mname
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


                    });
                    break;
                case 'update':
                    var id = data.id;
                    var mname = data.mname;
                    layer.open({
                        type: 2,//弹出完整div;type:1弹出隐藏div
                        title: '修改经理信息',
                        content: 'editManager1?id=' + id + '&mname=' + mname,
                        shadeClose: true,//点击遮罩，关闭弹框
                        area: ['800px', '500px'],
                        end: function () {
                            //刷新当前页
                            $(".layui-laypage-btn").click();
                        }
                    });
                    break;
            }
        });

    });
</script>

</body>

</html>
