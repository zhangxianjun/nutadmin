<!DOCTYPE html>
<html lang="en" style="height: 100%">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="../static/js/jquery.js"></script>
    <link rel="stylesheet" href="../static/css/main.css">
    <style>
        header > nav > img {
            width: 115px;
            height: 62px;
            vertical-align: middle
        }

        ;
    </style>
</head>
<body>
<header style="height: 62px; width: 100%; background-color: gray;">
    <nav>
        <img src="../static/image/logo.png">
        <#list navList as l>
            <#if l_index==0>
                <button id="n${l.resourceId}" onclick="openAsideNavigation(${l.resourceId}, ${navList?size})"
                        class="selected">${l.title}</button>
            <#else>
                <button id="n${l.resourceId}" onclick="openAsideNavigation(${l.resourceId}, ${navList?size})"
                        class="normal">${l.title}</button>
            </#if>
        </#list>
    </nav>
</header>

<footer style="display: flex;justify-content: space-between; height: 100%">
    <aside id="asideNavigation" style="background-color: lightgray;  width: 115px; height: 100%; margin-top: 5px">
        <#list asideList as l>
            <#if l_index==0>
                <button id="a${l.resourceId}" onclick="openIframe(${l.resourceId}, ${asideList?size}, ${l.url})"
                        class="selected">${l.title}</button>
            <#else>
                <button id="a${l.resourceId}" onclick="openIframe(${l.resourceId}, ${asideList?size}, ${l.url})"
                        class="normal">${l.title}</button>
            </#if>
        </#list>
    </aside>

    <main style="width: calc(100% - 120px); height: 100%; margin-top: 5px;">
        <iframe src="/course" style="width: 100%; height: 100%; border: 0px;" id="my-iframe">
        </iframe>
    </main>
</footer>
</body>
<script>
    // 一级导航栏切换
    function openAsideNavigation(resourceId, size) {
        // 设置颜色
        for (var i = 0; i < size; i++) {
            if (resourceId == i) {
                $("#n" + i).attr("class", "selected");
            } else {
                $("#n" + i).attr("class", "normal");
            }
        }

        $.ajax({
            type: 'POST',
            contentType: "application/json; charset=UTF-8",
            url: '/get/url',
            data: JSON.stringify({
                resourceId: resourceId
            }),
            success: function (data) {
                // 删除旧的侧边栏导航
                $("#asideNavigation").empty();
                // 添加新的侧边栏导航
                var json = JSON.parse(data);
                // console.log(json[""]);
                var htmlString = "";
                var length = json["data"].length;
                for (var i = 0; i < length; i++) {
                    var c = json["data"][i];
                    if (i == 0) {
                        htmlString = "<button id=\"a" + c.resourceId + "\" onclick=\"openIframe(" + c.resourceId + ", " + length + ", \'" + c.url + "\')\"\n" +
                            "                        class=\"selected\">" + c.title + "</button>";
                        $("#my-iframe").attr("src", c.url);
                    } else {
                        htmlString += "<button id=\"a" + c.resourceId + "\" onclick=\"openIframe(" + c.resourceId + ", " + length + ", \'" + c.url + "\')\"\n" +
                            "                        class=\"normal\">" + c.title + "</button>";
                    }
                }
                $("#asideNavigation").append(htmlString);
            }
        });

    }


    function openIframe(resourceId, size, url) {

        for (var i = 0; i < size; i++) {
            if (resourceId == i) {
                $("#a" + i).attr("class", "selected");
                console.log(i + "select" + i);
            } else {
                console.log(i + "normal");
                $("#a" + i).attr("class", "normal");
            }
        }

        $("#my-iframe").attr("src", url);
    }
</script>
</html>