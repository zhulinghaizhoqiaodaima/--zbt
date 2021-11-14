<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>宿舍列表</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">

<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到宿舍列表界面</h1>
    </div>
</div>
<form  method="post" action="${pageContext.request.contextPath}/dormitory/CadmtoDolist">
    <span size="4">宿舍编号：</span><input type="text" name="dcoding">
    <span size="4">入住状态：</span>
    <select name="dstate">
        <option value="选择状态">选择状态</option>
        <option value="已入住">已入住</option>
        <option value="未入住">未入住</option>
    </select>
    <span size="4">入住人名：</span><input type="text" name="rname">
    <button type="submit" >查询</button>
</form>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">宿舍编号</span></th>
        <th><span size="5">宿舍信息</span></th>
        <th><span size="5">入住状态</span></th>
        <th><span size="5">入住人</span></th>
        <th><span size="5">入住时间</span></th>
    </tr>
    <c:forEach var="doList" items="${doList}">
        <tr class="detail_goods">
            <td><span size="4">${doList.dcoding}</span></td>
            <td><span size="4">${doList.dmessage}</span></td>
            <td><span size="4" color="#a52a2a">${doList.dstate}</span></td>
            <td><span size="4">${doList.rname}</span></td>
            <td width="20%"><span size="4">${doList.rdate}</span></td>
        </tr>
    </c:forEach>
</table>

<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" href="${pageContext.request.contextPath}/dormitory/admtoDolist?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/dormitory/admtoDolist?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/dormitory/admtoDolist?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/dormitory/admtoDolist?pageNum=${page.pages}" title="">尾页</a>
</div>
</body>
</html>
