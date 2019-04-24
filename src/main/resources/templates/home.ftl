<!DOCTYPE html>
<html lang="en" style="height: 100%">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="/js/jquery.js"></script>
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }
    </style>
</head>
<body style="position: relative; background-color: aqua; height: 100%;">
<header style="height: 80px; width: 100%; background-color: gray;">
    <nav>
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
        <iframe src="/profile" style="width: 100%; height: 100%; border: 0px;" id="my-iframe">

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