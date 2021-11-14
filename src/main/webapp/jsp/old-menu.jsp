<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎来到往期菜单信息界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到往期菜单信息界面</h1>
    </div>
</div>
<form method="post" action="${pageContext.request.contextPath}/menu/Coldmenu">
    <span size="4">年份：</span><input type="number" name="year">
    <span size="4">月份：</span><input type="number" name="month">
    <button type="submit">查询</button>
</form>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">年份</span></th>
        <th><span size="5">月份</span></th>
        <th><span size="5">第几周</span></th>
        <th><span size="5">菜单产生时间</span></th>
        <th><span size="5">创建人</span></th>
        <th><span size="5">选项</span></th>
    </tr>
    <c:forEach var="morder" items="${wordertList}">
        <tr class="detail_goods">
            <td><span size="4">${morder.year}</span></td>
            <td><span size="4">${morder.month}</span></td>
            <td><span size="4">${morder.week}</span></td>
            <td><span size="4">${morder.wtime}</span></td>
            <td><span size="4">${morder.name}</span></td>
            <td>
                <a href="/menu/mordert?wOid=${morder.wOid}" class="look_detail">详情</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" href="${pageContext.request.contextPath}/menu/oldmenu?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/menu/oldmenu?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/menu/oldmenu?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/menu/oldmenu?pageNum=${page.pages}" title="">尾页</a>
</div>
</div>
</body>
</html>
