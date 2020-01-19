<!DOCTYPE html>
<html lang="en" style="height: 100%">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="./js/jquery-3.4.1.min.js"></script>
<#--    <link rel="stylesheet" href="./css/main.css">-->
    <style>
        * { margin: 0px; padding: 0px; font-size: 14px; }
        body { height: 100%; }

        .browser { display: flex; width: 100%; height: 100%; }

        .browser-left { width: 220px; height: 100%; }

        .browser-left-logo {
            width: 100%;
            height: 49px;
            background-color: #393D49;
            text-align: center;
        }

        .browser-left-logo label {
            line-height: 49px;
            font-size: 16px;
            color: white;
        }

        .browser-left-navigation {
            height: calc(100% - 49px);
            background-color: #20222A;
        }

        .browser-left-navigation-header {
            width: 100%;
            height: 56px;
            background-color: #24262F;
        }

        .browser-left-navigation-header img {
            width: 14px;
            height: 14px;
            margin-left: 20px;
            vertical-align: middle;
            background-color: #218838;
        }

        .browser-left-navigation-header label {
            line-height: 56px;
            margin-left: 7px;
            vertical-align: middle;
            color: white;
        }

        .browser-left-navigation-list {
            display: none;
            margin-top: 2px;
            margin-bottom: 2px;
            background-color: #191B21;
        }

        .browser-left-navigation-list dl {
            width: 100%;
            height: 40px;
            background-color: #191B21;
        }

        .browser-left-navigation-list label{
            margin-left: 44px;
            height: 40px;
            line-height: 40px;
            color: white;
        }

        .browser-right { width: 100%; height: 100%; background-color: #f2f2f2; }

        .browser-right-header {
            display: flex;
            justify-content: space-between;
            width: 100%;
            height: 49px;
            border-bottom: 1px solid #f6f6f6;
            background-color: #fff;
        }

        .browser-right-header-item {
            width: 96px;
            height: 48px;
        }

        .browser-right-header-avatar {
            margin-top: 2px;
            margin-right: 10px;
            width: 44px;
            height: 44px;
        }

        .browser-right-main { width: 100%; height: calc(100% - 50px)}

        .browser-right-main iframe {
            width: calc(100% - 30px);
            height: calc(100% - 30px);
            margin: 15px;
            border: 0px;
            border-radius: 2px;
            background-color: white;
        }
    </style>
</head>
<body>

<div class="browser">

    <div class="browser-left">

        <div class="browser-left-logo"> <label>教学管理</label> </div>

        <ul class="browser-left-navigation">
            <li>
                <div id="a_" class="browser-left-navigation-header" onclick="openNextLevel(this)">
                    <img src="">
                    <label>教学</label>
                </div>
                
                <dd id="b_" class="browser-left-navigation-list">
                    <dl id="bb_" onclick="openIframe(this)">
                        <div>
                            <label>教学计划</label>
                        </div>
                    </dl>
                </dd>

            </li>
        </ul>

    </div>

    <div class="browser-right">

        <div class="browser-right-header">
            <div class="browser-right-header-item"></div>
            <img class="browser-right-header-avatar" src="/image/default-avatar.png">
        </div>

        <div class="browser-right-main">
            <iframe id="web-container" src="/welcome" scrolling="no"></iframe>
        </div>

    </div>

</div>
</body>
<script>

    $(function(){
        // getAvatar();
    });

    function getAvatar() {
        $("browser-right-header-avatar").attr('src', );
    }
    
    function openNextLevel(obj) {
        // var
        console.log(obj.id);
        $(obj.id.replace("a", "#b")).show();
    }

    function getNavigationData() {
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
    }

    function generateSection() {

    }

    function generateItem() {

    }

    function openIframe(obj) {
        $("#bb_").css("background-color", "#009688");
        // $("#web-container").attr("src", src);
    }
</script>




<#--<header class="z-layout-header">-->
<#--    <div class="z-logo">-->
<#--        <label>教学系统</label>-->
<#--    </div>-->

<#--    <#list navList as l>-->
<#--        <#assign headerIndex="${headerIndex}"?eval>-->
<#--        <#if l_index==headerIndex>-->
<#--            <button id="n${l_index}" onclick="openAsideNavigation(${l_index}, ${l.resourceId}, ${navList?size})"-->
<#--                    class="z-header-button-selected">${l.name}</button>-->
<#--        <#else>-->
<#--            <button id="n${l_index}" onclick="openAsideNavigation(${l_index}, ${l.resourceId}, ${navList?size})"-->
<#--                    class="z-header-button">${l.name}</button>-->
<#--        </#if>-->
<#--    </#list>-->
<#--</header>-->

<#--<section class="z-layout-section">-->
<#--&lt;#&ndash;    <#assign cookie = request.&ndash;&gt;-->
<#--    <aside class="z-layout-aside">-->
<#--        <#list asideList as l>-->
<#--            <#assign asideIndex="${asideIndex}"?eval>-->
<#--            <#if l_index==asideIndex>-->
<#--                <button id="a${l_index}"-->
<#--                        onclick="openIframe(${l_index}, ${l.resourceId}, ${asideList?size}, '${l.url}')"-->
<#--                        class="z-aside-button-selected">${l.name}</button>-->
<#--            <#else>-->
<#--                <button id="a${l_index}"-->
<#--                        onclick="openIframe(${l_index}, ${l.resourceId}, ${asideList?size}, '${l.url}')"-->
<#--                        class="z-aside-button">${l.name}</button>-->
<#--            </#if>-->
<#--        </#list>-->
<#--    </aside>-->
<#--    <main class="z-layout-main">-->
<#--        <iframe src="${initUrl}" style="width: 100%; height: 100%; border: 0px;" id="my-iframe">-->
<#--        </iframe>-->
<#--    </main>-->
<#--</section>-->
<#--</body>-->
<#--<script>-->
<#--    // 一级导航栏切换-->
<#--    function openAsideNavigation(index, resourceId, size) {-->
<#--        // 设置颜色-->
<#--        for (var i = 0; i < size; i++) {-->
<#--            if (index == i) {-->
<#--                $("#n" + i).attr("class", "z-header-button-selected");-->
<#--                document.cookie="headerIndex="+index;-->
<#--                document.cookie='asideIndex='+0;-->
<#--            } else {-->
<#--                $("#n" + i).attr("class", "z-header-button");-->
<#--            }-->
<#--        }-->

<#--        $.ajax({-->
<#--            type: 'POST',-->
<#--            contentType: "application/json; charset=UTF-8",-->
<#--            url: '/get/url',-->
<#--            data: JSON.stringify({-->
<#--                resourceId: resourceId-->
<#--            }),-->
<#--            success: function (data) {-->
<#--                // 删除旧的侧边栏导航-->
<#--                $(".z-layout-aside").empty();-->
<#--                // 添加新的侧边栏导航-->
<#--                var json = JSON.parse(data);-->
<#--                // console.log(json[""]);-->
<#--                var htmlString = "";-->
<#--                var length = json["data"].length;-->
<#--                for (var i = 0; i < length; i++) {-->
<#--                    var c = json["data"][i];-->
<#--                    if (i == 0) {-->
<#--                        htmlString = "<button id=\"a" + i + "\" onclick=\"openIframe(" + i + ", " + c.resourceId + ", " + length + ", \'" + c.url + "\')\"\n" +-->
<#--                            "                        class=\"z-aside-button-selected\">" + c.name + "</button>";-->
<#--                        $("#my-iframe").attr("src", c.url);-->
<#--                    } else {-->
<#--                        htmlString += "<button id=\"a" + i + "\" onclick=\"openIframe(" + i + ", " + c.resourceId + ", " + length + ", \'" + c.url + "\')\"\n" +-->
<#--                            "                        class=\"z-aside-button\">" + c.name + "</button>";-->
<#--                    }-->
<#--                }-->
<#--                $(".z-layout-aside").append(htmlString);-->
<#--            }-->
<#--        });-->

<#--    }-->

<#--    function openIframe(index, resourceId, size, url) {-->
<#--        for (var i = 0; i < size; i++) {-->
<#--            if (index == i) {-->
<#--                $("#a" + i).attr("class", "z-aside-button-selected");-->
<#--                document.cookie='asideIndex='+index;-->
<#--            } else {-->
<#--                console.log(i + "normal");-->
<#--                $("#a" + i).attr("class", "z-aside-button");-->
<#--            }-->
<#--        }-->
<#--        $("#my-iframe").attr("src", url);-->
<#--    }-->
<#--</script>-->
</html>