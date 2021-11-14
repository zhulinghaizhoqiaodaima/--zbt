<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员查看每日排班</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">

<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到每日排班界面</h1>
    </div>
</div>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">日期</span></th>
        <th><span size="5">岗位</span></th>
        <th><span size="5">人员</span></th>
    </tr>
    <c:forEach var="daw" items="${dawList}">
        <tr class="detail_goods">
            <td><span size="4">${daw.ddate}</span></td>
            <td><span size="4">${daw.post}</span></td>
            <td><span size="4">${daw.dname}</span></td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
