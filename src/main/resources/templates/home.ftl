<!DOCTYPE html>
<html lang="en" style="height: 100%">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="/static/js/jquery.js"></script>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
    </style>
</head>
<body style="position: relative; background-color: aqua; height: 100%;">
    <header style="height: 80px; width: 100%; background-color: gray;">
            <nav>
                <#list navList as l>
                    <button onclick="">${l.title}</button>
                </#list>
            </nav>
    </header>

    <div style="display: flex;justify-content: space-between; height: 100%" >
        <aside style="background-color: lightgray;  width: 80px; height: 100%; margin-top: 10px">
            <#list asideList as l>
                <button onclick="">${l.title}</button>
            </#list>
        </aside>

        <main style="background-color: gold;  width: calc(100% - 100px); height: 100%; margin-top: 10px;">
            <iframe>

            </iframe>
        </main>
    </div>
</body>

<#--<!DOCTYPE html>-->
<#--<html lang="en" style="height: 100%">-->
<#--<head>-->
<#--    <meta charset="UTF-8">-->
<#--    <title>Title</title>-->
<#--    <script src="/static/js/jquery.js"></script>-->
<#--</head>-->
<#--<body style="position: relative; background-color: aqua; height: 100%">-->
<#--<header style="height: 80px; width: 100%; background-color: gray; float: left">-->
<#--&lt;#&ndash;    <nav>&ndash;&gt;-->
<#--&lt;#&ndash;        <#list navList as l>&ndash;&gt;-->
<#--&lt;#&ndash;            <button onclick="">${l.title}</button>&ndash;&gt;-->
<#--&lt;#&ndash;        </#list>&ndash;&gt;-->
<#--&lt;#&ndash;    </nav>&ndash;&gt;-->
<#--</header>-->
<#--<aside style="background-color: lightgray; float: left; width: 80px; height: 100%; margin-top: 10px">-->
<#--&lt;#&ndash;    <button onclick="">个人资料</button>&ndash;&gt;-->
<#--&lt;#&ndash;    <button>个人资料</button>&ndash;&gt;-->
<#--</aside>-->

<#--<main style="background-color: gold; float: right; width: calc(100% - 90px); height: 100%; margin-top: 10px;">-->
<#--    <iframe>-->

<#--    </iframe>-->
<#--</main>-->
<#--</body>-->

<#--</html>-->