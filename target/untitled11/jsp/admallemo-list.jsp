<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>员工往期用餐录界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">

<body>
<div>

    <div class="title">
        <h1 color="#696969">员工往期用餐录界面</h1>
    </div>

</div>
<form  method="post" action="${pageContext.request.contextPath}/eat/Cadmemordert">
    <span size="4">状态：</span>
    <select name="state">
        <option value="选择状态">选择状态</option>
        <option value="已缴费">已缴费</option>
        <option value="未缴费">未缴费</option>
    </select>
    <span size="3">年份：</span><input type="number" name="year" >
    <span size="3">月份：</span><input type="number" name="month" >
    <span size="4">姓名：</span><input type="text" name="name">
    <button type="submit">查询</button>
</form>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">姓名</span></th>
        <th><span size="5">年份</span></th>
        <th><span size="5">月份</span></th>
        <th><span size="5">本月用餐次数</span></th>
        <th><span size="5">本月餐饮费用</span></th>
        <th><span size="5">餐饮费状态</span></th>
    </tr>
    <c:forEach var="emp" items="${empList}">
        <tr class="detail_goods">
            <td><span size="4">${emp.name}</span></td>
            <td><span size="4">${emp.year}</span></td>
            <td><span size="4">${emp.month}</span></td>
            <td><span size="4">${emp.enumber}</span></td>
            <td><span size="4" color="#c43838">${emp.total}</span></td>
            <td><span size="4" color="#c43838">${emp.state}</span></td>
        </tr>
    </c:forEach>
</table>

<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" href="${pageContext.request.contextPath}/eat/admemordert?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/eat/admemordert?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/eat/admemordert?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/eat/admemordert?pageNum=${page.pages}" title="">尾页</a>
</div>
</body>
</html>
