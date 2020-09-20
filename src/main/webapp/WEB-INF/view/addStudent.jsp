<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/16
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生增加</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<form class="layui-form">
    <!--用户名-->
    <div class="layui-form-item " style="margin-top: 50px">
        <label class="layui-form-label layui-required" style="margin-left: 150px">学员姓名</label>
        <div class="layui-input-block">
            <input type="text" id="sname" required lay-verify="required" placeholder="请输入学员姓名" lay-reqtext="名称不可为空!"
                   autocomplete="off" class="layui-input" style="width: 280px; border-radius: 10px ">
        </div>
    </div>
    <!--性别-->
    <div class="layui-form-item ">
        <label class="layui-form-label layui-required2" style="margin-left: 150px">性别</label>
        <div class="layui-input-inline" style="margin-left: 0;margin-top: 0">
            <input type="radio" name="sex" value="男" title="男" checked>
            <input type="radio" name="sex" value="女" title="女">
        </div>
    </div>
    <%-- 民族--%>
    <div class="layui-form-item">
        <label class="layui-form-label" style="margin-left: 150px">民族</label>
        <div class="layui-input-inline" style="width: 200px">
            <select id="nation">

            </select>
        </div>
    </div>
    <%--出生年月--%>
    <div class="layui-form-item ">
        <label class="layui-form-label layui-required" style="margin-left: 150px">出生年月</label>
        <div class="layui-input-block">
            <input type="date" id="birthday" name="birthday" lay-verify="required" placeholder="请选择学员出生日期"
                   autocomplete="off" class="layui-input" style="width: 280px; border-radius: 10px ">
        </div>
    </div>
    <%-- 籍贯--%>
    <div class="layui-form-item" id="area-picker">
        <div class="layui-form-label" style="margin-left: 150px">籍贯</div>
        <div class="layui-input-inline" style="width: 160px;">
            <select name="province" id="province" class="province-selector" data-value="山东省" lay-filter="province-1">
                <option value="">请选择省</option>
            </select>
        </div>
        <div class="layui-input-inline" style="width: 160px;">
            <select name="city" id="city" class="city-selector" data-value="济南市" lay-filter="city-1">
                <option value="">请选择市</option>
            </select>
        </div>
        <div class="layui-input-inline" style="width: 160px;">
            <select name="county" id="county" class="county-selector" data-value="历下区" lay-filter="county-1">
                <option value="">请选择区</option>
            </select>
        </div>
    </div>
    <!--是否婚配-->
    <div class="layui-form-item ">
        <label class="layui-form-label layui-required2" style="margin-left: 150px">婚否</label>
        <div class="layui-input-inline" style="margin-left: 0;margin-top: 0">
            <input type="radio" name="marry" value="是" title="是">
            <input type="radio" name="marry" value="否" title="否" checked>
        </div>
    </div>
    <%-- 照片--%>
    <!--这里隐藏的输入框是为了给照片属性赋值  -->
    <input type="hidden" name="photo" id="photo">
    <div class="layui-form-item">
        <label class="layui-form-label" style="margin-left: 150px">照片</label>
        <div class="layui-upload layui-input-inline">
            <div class="layui-col-md12">
                <button type="button" class="layui-btn" id="uploadBtn">点击上传图片</button>
            </div>
            <div class="layui-upload-list" style="float:left">
                <!--上传完立马显示照片  -->
                <img class="layui-upload-img" id="imgShow">
                <!--上传后提示信息 -->
                <span id="uploadInfo"></span>
            </div>
        </div>
    </div>
    <%-- 联系电话--%>
    <div class="layui-form-item ">
        <label class="layui-form-label layui-required" style="margin-left: 150px">联系电话</label>
        <div class="layui-input-block">
            <input type="text" id="phone" required lay-verify="required|telephone" placeholder="请输入联系电话" lay-reqtext=""
                   autocomplete="off" class="layui-input" style="width: 280px; border-radius: 10px ">
        </div>
    </div>
    <%-- 身份证号--%>
    <div class="layui-form-item ">
        <label class="layui-form-label layui-required" style="margin-left: 150px">身份证号</label>
        <div class="layui-input-block">
            <input type="text" id="idcard" required lay-verify="required|identity" placeholder="请输入身份证号" lay-reqtext=""
                   autocomplete="off" class="layui-input" style="width: 280px; border-radius: 10px ">
        </div>
    </div>
    <%-- 毕业学校--%>
    <div class="layui-form-item ">
        <label class="layui-form-label layui-required" style="margin-left: 150px">毕业学校</label>
        <div class="layui-input-block">
            <input type="text" id="school" required lay-verify="required" placeholder="请输入毕业学校" lay-reqtext=""
                   autocomplete="off" class="layui-input" style="width: 280px; border-radius: 10px ">
        </div>
    </div>
    <%-- 专业--%>
    <div class="layui-form-item ">
        <label class="layui-form-label layui-required" style="margin-left: 150px">学员专业</label>
        <div class="layui-input-block">
            <input type="text" id="major" required lay-verify="required" placeholder="请输入学员专业" lay-reqtext=""
                   autocomplete="off" class="layui-input" style="width: 280px; border-radius: 10px ">
        </div>
    </div>

    <%-- 培训班级--%>
    <div class="layui-form-item " style="margin-left: 150px">
        <label class="layui-form-label layui-required">学员班级</label>
        <div class="layui-input-block" style="width: 280px">
            <select id="classfilter" class="layui-form-select">
                <option value="">请选择班级</option>
                <c:forEach var="class123" items="${class123}">
                    <option value="${class123.cid}">${class123.cname}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="layui-form-item" align="center">
        <button class="layui-btn" lay-filter="formDemo" id="add">添加</button>
        <button type="reset" class="layui-btn layui-btn-primary" id="reset">重置</button>
    </div>
