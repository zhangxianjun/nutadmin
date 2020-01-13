<!DOCTYPE html>
<html lang="en" style="height: 100%; width: 100%;">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="./css/main.css">
</head>
<body>
<h1 style="margin-left: 10px; font-size: 16px">确认消课</h1>
<table style="margin-left: 10px;">
    <tr>
        <td>时段ID</td>
        <td><label id="lessonId">${lessonId}</label></td>
    </tr>
    <tr>
        <td>授课形式</td>
        <td>
            <label>小班：</label><input type="radio" name="form" value="0" checked="checked"/>
            <label>一对一：</label><input type="radio" name="form" value="1"/>
        </td>
    </tr>
    <tr>
        <td>学生年级</td>
        <td>
            <label>小学：</label><input type="radio" name="grade" value="0" checked="checked"/>
            <label>初一：</label><input type="radio" name="grade" value="1"/>
            <label>初二：</label><input type="radio" name="grade" value="2"/>
            <label>初三：</label><input type="radio" name="grade" value="3"/>
        </td>
    </tr>
    <tr>
        <td>学生名字</td>
        <td>
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