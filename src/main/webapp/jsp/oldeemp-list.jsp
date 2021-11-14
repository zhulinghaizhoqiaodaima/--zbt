<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>欢迎来员工用餐记录界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="../css/asset.css">

</head>
<body>

<div>
    <div class="title">
        <h1 color="#696969">欢迎来到员工用餐记录界面</h1>
    </div>
</div>

<table class="tables"  align="center" width="80%" border="1">
    <tr class="header_size">
        <th><font size="5">年</font></th>
        <th><font size="5">月</font></th>
        <th><font size="5">本月第几周</font></th>
        <th><font size="5">周几</font></th>
        <th><font size="5">操作</font></th>
    </tr>
    <c:forEach var="oldeemp" items="${oldeempList}">
        <tr class="detail_goods">
            <td><font size="4">${oldeemp.year}</font></td>
            <td><font size="4">${oldeemp.month}</font></td>
            <td><font size="4">${oldeemp.week}</font></td>
            <td><font size="4">${oldeemp.weekday}</font></td>
            <td>
                <a href="/eat/oldeatmessage?ymwwd=${oldeemp.ymwwd}" class="look_detail">
                    查看详情</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" href="${pageContext.request.contextPath}/eat/findoldeemp?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/eat/findoldeemp?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/eat/findoldeemp?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/eat/findoldeemp?pageNum=${page.pages}" title="">尾页</a>
</div>
</body>
</html>
