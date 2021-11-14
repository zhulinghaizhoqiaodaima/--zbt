<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>欢迎来到物品验收界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="../css/asset.css">
</head>
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到维修记录界面</h1>
    </div>
</div>
<form  method="post" action="${pageContext.request.contextPath}/pcg/CtoCAA">
    <span size="4">验收状态：</span>
    <select name="state">
        <option value="验收状态">验收状态</option>
        <option value="已验收">已验收</option>
        <option value="未验收">未验收</option>
    </select>
    <select name="ARstate">
        <option value="报销状态">报销状态</option>
        <option value="已报销">已报销</option>
        <option value="未报销">未报销</option>
    </select>
    <button type="submit">查询</button>
</form>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">订单生成人</span></th>
        <th><span size="5">物品种类</span></th>
        <th><span size="5">总金额</span></th>
        <th><span size="5">状态</span></th>
        <th><span size="5">验收时间</span></th>
        <th><span size="5">报销状态</span></th>
        <th><span size="5">操作</span></th>
    </tr>
    <c:forEach var="pcgList" items="${pcgList}">
        <tr class="detail_goods">
            <td><span size="4">${pcgList.name}</span></td>
            <td><span size="4">${pcgList.kindnum}</span></td>
            <td><span size="4">${pcgList.sum}</span></td>
            <td><span size="4" color="#a52a2a">${pcgList.state}</span></td>
            <td><span size="4">${pcgList.wtime}</span></td>
            <td><span size="4" color="#a52a2a">${pcgList.ARstate}</span></td>
            <td>
                <a href="/pcg/CAAmessage?ppid=${pcgList.ppid}"  class="look_detail"  >
                    查看详情
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/toCAA?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/toCAA?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/toCAA?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/toCAA?pageNum=${page.pages}" title="">尾页</a>
</div>

</body>
</html>
