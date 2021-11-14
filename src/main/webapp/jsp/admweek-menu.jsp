<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员查看菜单信息</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">

<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到查看菜单信息界面</h1>
    </div>
</div>
<div>

</div>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">月份</span></th>
        <th><span size="5">第几周</span></th>
        <th><span size="5">周几</span></th>
        <th><span size="5">荤菜1</span></th>
        <th><span size="5">荤菜2</span></th>
        <th><span size="5">素菜</span></th>
        <th><span size="5">汤</span></th>
    </tr>
    <c:forEach var="menu" items="${menuList}">
        <tr class="detail_goods">
            <td><span size="4">${menu.month}</span></td>
            <td><span size="4">${menu.week}</span></td>
            <td><span size="4">${menu.weekday}</span></td>
            <td><span size="4">${menu.meatone}</span></td>
            <td><span size="4">${menu.meattwo}</span></td>
            <td><span size="4">${menu.vegetable}</span></td>
            <td><span size="4">${menu.soup}</span></td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
