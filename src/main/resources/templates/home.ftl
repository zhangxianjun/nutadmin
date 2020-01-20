<!DOCTYPE html>
<html lang="en" style="height: 100%">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <style>
        * { margin: 0px; padding: 0px; font-size: 16px; }
        body { height: 100%; }

        .browser { display: flex; width: 100%; height: 100%; }

        .browser-left { width: 228px; height: 100%; }

        .browser-left-logo {
            width: 100%;
            height: 49px;
            background-color: #393D49;
            text-align: center;
        }

        .browser-left-logo label {
            line-height: 49px;
            font-size: 18px;
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
            margin-left: 10px;
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

        .browser-left-navigation-list label {
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

    var selectSuperId = "";
    var selectedId = "";

    $(function(){
        // getAvatar();
        getNavigationData(0, function(name, catalogId, resourceId, length, url){
            generateSection(name, catalogId, resourceId);
        });
    });

    function getAvatar() {
        $("browser-right-header-avatar").attr('src', );
    }
    
    function openNextLevel(obj) {

        $(obj.id.replace("a", "#b")).empty();

        getNavigationData(Number(obj.id.replace("a_", "")), function(name, catalogId, resourceId, length, url) {
            generateItem(name, catalogId, resourceId, url);
            $(obj.id.replace("a", "#b")).height(length * 40);
            $(obj.id.replace("a", "#b")).show();
        });


    }

    function getNavigationData(catalogId, callback) {
        $.ajax({
            type: 'POST',
            contentType: "application/json; charset=UTF-8",
            url: '/ajax/home/level',
            data: JSON.stringify({
                catalogId: catalogId
            }),
            success: function (data) {
                let j = JSON.parse(data);
                for (let i = 0; i < j.length; i++) {
                    let t = j[i];
                    callback(t.name, t.catalogId, t.resourceId, j.length, t.url);
                }
            }
        });
    }

    function openIframe(obj) {
        if (selectedId.length > 0) {
            $("#" + selectedId).css("background-color", "#191B21");
        }
        $("#" + obj.id).css("background-color", "#009688");
        $("#web-container").attr("src",$(obj).attr('url'));
        selectedId = obj.id;
    }

    function generateSection(name, catalogId, resourceId, url) {
        let sectionHtml = "<li>" +
            "<div id=\"a_" + resourceId + "\" class=\"browser-left-navigation-header\" onclick=\"openNextLevel(this)\">" +
            "<img src=\"\">" +
            "<label>" + name + "</label>" +
            "</div>" +
            "<dd id=\"b_" + resourceId + "\" class=\"browser-left-navigation-list\">"+
            "</dd>"+
            "</li>";
        $(".browser-left-navigation").append(sectionHtml);
    }

    function generateItem(name, catalogId, resourceId, url) {
        let itemHtml = "<dl id=\"bb_" + resourceId + "\" url= "+ url +  " onclick=\"openIframe(this)\">" +
            "<div>" +
            "<label>"+ name +"</label>" +
            "</div>" +
            "</dl>";
        $("#b_" + catalogId).append(itemHtml);
    }
</script>
</html>