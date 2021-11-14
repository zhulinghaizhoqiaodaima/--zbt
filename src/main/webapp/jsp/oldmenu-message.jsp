<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜单-欢迎来到菜单详细界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到菜单详细界面</h1>
    </div>
</div>
<div>

</div>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">周几</span></th>
        <th><span size="5">荤菜1</span></th>
        <th><span size="5">荤菜2</span></th>
        <th><span size="5">素菜</span></th>
        <th><span size="5">汤</span></th>
    </tr>
    <c:forEach var="gworderList" items="${gworderList}">
        <tr class="detail_goods">
            <td><span size="4">${gworderList.weekday}</span></td>
            <td><span size="4">${gworderList.meatone}</span></td>
            <td><span size="4">${gworderList.meattwo}</span></td>
            <td><span size="4">${gworderList.vegetable}</span></td>
            <td><span size="4">${gworderList.soup}</span></td>
        </tr>
    </c:forEach>


</table>
</div>
<div class="bottom_page">
    <a class="page_change" href="/menu/oldmenu" ><span size="5" color="#a52a2a">返回</span></a>
</div>
</body>
</html>
