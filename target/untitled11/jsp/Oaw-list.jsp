<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎来到历史排班信息列表界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到历史排班信息列表界面</h1>
    </div>
</div>
<form  method="post" action="${pageContext.request.contextPath}/user/CfindOAW">
    <span size="4">日期：</span><input type="text" name="awdate">
    <button type="submit">查询</button>
</form>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">日期</span></th>
        <th><span size="5">排班人数</span></th>
        <th><span size="5">排班人</span></th>
        <th><span size="5">操作</span></th>
    </tr>
    <c:forEach var="oaw" items="${oawList}">
        <tr class="detail_goods">
            <td><span size="4">${oaw.awdate}</span></td>
            <td><span size="4">${oaw.awnum}</span></td>
            <td><span size="4">${oaw.cname}</span></td>
            <td>
                <a class="look_detail" href="/user/findOgAW?AWid=${oaw.AWid}"  >
                    查看详情</a>
            </td>
        </tr>
    </c:forEach>
</table>

<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" href="${pageContext.request.contextPath}/user/findOAW?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/user/findOAW?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/user/findOAW?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/user/findOAW?pageNum=${page.pages}" title="">尾页</a>
</div>
</div>
</body>
</html>
