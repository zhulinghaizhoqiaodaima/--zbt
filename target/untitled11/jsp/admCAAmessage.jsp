<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>欢迎来到详细购物界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到详细购物界面</h1>
    </div>
</div>

<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">种类</span></th>
        <th><span size="5">名称</span></th>
        <th><span size="5">数量</span></th>
        <th><span size="5">单位</span></th>
        <th><span size="5">总价格</span></th>
        <th><span size="5">购买地</span></th>
    </tr>
    <c:forEach var="pcggList" items="${pcggList}">
        <tr class="detail_goods">
            <td><span size="4">${pcggList.kind}</span></td>
            <td><span size="4">${pcggList.kmessage}</span></td>
            <td><span size="4">${pcggList.num}</span></td>
            <td><span size="4">${pcggList.unit}</span></td>
            <td><span size="4">${pcggList.ksum}</span></td>
            <td><span size="4">${pcggList.buyaddrs}</span></td>
        </tr>
    </c:forEach>
</table>
<div class="bottom_page">
    <a class="page_change" href="/pcg/admtoCAA" >返回</a>
</div>
</body>
</html>
