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
    <style>
        .layui-table-tool-self {
            display: none;
        }

        .layui-table-cell .layui-form-checkbox[lay-skin="primary"] {
            top: 50%;
            transform: translateY(-50%)
        }
        table {
            background-color: #ffffff;
            border-collapse: collapse;
            font-size: large;
        }

        table td {
            width: 200px;
            text-align: center;
            height: 70px;
            border: 1px solid;
        }
        table th{
            align-content: center;
        }
        .layui-input{
            border: none;

        }
    </style>
</head>
<body>
<div class="layui-col-md8 layui-col-md-offset2" style="margin: 30px 30px">
    <table align="center" class="layui-table">
        <tr>
            <td>姓名</td>
            <td>
                <div>
                    <input type="text" id="sname" class="layui-input">
                </div>
            </td>
            <td>性别</td>
            <td>
                <div>
                    <input type="text" id="sex" class="layui-input">
                </div>
            </td>
            <td>民族</td>
            <td>
                <div>
                    <input type="text" id="nation" class="layui-input">
                </div>
            </td>
            <td rowspan="2">
                <div class="layui-upload layui-input-inline" id="uploadBtn">
                    <div class="layui-upload-list " style="float:left">
                        <!--上传完立马显示照片  -->
                        <img class="layui-upload-img" id="imgShow">
                        <!--上传后提示信息 -->
                        <span id="uploadInfo"></span>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>出生年月</td>
            <td>
                <div>
                    <input type="date" id="birthday" class="layui-input">
                </div>
            </td>
            <td>籍贯</td>
            <td>
                <div>
                    <input type="text" id="address" class="layui-input">
                </div>
            </td>
            <td>婚否</td>
            <td>
                <div>
                    <input type="text" id="married" class="layui-input">
                </div>
            </td>
        </tr>
        <tr>
            <td>联系电话</td>
            <td colspan="2">
                <div>
                    <input type="text" id="phone" class="layui-input">
                </div>
            </td>
            <td>身份证号码</td>
            <td colspan="3">
                <div>
                    <input type="text" id="idCard" class="layui-input">
                </div>
            </td>
        </tr>
        <tr>
            <td>毕业院校</td>
            <td colspan="2">
                <div>
                    <input type="text" id="school" class="layui-input">
                </div>
            </td>
            <td>专业</td>
            <td colspan="3">
                <div>
                    <input type="text" id="major" class="layui-input">
                </div>
            </td>
        </tr>
    </table>
    <%-- 照片--%>
    <!--这里隐藏的输入框是为了给照片属性赋值  -->
    <input type="hidden" name="photo" id="photo">

</div>
<div style="margin: 30px 20px 10px 700px">
    <button id="update" type="button" class="layui-btn">修改</button>
</div>
<script>
    layui.use(['form', 'layer', 'jquery', 'upload'], function () {
        var form = layui.form;
        var layer = layui.layer;
        var upload = layui.upload;
        $ = layui.jquery;
        var sid = ${param.sid};


        $.ajax({
            url:"getStudentToEdit",
            type:"get",
            dataType:"json",
            data:{
                sid: sid
            },
            success:function(data){
                $("#sname").val(data.sname);
                $("#sex").val(data.sex);
                $("#nation").val(data.nation);
                $("#birthday").val(data.birthday);
                $("#address").val(data.address);
                $("#married").val(data.married);
                $("#idCard").val(data.idCard);
                $("#school").val(data.school);
                $("#phone").val(data.phone);
                $("#photo").val(data.photo);
                $("#major").val(data.major);

                $("#imgShow").attr('src', data.photo);
                $("#imgShow").css({"width": "80px", "height": "100px"});

                form.render();
            },
            error:function (data) {
                layer.msg("执行失败");
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

        $("#update").click(function () {
            //添加非空验证
            $.ajax({
                url: 'updateStu',
                type: 'post',
                data: {
                    sid:sid,
                    sname: $("#sname").val(),
                    sex: $('#sex').val(),
                    birthday: $("#birthday").val(),
                    phone: $("#phone").val(),
                    nation: $("#nation").val(),
                    address: $("#address").val(),
                    photo: $("#photo").val(),
                    married: $('#married').val(),
                    idCard: $("#idCard").val(),
                    school: $("#school").val(),
                    major: $("#major").val(),
                    //cid: $("#classfilter").val(),

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
