<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教学管理系统</title>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <script src="./css/bootstrap/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="./css/bootstrap/bootstrap.min.css">
    <style>
        .login-content {
            position:absolute;
            top:50%;
            left:50%;
            margin-top: -100px;
            margin-left: -150px;
            width: 300px;
            height: 200px;
            background-color: lightgray;
            border-radius: 5px;
        }

        .login-content-mobile-container {
            padding-top: 32px;
        }

        .login-content-password-container {
            margin-top: 16px;
        }

        label {
            margin-left: 36px;
        }

        button {
            display: block;
            margin: 24px auto 0px;
            width: 118px;
        }
    </style>
</head>
<body>

<div class="login-content">

    <div class="login-content-mobile-container">
        <label>账号：</label>
        <input type="text" id="mobile">
    </div>

    <div class="login-content-password-container">
        <label>密码：</label>
        <input type="password" id="password">
    </div>

    <button>登录</button>
</div>
</body>

<script>
    $("button").click(function () {
        $.ajax({
            type: 'POST',
            contentType: "application/json; charset=UTF-8",
            url: '/ajax/login',
            data: JSON.stringify({
                mobile: $("#mobile").val(),
                password: $("#password").val()
            }),
            success: function (data) {
                var j = JSON.parse(data);

                if (j["code"] == 10001) {
                    var d = j["data"];
                    var name = d["name"];
                    var t_id = d["t_id"];

                    document.cookie = "name=" + name;
                    document.cookie = "t_id=" + t_id;
                    window.location.href = '/home';
                } else {
                    console.log("登录失败！");
                }
            }
        });
    });
</script>

</html>