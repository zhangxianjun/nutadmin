<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教学管理系统</title>
    <script src="/js/jquery-3.4.1.min.js"></script>
    <script src="/css/bootstrap/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/view.css">
    <style>
        .welcome-tag-list {
            display: flex;
            margin: 15px 0;
        }

        .welcome-tag-list div {
            margin-left: 15px;
            height: 80px;
            width: 160px;
            background-color: #F8F8F8;
            text-align: center;
        }

        .welcome-tag-list div label {
            line-height: 80px;
        }

        .new-list {
            height: 100px;
        }
    </style>
</head>
<body>

<div class="container-main">
    <div class="container-main-header">
        <label>欢迎 ${name} 老师!</label>
    </div>

    <div class="welcome-tag-list">
        <div><label>个人资料</label></div>
        <div><label>修改密码</label></div>
    </div>

    <div class="new-list">
        <div><a href="https://www.huxiu.com/article/336720.html">当务之急是给故宫祛媚</a></div>
        <div><a href="https://www.huxiu.com/article/336719.html">首款国产编程语言实为“换皮 Python”</a></div>
    </div>
</div>

</body>
</html>