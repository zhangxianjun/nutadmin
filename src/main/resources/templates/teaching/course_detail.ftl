<!DOCTYPE html>
<html lang="en" style="height: 100%; width: 100%;">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="../static/js/jquery.js"></script>
    <script src="../static/js/layer/layer.js"></script>
    <link rel="stylesheet" href="../static/css/main.css">
</head>
<body>
<h1 style="margin-left: 10px; font-size: 16px">课程详情</h1>
<table style="margin-left: 10px;">
    <tr>
        <td>时段ID</td>
        <td><label id="lessonId">${model.lessonId}</label></td>
    </tr>
    <tr>
        <td>学生年级</td>
        <td>
            <#if model.grade == 0>
                <label>小学：</label><input type="radio" name="grade" value="0" checked="checked"/><br/>
            <#else>
                <label>小学：</label><input type="radio" name="grade" value="0"/><br/>
            </#if>
            <#if model.grade == 1>
                <label>初一：</label><input type="radio" name="grade" value="1" checked="checked"/><br/>
            <#else>
                <label>初一：</label><input type="radio" name="grade" value="1"/><br/>
            </#if>
            <#if model.grade == 2>
                <label>初二：</label><input type="radio" name="grade" value="2" checked="checked"/><br/>
            <#else>
                <label>初二：</label><input type="radio" name="grade" value="2"/><br/>
            </#if>
            <#if model.grade == 3>
                <label>初三：</label><input type="radio" name="grade" value="3" checked="checked"/><br/>
            <#else>
                <label>初三：</label><input type="radio" name="grade" value="3"/><br/>
            </#if>
        </td>
    </tr>
    <tr>
        <td>学生名字</td>
        <td>
            <#assign list = "${model.students}"?eval>
            <#list list as m>
                <button>${m.name}</button>
            </#list>
            <button>添加学生</button>
        </td>
    </tr>
    <tr>
        <td>
            <button id="save">修改</button>
        </td>
    </tr>
</table>
</body>
<script>
    $("#save").click(function () {
        var lessonId = $("#lessonId").html();
        var form = $('input:radio[name=form]:checked').val();
        var grade = $('input:radio[name=grade]:checked').val();
        var students = $('input[name=students]').val();
        $.ajax({
            type: 'POST',
            contentType: "application/json; charset=UTF-8",
            url: '/course/save',
            data: JSON.stringify({
                lessonId: lessonId,
                form: form,
                grade: grade,
                students: students
            }),
            success: function (data) {
                window.location.href = '/course'
            }
        })
    });
</script>
</html>