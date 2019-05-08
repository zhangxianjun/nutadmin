<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${name}, Welcome!</title>
    <script src="../static/js/jquery.js"></script>
    <link rel="stylesheet" href="../static/css/main.css">
</head>
<body>

<div style="margin-left:auto; margin-right:auto; margin-top:240px; width:260px; height:160px;  background:lightgray">
    <div style="margin-top: 20px; display: inline-block;">
        <label style="margin-left: 40px">账号：</label>
        <input type="text" name="account">
    </div>
    <div style="margin-top: 10px; display: inline-block;">
        <label style="margin-left: 40px">密码：</label>
        <input type="password" name="password">
    </div>
    <div style="margin-top: 10px; display: flex; height: 30px; width: 100%">
        <label style="margin-left: 24px"">验证码：</label>
        <input type="text" style="width: 60px; margin-left: 5px">
        <img src="/image/logo.png" style="margin-left: 5px; width: 60px; height: 30px">
    </div>

    <button style="display: block; margin: 12px auto; width: 80px; height: 30px">登录</button>
</div>
</body>

<script>
    // function login() {
    //
    $("button").click(function () {
        $.ajax({
            type: 'POST',
            contentType: "application/json; charset=UTF-8",
            url: '/login/login',
            data: JSON.stringify({
                name: "菜鸟教程",
                url: "http://www.runoob.com"
            }),
            success: function (data) {
                var j = JSON.parse(data);
                if (j["code"] == 1) {
                    window.location.href = '/home'
                }
            }
        });
    });
    // }
</script>

</html>