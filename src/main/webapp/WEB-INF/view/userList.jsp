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
    <h1 style="margin: 30px 0px 20px 0px">用户信息</h1>
    <table id="demo" lay-filter="test"></table>
</div>

<script type="text/html" id="toolbarDemo">
    <div align="right">
        <div class="layui-input-inline">
            <input type="text" id="filter" placeholder="请输入用户姓名" class="layui-input">
        </div>
        <div class="layui-btn-container layui-input-inline">
            <button class="layui-btn layui-btn-sm" lay-event="query">查询</button>
        </div>
    </div>
</script>

<script type="text/html" id="toolbarDemo1">
    <div class="layui-btn-container layui-input-inline">
        <button class="layui-btn layui-btn-sm" lay-event="reset">重置密码</button>
    </div>
</script>
<script>
    layui.use(['table', 'layer'], function () {
        var table = layui.table;
        var $ = layui.jquery;
        //第一个实例
        table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo' //添加工具栏
            , width: 910
            , url: '/getAllUsers' //数据接口
            , page: true//开启分页
            , limit: 5//每页显示几条数据
            , limits: [3, 5, 10, 20]
            , cols: [[ //表头
                {type: 'numbers', title: '序号', width: 200}
                , {field: 'id', title: '登录账号', width: 150, sort: true}
                , {field: 'uname', title : '用户姓名',width: 200}
                , {field: 'phoneNum', title: '用户电话', width: 200,hide:true}
                , {field: 'role', title: '权限', width: 150,
                    templet: function (data) {
                        if (data.role == 1) {
                            return "管理员"
                        } else if (data.role == 2){
                            return "老师"
                        }else {
                            return "经理"
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
                    table.reload("demo",{//demo对应的是table的id
                        //where对应的是过滤条件
                        where:{uname:filter},
                        page:{
                            curr:1
                        }
                    });
                    break;

            }

        });


        //行内操作实现
        table.on('tool(test)', function(obj){
            var data = obj.data;
            var layer = layui.layer;
            var $ = layui.jquery;
            switch(obj.event) {
                case 'reset':
                    layer.confirm('确定要重置密码吗？', '重置', function () {
                        var id = data.id;
                            $.ajax({
                                url: "resetUser",
                                type: "post",
                                data: {
                                    id: id
                                },
                                success: function (data) {
                                    layer.msg(data);
                                    //重新加载表格
                                    table.reload("demo", function () {
                                        url:"getAllUsers"
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
