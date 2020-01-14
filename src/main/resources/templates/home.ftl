<!DOCTYPE html>
<html lang="en" style="height: 100%">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="./css/main.css">
</head>
<body>
<header class="admin-layout-header">
    <label class="admin-logo">教学系统</label>
    <#list navList as l>
        <#assign headerIndex="${headerIndex}"?eval>
        <#if l_index==headerIndex>
            <button id="n${l_index}" onclick="openAsideNavigation(${l_index}, ${l.resourceId}, ${navList?size})"
                    class="admin-header-button-selected">${l.name}</button>
        <#else>
            <button id="n${l_index}" onclick="openAsideNavigation(${l_index}, ${l.resourceId}, ${navList?size})"
                    class="admin-header-button">${l.name}</button>
        </#if>
    </#list>
</header>

<section class="admin-layout-section">
<#--    <#assign cookie = request.-->
    <aside class="admin-layout-aside">
        <#list asideList as l>
            <#assign asideIndex="${asideIndex}"?eval>
            <#if l_index==asideIndex>
                <button id="a${l_index}"
                        onclick="openIframe(${l_index}, ${l.resourceId}, ${asideList?size}, '${l.url}')"
                        class="admin-aside-button-selected">${l.name}</button>
            <#else>
                <button id="a${l_index}"
                        onclick="openIframe(${l_index}, ${l.resourceId}, ${asideList?size}, '${l.url}')"
                        class="admin-aside-button">${l.name}</button>
            </#if>
        </#list>
    </aside>
    <main class="admin-layout-main">
        <iframe src="${initUrl}" style="width: 100%; height: 100%; border: 0px;" id="my-iframe">
        </iframe>
    </main>
</section>
</body>
<script>
    // 一级导航栏切换
    function openAsideNavigation(index, resourceId, size) {
        // 设置颜色
        for (var i = 0; i < size; i++) {
            if (index == i) {
                $("#n" + i).attr("class", "admin-header-button-selected");
                document.cookie="headerIndex="+index;
                document.cookie='asideIndex='+0;
            } else {
                $("#n" + i).attr("class", "admin-header-button");
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
                $(".admin-layout-aside").empty();
                // 添加新的侧边栏导航
                var json = JSON.parse(data);
                // console.log(json[""]);
                var htmlString = "";
                var length = json["data"].length;
                for (var i = 0; i < length; i++) {
                    var c = json["data"][i];
                    if (i == 0) {
                        htmlString = "<button id=\"a" + i + "\" onclick=\"openIframe(" + i + ", " + c.resourceId + ", " + length + ", \'" + c.url + "\')\"\n" +
                            "                        class=\"admin-aside-button-selected\">" + c.name + "</button>";
                        $("#my-iframe").attr("src", c.url);
                    } else {
                        htmlString += "<button id=\"a" + i + "\" onclick=\"openIframe(" + i + ", " + c.resourceId + ", " + length + ", \'" + c.url + "\')\"\n" +
                            "                        class=\"admin-aside-button\">" + c.name + "</button>";
                    }
                }
                $(".admin-layout-aside").append(htmlString);
            }
        });

    }

    function openIframe(index, resourceId, size, url) {
        for (var i = 0; i < size; i++) {
            if (index == i) {
                $("#a" + i).attr("class", "admin-aside-button-selected");
                document.cookie='asideIndex='+index;
            } else {
                console.log(i + "normal");
                $("#a" + i).attr("class", "admin-aside-button");
            }
        }
        $("#my-iframe").attr("src", url);
    }
</script>
</html>