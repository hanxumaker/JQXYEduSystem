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
    <title>老师管理</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>

    <style>
        .layui-table-tool-self {
            display: none;
        }
    </style>
    <style>
        .layui-table-cell .layui-form-checkbox[lay-skin="primary"]{top: 50%;transform: translateY(-50%)}
    </style>
</head>
<body>
<div align="center">
    <h1 style="margin: 30px 0px 20px 0px">老师管理</h1>
    <table id="demo" lay-filter="test"></table>
</div>

<script type="text/html" id="toolbarDemo">
    <div align="right">
        <div class="layui-input-inline">
            <input type="text" id="filter" placeholder="请输入老师姓名" class="layui-input">
        </div>
        <div class="layui-btn-container layui-input-inline">
            <button class="layui-btn layui-btn-sm" lay-event="query">查询</button>
            <button class="layui-btn layui-btn-sm" lay-event="add">添加老师</button>
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
            , width: 1000
            , url: '/getAllTeachers' //数据接口
            , page: true//开启分页
            , limit:5//每页显示几条数据
            , limits:[3,5,10,20]
            , cols: [[ //表头
                {type: 'checkbox', width: 30,hide:true}
                , {field: 'tid', title: '老师编号', width: 150, sort: true ,hide:true}
                , {type: 'numbers' ,title: '序号',width: 200}
                , {field: 'tname', title: '老师姓名', width: 200}
                , {field: 'cid', title: '所带班级', width: 150}
                , {field: 'state', title: '老师状态', width: 200,
                    templet: function (data) {
                        if (data.state == 0) {
                            return "授课中"
                        } else {
                            return "休息"
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
                        where:{name:filter},
                        page:{
                            curr:1
                        }
                    });
                    break;
                case 'add':
                    layer.open({
                        type:2, //弹出完整jsp ，1的时候弹出隐藏div
                        title:'添加老师',
                        shadeClose:true, //点击遮罩关闭弹框
                        content:'addTeacher',
                        area:['800px','400px'],
                        end:function () {
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
                        layer.confirm('确认要删除吗？','删除',function () {
                            var tid = "";
                            for (var i = 0; i < data.length; i++) {

                                if (data[i].state == 0){
                                    layer.msg(data[i].tname + "正在授课期间，无法删除")
                                }else{
                                    tid += data[i].tid+ ',';
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
        table.on('tool(test)', function(obj){
            var data = obj.data;
            switch(obj.event) {
                case 'del':
                    layer.confirm('确定要删除吗？', '删除命令', function () {
                        var tid = data.tid;
                        var tname = data.tname;
                        if (data.state == 0){
                            layer.msg(data[i].tname + "正在授课期间，无法删除")
                        }else{
                            $.ajax({
                                url: "deleteTeacher",
                                type: "post",
                                data: {
                                    tid: tid,
                                    tname: tname
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
                    var tid = data.tid;
                    var tname = data.tname;
                    layer.open({
                        type:2,//弹出完整div;type:1弹出隐藏div
                        title:'修改老师信息',
                        content:'editTeacher1?tid=' + tid + '&tname=' + tname,
                        shadeClose:true,//点击遮罩，关闭弹框
                        area:['800px','500px'],
                        end:function () {
                            //刷新当前页
                            $(".layui-laypage-btn").click();
                        }
                    });
                    break;
            }
        });

        var closeAdd = function () {
            parent.location.reload();//刷新父页面
        }
    });

</script>

</body>

</html>
