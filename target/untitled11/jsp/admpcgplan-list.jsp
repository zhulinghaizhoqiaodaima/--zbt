<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>管理员查看购物单</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">查看购物单界面</h1>
    </div>
</div>
<form  method="post" action="${pageContext.request.contextPath}/pcg/Cadmtopcgplan">
    <span size="4">生成时间：</span><input type="text" name="ctime">
    <button type="submit">查询</button>
</form>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">订单生成人</span></th>
        <th><span size="5">物品种类</span></th>
        <th><span size="5">生成时间</span></th>
        <th><span size="5">操作</span></th>
    </tr>
    <c:forEach var="pcgList" items="${pcgList}">
        <tr class="detail_goods">
            <td><span size="4">${pcgList.name}</span></td>
            <td><span size="4">${pcgList.kindnum}</span></td>
            <td><span size="4">${pcgList.ctime}</span></td>
            <td>
                <a href="/pcg/admpcgmessage?ppid=${pcgList.ppid}" class="look_detail" >
                    查看详情</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/admtopcgplan?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/admtopcgplan?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/admtopcgplan?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/admtopcgplan?pageNum=${page.pages}" title="">尾页</a>
</div>
</body>
</html>
