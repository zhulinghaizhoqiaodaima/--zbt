
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>额外用餐人员详情页</title>
</head>
<link rel="stylesheet" href="../css/asset.css">

<body>
<center><h1><span color="#a52a2a">${oemp.year}</span>年
    <span style="color:#7F99DA" >${oemp.month}</span>月
    第<span style="color:#7F99DA" >${oemp.week}</span>周
    周<span style="color:#7F99DA" >${oemp.weekday}</span>的额外用餐情况
</h1></center>
<table border="1" width="60%" align="center">
    <tr class="header_size">
        <td><span size="5">
            身份：
        </span></td>
        <td><span size="4" >
            ${oemp.empType}
        </span></td>
    </tr>
    <tr class="header_size">
        <td><span size="5">
            人数:
        </span></td>
        <td><span size="4">
            ${oemp.pnum}
        </span></td>
    </tr>
    <tr class="header_size">
        <td><span size="5">
            菜种类：
        </span></td>
        <td><span size="4" >
            ${oemp.fnum}
        </span></td>
    </tr>
    <tr class="header_size">
        <td><span size="5">
            菜品：
        </span></td>
        <td><span size="4" >
            ${oemp.food}
        </span></td>
    </tr>
</table>
<div class="bottom_page">
    <a class="page_change" href="/eat/admothereemp" >返回</a>
</div>
</body>
</html>
