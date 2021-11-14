<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>库存->入库记录界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到入库记录界面</h1>
    </div>
</div>
<div>
    <form  method="post" action="${pageContext.request.contextPath}/pcg/CfindaddIvtm">
        <span size="4">种类：</span>
        <select name="kind">
            <option value="选择种类">选择种类</option>
            <option value="食品类">食品类</option>
            <option value="生活类">生活类</option>
            <option value="其他">其他</option>
        </select>
        <span size="4">物品名：</span><input type="text" name="iname">
        <button type="submit">查询</button>
    </form>
</div>
<table class="tables"  align="center" width="100%" border="1">
    <tr style=" text-align:center; font-size: 20px">
        <th><span size="5">物品名</span></th>
        <th><span size="5">种类</></th>
        <th><span size="5">数量</span></th>
        <th><span size="5">单位</span></th>
        <th><span size="5">购买地</span></th>
        <th><span size="5">入库时间</span></th>
        <th><span size="5">入库人</span></th>
    </tr>
    <c:forEach var="addList" items="${addList}">
        <tr class="detail_goods">
            <td><span size="4">${addList.iname}</span></td>
            <td><span size="4">${addList.kind}</span></td>
            <td><span size="4">${addList.num}</span></td>
            <td><span size="4">${addList.unit}</span></td>
            <td><span size="4">${addList.buyaddress}</span></td>
            <td><span size="4">${addList.rtime}</span></td>
            <td><span size="4">${addList.cname}</span></td>
        </tr>
    </c:forEach>
</table>


<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/findaddIvtm?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/findaddIvtm?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/findaddIvtm?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/findaddIvtm?pageNum=${page.pages}" title="">尾页</a>
</div>
</body>
</html>
