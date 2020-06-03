<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教学管理系统</title>
    <script src="/js/jquery-3.4.1.min.js"></script>
    <script src="/css/bootstrap/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/view.css">

</head>
<body>

<div class="container-main">
    <div class="container-main-header-button">
        <button type="button" class="btn btn-primary">添加导航</button>
    </div>

    <div class="container-main-table">
        <table class="table table-striped table-bordered">
            <tr>
                <td>导航ID</td>
                <td>导航名字</td>
                <td>显示顺序</td>
                <td>操作</td>
            </tr>
            <#list list as m>
                <tr>
                    <td>${m.resourceId}</td>
                    <td>${m.name}</td>
                    <td>${m.sortId}</td>
                    <td><a href="#">编辑</a></td>
                </tr>
            </#list>
        </table>
    </div>
</div>

<div class="container-alert">

</div>

</body>
</html>