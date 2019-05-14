<!DOCTYPE html>
<html lang="en" style="height: 100%; width: 100%;">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="../../static/js/jquery.js"></script>
    <#--    <script src="../static/js/layer.js"></script>-->
    <link rel="stylesheet" href="../../static/css/main.css">
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }
    </style>
</head>
<body>
<h1 style="margin-left: 20px;">学生列表</h1>
<table style="width: 80%; height: 500px; margin-left: 20px;" border="1px" cellspacing="0px" cellpadding="0px">
    <thead>
    <tr style="text-align: center">
        <td>学号</td>
        <td>名字</td>
        <td>联系电话</td>
        <td>电话拥有者</td>
        <td>学生补课状态</td>
        <td>录入时间</td>
        <td>操作</td>
    </tr>
    </thead>
    <#list list as l>
        <tr style="text-align: center">
            <td>${l.studentId}</td>
            <td>${l.name}</td>
            <td>${l.mobile}</td>
            <td>${l.mobileOwner}</td>
            <td>${l.state}</td>
            <td>${l.dateTime?string("yyyy-MM-dd")}</td>
            <td><a href="/contact/add?studentId=${l.studentId}">操作</a></td>
        </tr>
    </#list>
</table>
</body>
<script>
    function addCourse(lessonId) {
        // $()
    }

    function showDetail() {

    }

</script>
</html>