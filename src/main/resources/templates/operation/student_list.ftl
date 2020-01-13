<!DOCTYPE html>
<html lang="en" style="height: 100%; width: 100%;">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="./js/jquery.js"></script>
    <link rel="stylesheet" href=".static/css/main.css">
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }
    </style>
</head>
<body>
<h1 style="margin-left: 20px;">学生列表</h1>
<button id="enter">新建</button>
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
            <#if l.mobileOwner == 0>
                <td>未知</td>
            <#elseif l.mobileOwner == 1>
                <td>父亲</td>
            <#elseif l.mobileOwner == 2>
                <td>母亲</td>
            </#if>
            <#if l.state == 1>
                <td>没有补课</td>
            <#elseif l.state == 2>
                <td>其他机构补课</td>
            <#elseif l.state == 3>
                <td>本机构补课</td>
            <#else>
                <td>毕业</td>
            </#if>
            <td>${l.dateTime?string("yyyy-MM-dd")}</td>
            <td><a href="/contact/page?studentId=${l.studentId}">操作</a></td>
        </tr>
    </#list>
</table>
</body>
<script>
    $("enter").click(function(){
        window.location.href = '/contact/page?studentId=0';
    });
</script>
</html>