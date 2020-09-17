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
            <button class="layui-btn layui-btn-sm" lay-event="submit" id="sub">提交</button>
        </div>
    </div>
</script>
<script>
    layui.use(['table','layer','jquery'], function() {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;

        //第一个实例
        table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo'//添加工具栏
            , url: '/getTeacherScore' //数据接口
            , page: false
            , cols: [[ //表头
                {type: 'checkbox'}
                , {field: 'courseid', title: '课程编号', width: 165, sort: true, align: 'center',hide:'true'}
                , {field: 'coursename', title: '课程', width: 165, sort: true, align: 'center'}
                , {field: 'state', title: '状态', hide:'true', width: 100, sort: true, align: 'center'}
                , {field: 'score', title: '分数', width: 160, align: 'center',edit:'text'}
            ]],
            /*//根据课程状态(已经打过分)将其设置为不可编辑的，即打过分的课程不能在打分
            done:function (res, curr, count) {
                let tableView = this.elem.next();// 当前表格渲染之后的视图
                layui.each(res.data, function(i, item) { //遍历整个表格数据
                    if (item.state = 0) {
                        tableView.find('tr[data-index=' + i + ']').find('td').data('edit', false);
                        tableView.find('tr[data-index=' + i + ']').find('td').click(function () {
                            layer.msg("该课现在已经打过分了，不能进行评分")
                        })
                    }
                })
            }*/
        });
        //监听单元格编辑
        table.on('edit(tableDemo)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,filed = obj.filed; //得到字段
        });
        //监听事件,监听lay-filter="test"的元素的工具栏
        table.on('toolbar(test)', function(obj){
            var data = obj.data;
            var dataBak = [];   //定义一个空数组,用来存储之前编辑过的数据已经存放新数据
            var tableBak = layui.table.cache.demo;
            //获取之前编辑过的全部数据，前提是编辑数据是要更新缓存，stock_add_table 为表格的id
                for (var i = 0; i < tableBak.length; i++) {
                    if(tableBak[i].score){
                        dataBak.push(tableBak[i]);      //将之前的数组备份
                    }
                }
            switch(obj.event){
                case 'submit':
                    layer.msg('还有课程未进行评分，现在不能提交', {icon: 6});
                    for (var j = 0; j < dataBak.length; j++) {
                        if(!dataBak[j].score) {
                            layer.msg('还有课程未进行评分，现在不能提交', {icon: 6});
                        }else{
                            $("dataBak[j].score").blur(function () {
                                if(dataBak[j].score < '0'){
                                    layer.msg('分数不能为负数', {icon: 6});
                                }else if(dataBak[j].score > '100'){
                                    layer.msg('分数不能为大于100', {icon: 6});
                                }
                            })
                        }
                    }
                    if(dataBak.length == tableBak.length){
                        layer.confirm("确定要提交吗？提交之后不可在次修改",function () {
                            $.ajax({
                                url:'gradeList',
                                type:'post',
                                data:{
                                    stuScore:JSON.stringify(dataBak),
                                    sid:'${sid}'
                                },
                                success:function (data) {
                                    if(data){
                                        layer.msg('提交成功');
                                    }else{
                                        layer.msg('提交失败');
                                    }
                                },
                                error:function (data) {
                                    layer.msg("执行失败");
                                }
                            });
                        })










                    }
            }
        });
    })
</script>
</body>
</html>

