<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>工作管理系统</title>
    <script src="/js/jquery-3.4.1.min.js"></script>
    <script src="/js/vue.js"></script>
    <link rel="stylesheet" href="/element/element.css">
    <script src="/element/element.js"></script>

    <style>
        .el-row {
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

<div id="app">

    <el-row style="margin-top: 100px">
        <el-col :span="4" :offset="10">
            <el-input size="medium" placeholder="请输入内容"></el-input>
        </el-col>
    </el-row>

    <el-row>
        <el-col :span="4" :offset="10">
            <el-input size="medium" placeholder="请输入密码" show-password></el-input>
        </el-col>
    </el-row>

    <el-row>
        <el-col :span="2" :offset="10">
            <el-button type="primary" v-on:click="login">登录</el-button>
        </el-col>
        <el-col :span="2" style="text-align: right">
            <el-button type="info" plain="true" v-on:click="forgot">忘记密码</el-button>
        </el-col>
    </el-row>
</div>

</body>


<script>
    $(function () {

        let viewModel = {
            name : "about"
        };

        let app = new Vue({
            el: '#app',
            data: viewModel,
            methods: {
                addItem() {

                },
                login: function (event) {
                    window.location.href = "home";
                }
            }
        });
    });

    // $("button").click(function () {
    //     $.ajax({
    //         type: 'POST',
    //         contentType: "application/json; charset=UTF-8",
    //         url: '/ajax/login',
    //         data: JSON.stringify({
    //             mobile: $("#mobile").val(),
    //             password: $("#password").val()
    //         }),
    //         success: function (data) {
    //             var j = JSON.parse(data);
    //
    //             if (j["code"] == 10001) {
    //                 var d = j["data"];
    //                 var name = d["name"];
    //                 var t_id = d["t_id"];
    //
    //                 document.cookie = "name=" + name;
    //                 document.cookie = "t_id=" + t_id;
    //                 window.location.href = '/home';
    //             } else {
    //                 console.log("登录失败！");
    //             }
    //         }
    //     });
    // });
</script>
</html>