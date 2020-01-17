<!DOCTYPE html>
<html lang="en" style="height: 100%; width: 100%;">
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <script src="/js/jquery-3.4.1.min.js"></script>
    <script src="/css/bootstrap/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
</head>
<body>
<table class="table-striped">
    <tr>
        <td>用户ID</td>
        <td>名字</td>
        <td>手机号</td>
        <td>用户身份</td>
        <td>是否停用</td>
        <td>录入时间</td>
        <td>操作</td>
    </tr>
    <#list list as m>
        <tr>
            <td>${m.userId}</td>
            <td>${m.name}</td>
            <td>${m.mobile}</td>

            <#if m.groupId == 1>
                <td>管理员</td>
            <#elseif m.groupId == 2>
                <td>老师</td>
            <#else>
                <td>学生</td>
            </#if>

            <#if m.disable == 1>
                <td>禁用</td>
            <#else>
                <td>没有禁用</td>
            </#if>

            <td>${m.logDatetime?string("yyyy-MM-dd")}</td>
            <td><a href="/contact/page?studentId=${m.userId}">操作</a></td>
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