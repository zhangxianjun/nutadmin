<!DOCTYPE html>
<html lang="en" style="height: 100%">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="../static/js/jquery.js"></script>
    <link rel="stylesheet" href="../static/css/main.css">
</head>
<body>
<header style="height: 62px; width: 100%; background-color: gray;">
    <nav>
        <img src="../static/image/logo.png" style="width:115px; height: 62px;">
        <#list navList as l>
            <button onclick="openIframe(${l.resourceId})">${l.title}</button>
        </#list>
    </nav>
</header>

<div style="display: flex;justify-content: space-between; height: 100%">
    <aside style="background-color: lightgray;  width: 115px; height: 100%; margin-top: 5px">
        <#list asideList as l>
            <button onclick="openIframe(${l.resourceId})">${l.title}</button>
        </#list>
    </aside>

    <main style="width: calc(100% - 120px); height: 100%; margin-top: 5px;">
        <iframe src="/course" style="width: 100%; height: 100%; border: 0px;" id="my-iframe">
        </iframe>
    </main>
</div>
</body>
<script>
    function openIframe(resourceId) {
        $.ajax({
            type: 'POST',
            contentType: "application/json; charset=UTF-8",
            url: '/get/url',
            data: JSON.stringify({
                resourceId: resourceId
            }),
            success: function (data) {
                console.log(data);
                $("#my-iframe").attr("src", data);
            }
        });
    }
</script>
</html>