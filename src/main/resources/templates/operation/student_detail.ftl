<!DOCTYPE html>
<html lang="en" style="height: 100%; width: 100%;">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="./js/jquery.js"></script>
    <link rel="stylesheet" href="./css/main.css">
</head>
<body>
<h1 style="margin-left: 10px; font-size: 16px">学生资料</h1>
<table style="margin-left: 10px;">
    <tr>
        <td>学号</td>
        <td><label id="lessonId">${model.studentId}</label></td>
    </tr>
    <tr>
        <td>名字</td>
        <td><input type="text" name="name" value="${model.name}"></td>
    </tr>
    <tr>
        <td>联系电话</td>
        <td><input type="text" name="mobile" value="${model.mobile}"></td>
    </tr>
    <tr>
        <td>电话拥有者</td>
        <td>
            <#if model.mobileOwner == 0>
                <label>未知：</label><input type="radio" name="mobileOwner" value="0" checked="checked"/><br/>
            <#else>
                <label>未知：</label><input type="radio" name="mobileOwner" value="0"/><br/>
            </#if>
            <#if model.mobileOwner == 1>
                <label>父亲：</label><input type="radio" name="mobileOwner" value="1" checked="checked"/><br/>
            <#else>
                <label>父亲：</label><input type="radio" name="mobileOwner" value="1"/><br/>
            </#if>
            <#if model.mobileOwner == 2>
                <label>母亲：</label><input type="radio" name="mobileOwner" value="2" checked="checked"/><br/>
            <#else>
                <label>母亲：</label><input type="radio" name="mobileOwner" value="2"/><br/>
            </#if>
        </td>
    </tr>
    <tr>
        <td>学生补课状态</td>
        <td>
            <#if model.state == 1>
                <label>没有补课：</label><input type="radio" name="state" value="1" checked="checked"/><br/>
            <#else>
                <label>没有补课：</label><input type="radio" name="state" value="1"/><br/>
            </#if>
            <#if model.state == 2>
                <label>其他机构补课：</label><input type="radio" name="state" value="2" checked="checked"/><br/>
            <#else>
                <label>其他机构补课：</label><input type="radio" name="state" value="2"/><br/>
            </#if>
            <#if model.state == 3>
                <label>本机构补课：</label><input type="radio" name="state" value="3" checked="checked"/><br/>
            <#else>
                <label>本机构补课：</label><input type="radio" name="state" value="3"/><br/>
            </#if>
            <#if model.state == 4>
                <label>毕业：</label><input type="radio" name="state" value="4" checked="checked"/><br/>
            <#else>
                <label>毕业：</label><input type="radio" name="state" value="4"/><br/>
            </#if>
        </td>
    </tr>
    <tr>
        <td>
            <button id="save">保存</button>
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