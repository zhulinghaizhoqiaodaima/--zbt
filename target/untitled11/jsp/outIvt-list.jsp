<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>库存-欢迎来到出库记录界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到出库记录界面</h1>
    </div>
</div>
<form  method="post" action="${pageContext.request.contextPath}/pcg/CfindoutIvtm">
    <span size="4">取货人：</span><input type="text" name="uname">
    <span size="4">物品名：</span><input type="text" name="iname">
    <button type="submit">查询</button>
</form>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">取货人</span></th>
        <th><span size="5">物品名</span></th>
        <th><span size="5">数量</span></th>
        <th><span size="5">单位</span></th>
        <th><span size="5">出库时间</span></th>
        <th><span size="5">操作人</span></th>
    </tr>
    <c:forEach var="outList" items="${outList}">
        <tr class="detail_goods">
            <td><span size="4">${outList.uname}</span></td>
            <td><span size="4">${outList.iname}</span></td>
            <td><span size="4">${outList.num}</span></td>
            <td><span size="4">${outList.unit}</span></td>
            <td><span size="4">${outList.ctime}</span></td>
            <td><span size="4">${outList.cname}</span></td>
        </tr>
    </c:forEach>
</table>

<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/findoutIvtm?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/findoutIvtm?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/findoutIvtm?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/findoutIvtm?pageNum=${page.pages}" title="">尾页</a>
</div>
</body>
</html>
