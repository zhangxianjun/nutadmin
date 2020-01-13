<!DOCTYPE html>
<html lang="en" style="height: 100%; width: 100%;">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="./css/main.css">
</head>
<body>
<h1 style="margin-left: 20px;">最近60天上课记录</h1>
<table style="width: 80%; height: 500px; margin-left: 20px;" border="1px" cellspacing="0px" cellpadding="0px">
    <thead>
    <tr style="text-align: center">
        <td>序号</td>
        <td>学生名字</td>
        <td>年级</td>
        <td>课程形式</td>
        <td>课段</td>
        <td>上课时间</td>
    </tr>
    </thead>
    <#list list as l>
    <#--一周的同一时间段-->
        <tr style="text-align: center">
            <td>${l_index+1}</td>
            <#list l as v>
            <#--一天的同一个时间段-->
                <td class="detail">
                    <#if v["students"] == ''>
                        <a href="/course/detail?lessonId=${v['lessonId']}">添加任务</a>
                    <#else>
                        <#if v['grade'] == 0>
                            <label>小学</label><br/>
                        <#elseif v['grade'] == 1>
                            <label>初一</label><br/>
                        <#elseif v['grade'] == 2>
                            <label>初二</label><br/>
                        <#elseif v['grade'] == 3>
                            <label>初三</label><br/>
                        </#if>
                        <label>${v['students']}</label><br/>
                        <a href="/course/subtraction?lessonId=${v['lessonId']}">消课</a>
                        <a href="/course/detail?lessonId=${v['lessonId']}">编辑</a>
                    </#if>
                </td>
            </#list>
        </tr>
    </#list>
</table>
</body>
<script>
    function addCourse(lessonId) {
        // $()
    }

    function showDetail() {

    }

</script>
</html>