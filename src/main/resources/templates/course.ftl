<!DOCTYPE html>
<html lang="en" style="height: 100%; width: 100%;">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="/js/jquery.js"></script>
    <script src="/js/layer.js"></script>
        <link rel="stylesheet" href="../static/css/main.css">
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }
    </style>
</head>
<body style="background-color: aqua; height: 100%; width: 100%">
<h1 style="margin-left: 20px;">我的课程</h1>
<table style="width: 80%; height: 500px; margin-left: 20px;" border="1px" cellspacing="0px" cellpadding="0px">
    <thead>
    <tr style="text-align: center">
        <td>时段</td>
        <td>星期一</td>
        <td>星期二</td>
        <td>星期三</td>
        <td>星期四</td>
        <td>星期五</td>
        <td>星期六</td>
        <td>星期天</td>
    </tr>
    </thead>
    <#list list as l>
    <#--        一周的同一时间段-->
        <tr style="text-align: center">
            <td>${l_index+1}</td>
            <#list l as v>
            <#--                一天的同一个时间段-->
                <#if v["class"] =='0'>
                    <td onclick="addCourse(${v['key']})">新增</td>
                <#else>
                    <td>${v["class"]}</td>
                </#if>
            </#list>
        </tr>
    </#list>
</table>
</body>
<script>
function addCourse(lessonId) {
    alert("=============" + lessonId);
}

function showDetail() {

}

</script>
</html>