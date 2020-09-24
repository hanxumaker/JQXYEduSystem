<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/13
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>班级学生页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-table-tool-self{
            display: none;
        }
        .layui-icon-ok{
            margin-top: 10px;
        }
        .layui-table-tool-temp {
            padding-right: 0px;
        }
    </style>
</head>
<body>
<div align="center">
    <table id="demo" lay-filter="test"></table>
</div>
<script type="text/html" id="toolbarDemo">
    <div align="left"><h1>学生名单</h1></div>
    <div align="right" style="width: 600px;">
        <div class="layui-input-inline">
            <input type="text" id="filter" placeholder="请输入姓名" class="layui-input" width="40px" style="float: left">
        </div>
        <div class="layui-input-inline">
            <button class="layui-btn layui-btn-sm" lay-event="query">查询</button>
            <button class="layui-btn layui-btn-sm" lay-event="selectStudent">详细信息</button>
        </div>
    </div>
</script>
<script type="text/html" id="barDemo">
    <div class="layui-input-inline">
        <button class="layui-btn layui-btn-sm" lay-event="score" id="score">评分</button>
        <button class="layui-btn layui-btn-sm layui-btn-warm" lay-event="select">查看</button>
    </div>
</script>
<script>
    layui.use(['table','layer','jquery'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;

        //第一个实例
        table.render({
            elem: '#demo'
            ,toolbar: '#toolbarDemo'//添加工具栏
            ,height: 380
            ,width:910
            ,url: '/getAllStudent' //数据接口
            ,page:true //开启分页
            ,limit:5 // 每页显示几条数据
            ,limits:[5,10,15,20]
            ,cols: [[ //表头
                 {type:'checkbox'}
                ,{field: 'sid', title: '学号', width:150, sort: true,hide:true,align:'center',}
                ,{type:'numbers',title:'学生序号',width:100,align:'center'}
                ,{field: 'sname', title: '姓名', width:150,align:'center'}
                ,{field: 'sex', title: '性别', width:150, sort:true,align:'center'}
                ,{field: 'birthday', title: '出生年份', width:150,align:'center'}
                ,{field: 'phone', title: '电话号码', width:150,align:'center'}
                ,{field: 'state', title: '学生状态', hide:true,width:150,align:'center'}
                ,{field: 'deptno', title: '部门编号', hide:true,width:150,align:'center'}
                ,{field: '', title: '操作', width:150, sort:true,align:'center',toolbar:'#barDemo'}
            ]]
        });
        //监听事件,监听lay-filter="test"的元素的工具栏
        table.on('toolbar(test)', function(obj){
            switch(obj.event){
                case 'query':
                    //获取查询条件
                    var filter = $("#filter").val();
                    table.reload("demo",{//重新加载表格
                        where:{//where过滤条件
                            sname:filter
                        },
                        page:{
                            curr:1//从第一页开始取数据
                        }
                    });
                    var filter = $("#filter").val(filter);
                    break;
                case 'selectStudent':
                    //获取选中行
                    var checkStatus = table.checkStatus('demo'); //demo为表格id
                    //获取选中行的数据
                    var data = checkStatus.data;
                    if (data.length<1){
                        layer.msg("请选择一条要查看的学生", {icon: 1})
                    }else if (data.length>1){
                        layer.msg("只能选择一位学生进行查看", {icon: 2})
                    }else {
                        //获取要查看的学生编号
                        var sids = data[0].sid;
                        //根据学生编号获取学生的详细信息
                        layer.open({
                            type:2,//弹出完整div;type:1弹出隐藏div
                            title:'学生信息',
                            content:'studentInByCid?sids=' + sids,
                            shadeClose:true,//点击遮罩，关闭弹框
                            area:['680px','300px'],
                            end:function () {
                                //刷新当前页
                                $(".layui-laypage-btn").click();
                            }
                        });
                    }
                    break;
            }
        });

        //行监听事件
        table.on('tool(test)', function(obj){
            var data = obj.data;//得到这一行的值
            var state = data.state;
            var sid = data.sid;
            var deptno = data.deptno;
            switch(obj.event) {
                case 'select':
                    layer.open({
                        type:2,//弹出完整div;type:1弹出隐藏div
                        title:'学生成绩',
                        content:'selectStudentScore?sid=' + sid,
                        shadeClose:true,//点击遮罩，关闭弹框
                        area:['360px','400px']
                    });
                    break;
                case 'score':
                    if(data.state > 5){
                        layer.msg(data.sname + "已经毕业，无法打分", {icon: 2})
                    }else if(data.state < 5){
                        layer.msg(data.sname + "已经评过分了，无法在进行打分", {icon: 2})
                    }
                    else{
                        layer.open({
                            type:2,//弹出完整div;type:1弹出隐藏div
                            title:'老师评分',
                            content:'teacherScore?state=' + state + "&sid=" + sid+ "&deptno=" + deptno,
                            shadeClose:true,//点击遮罩，关闭弹框
                            area:['350px','400px']
                        });
                    }
                    break;
            }
        });
    });
</script>
</body>
</html>