</form>

<script>
    //配置省事联动插件目录
    layui.config({
        base: '../../static/mods/'
        , version: '1.0'
    });

    layui.use(['form', 'layer', 'jquery', 'layarea', 'upload'], function () {
        var form = layui.form;
        var layer = layui.layer;
        var layarea = layui.layarea;
        var upload = layui.upload;
        $ = layui.jquery;

        //民族下拉框
        var nations = ["汉族", "蒙古族", "回族", "藏族", "维吾尔族", "苗族", "彝族", "壮族", "布依族", "朝鲜族", "满族", "侗族", "瑶族", "白族",
            "土家族", "哈尼族", "哈萨克族", "傣族", "黎族", "傈僳族", "佤族", "畲族", "高山族", "拉祜族", "水族", "东乡族", "纳西族", "景颇族", "柯尔克孜族", "土族",
            "达斡尔族", "仫佬族", "羌族", "布朗族", "撒拉族", "毛南族", "仡佬族", "锡伯族", "阿昌族", "普米族", "塔吉克族", "怒族", "乌孜别克族", "俄罗斯族", "鄂温克族",
            "德昂族", "保安族", "裕固族", "京族", "塔塔尔族", "独龙族", "鄂伦春族", "赫哲族", "门巴族", "珞巴族", "基诺族"];
        var option = "";
        for (var i = 0; i < nations.length; i++) {
            option += '<option value="' + nations[i] + '">' + nations[i] + '</option>';
        }
        $(option).appendTo("#nation");

        //省市级联
        layarea.render({
            elem: '#area-picker',
            change: function (res) {
                //选择结果
                //console.log(res);
            }
        });

        form.render();

        //上传图片
        <!--图片上传  -->
        var uploadInst = upload.render({
            elem: '#uploadBtn'
            , url: '/uploadImg'
            , accept: 'E:\\idea\\workspace\\框架\\JQXYEduSystem\\src\\main\\webapp\\static\\imgs'
            , size: 50000
            , before: function (obj) {
                obj.preview(function (index, file, result) {
                    //console.log(result);
                    //上传完立即显示图像
                    var imgShow = $('#imgShow');
                    imgShow.attr('src', result);
                    imgShow.css({"width": "80px", "height": "100px"});
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功提示信息
                var uploadInfo = $('#uploadInfo');
                uploadInfo.html('<span style="color: #4cae4c;">上传成功</span>');

                //上传成功将地址信息赋值给存储照片的属性
                var fileupload = $(".image");
                fileupload.attr("value", res.data);
                $("#photo").attr("value", res.src);
                // console.log(fileupload.attr("value"));
            }
            , error: function () {
                //上传失败
                var demoText = $('#demoText');
                demoText.html('<span style="color: red;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

        //点击事件

        $("#add").click(function () {
            //添加非空验证
            var stuPlace = $("#province").val() + $("#city").val() + $("#county").val();
            $.ajax({
                url: 'addStu',
                type: 'post',
                data: {
                    sname: $("#sname").val(),
                    sex: $('input[name="sex"]:checked').val(),
                    birthday: $("#birthday").val(),
                    phone: $("#phone").val(),
                    nation: $("#nation").val(),
                    address: stuPlace,
                    photo: $("#photo").val(),
                    married: $('input[name="marry"]:checked').val(),
                    idCard: $("#idcard").val(),
                    school: $("#school").val(),
                    major: $("#major").val(),
                    cid: $("#classfilter").val(),
                    deptno: 1,
                    state: 5
                },
                success: function (data) {
                    layer.msg(data);
                    setTimeout('closeAdd()', 1000)
                },
                error: function () {
                    layer.msg("执行失败");
                }
            });
        })
    });
    function closeAdd() {
        parent.location.reload();//刷新父页面
    }
</script>
</body>
</html>
