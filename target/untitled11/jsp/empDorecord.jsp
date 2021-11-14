<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>入住离宿记录</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">

<body>
<div>
    <div class="title">
        <h1 color="#696969">入住离宿记录</h1>
    </div>
</div>
<form  method="post" action="${pageContext.request.contextPath}/emp/CfindDor">
    <span size="4">日期：</span><input type="text" name="bdate"  placeholder="请输入日期"/>
    <button type="submit">查询</button>
</form>

<table class="tables" align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">宿舍编号</span></th>
        <th><span size="5">行为</span></th>
        <th><span size="5">日期</span></th>
    </tr>
    <c:forEach var="dorList" items="${dorlist}">
        <tr class="detail_goods">
            <td><span size="4" style="color: #666666">${dorList.dcoding}</span></td>
            <td><span size="4" style=" color: #c43838">${dorList.behavior}</span></td>
            <td><span size="4" style="color: #666666">${dorList.bdate}</span></td>
        </tr>
    </c:forEach>
</table>
<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" href="${pageContext.request.contextPath}/emp/findDor?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/emp/findDor?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/emp/findDor?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/emp/findDor?pageNum=${page.pages}" title="">尾页</a>
</div>

</body>
</html>
