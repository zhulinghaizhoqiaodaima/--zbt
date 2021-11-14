<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜品详细信息界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<div>
    <div class="title">
        <h1 color="#696969">菜品详细信息界面</h1>
    </div>
</div>
<div>

</div>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">本月第几周</span></th>
        <th><span size="5">周几</span></th>
        <th><span size="5">荤菜1</span></th>
        <th><span size="5">荤菜2</span></th>
        <th><span size="5">素菜</span></th>
        <th><span size="5">汤</span></th>
    </tr>
    <c:forEach var="gemo" items="${gemorderList}">
        <tr class="detail_goods">
            <td><span size="4">${gemo.week}</span></td>
            <td><span size="4">${gemo.weekday}</span></td>
            <td><span size="4">${gemo.meatone}</span></td>
            <td><span size="4">${gemo.meattwo}</span></td>
            <td><span size="4">${gemo.vegetable}</span></td>
            <td><span size="4">${gemo.soup}</span></td>
        </tr>
    </c:forEach>
</table>
</div>
<div class="bottom_page">
    <a class="login_button" href="/emp/emolist">返回</a>
</div>
</body>
</html>
