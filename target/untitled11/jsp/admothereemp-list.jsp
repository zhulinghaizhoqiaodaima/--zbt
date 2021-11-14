<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>管理员查看额外用餐记录</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">

<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到额外用餐记录界面</h1>
    </div>
</div>
<form  method="post" action="${pageContext.request.contextPath}/eat/Cadmothereemp">
    <span size="4">年份：</span><input type="text" name="year">
    <span size="4">月份：</span><input type="text" name="month">
    <button type="submit">查询</button>
</form>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">年份</span></th>
        <th><span size="5">月份</span></th>
        <th><span size="5">该月第几周</span></th>
        <th><span size="5">周几</span></th>
        <th><span size="5">用餐人数</span></th>
        <th><span size="5">操作</span></th>
    </tr>
    <c:forEach var="oemp" items="${oempList}">
        <tr class="detail_goods">
            <td><span size="4">${oemp.year}</span></td>
            <td><span size="4">${oemp.month}</span></td>
            <td><span size="4">${oemp.week}</span></td>
            <td><span size="4">${oemp.weekday}</span></td>
            <td><span size="4">${oemp.pnum}</span></td>
            <td>
                <a href="/eat/admoempmessage?oEid=${oemp.oEid}" class="look_detail"  >
                    查看详情</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" href="${pageContext.request.contextPath}/eat/admothereemp?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/eat/admothereemp?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/eat/admothereemp?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/eat/admothereemp?pageNum=${page.pages}" title="">尾页</a>
</div>
</body>
</html>
