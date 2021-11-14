<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎来到排班详细信息界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到排班详细信息界面</h1>
    </div>
</div>
<table class="tables"  align="center" width="80%" border="1">
    <tr class="header_size">
        <th><span size="5">日期</span></th>
        <th><span size="5">岗位</span></th>
        <th><span size="5">姓名</span></th>
    </tr>
    <c:forEach var="ogaw" items="${ogawList}">
        <tr class="detail_goods">
            <td><span size="4">${ogaw.ddate}</span></td>
            <td><span size="4">${ogaw.post}</span></td>
            <td><span size="4">${ogaw.dname}</span></td>
        </tr>
    </c:forEach>


</table>
</div>

<div class="bottom_page">
    <a class="page_change" href="/user/findOAW" ><span size="5" color="#a52a2a">返回</span></a>
</div>

</body>
</html>
