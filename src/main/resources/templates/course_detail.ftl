<!DOCTYPE html>
<html lang="en" style="height: 100%; width: 100%;">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="../static/js/jquery.js"></script>
<#--    <script src="../static/js/layer.js"></script>-->
    <link rel="stylesheet" href="../static/css/main.css">
</head>
<body>
<h1 style="margin-left: 10px; font-size: 16px">课程详情</h1>
<table style="margin-left: 10px;">
    <tr>
        <td>时段ID</td>
        <td><label id="lessonId">${lessonId}</label></td>
    </tr>
    <tr>
        <td>授课形式</td>
        <td>
            <input type="radio" name="form" title="小班" value="0" />
            <input type="radio" name="form" title="一对一" value="1" />
        </td>
    </tr>
    <tr>
        <td>学生名字</td>
        <td><></td>
    </tr>
    <tr>
        <td>
            <button id="save">修改</button>
        </td>
        <td>
            <button>消课</button>
        </td>
    </tr>
</table>
</body>
<script>
    $("save").click(function () {
        var lessonId = $("#lessonId").html();
        var form = $('input:radio[name=form]:checked').val();
    });
</script>
</html>