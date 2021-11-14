<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>管理员员查看用餐员工</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">

<body>

<div>
    <div class="title">
        <h1 color="#696969">欢迎来到用餐员工界面</h1>
    </div>
</div>
<table class="tables"  align="center" width="80%" border="1">
    <tr class="header_size">
        <th><span size="5">姓名</span></th>
        <th><span size="5">身份</span></th>
        <th><span size="5">行部门</span>
    </tr>
    <c:forEach var="eat" items="${eatList}">
        <tr class="detail_goods">
            <td><span size="4">${eat.name}</span></td>
            <td><span size="4">${eat.userType}</span></td>
            <td><span size="4">${eat.department}</span></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
