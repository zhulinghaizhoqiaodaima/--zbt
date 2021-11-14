<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>欢迎来到员工选择用餐界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>

<div>
    <div class="title">
        <h1 color="#696969">欢迎来到员工选择用餐界面</h1>
    </div>
</div>
<form  method="post" action="${pageContext.request.contextPath}/eat/Cfindemp">
    <span size="4">部门：</span>
    <select name="department">
        <option value="选择部门">选择部门</option>
        <option value="西街本行">西街本行</option>
        <option value="东风路分行">东风路分行</option>
        <option value="车站分行">车站分行</option>
    </select>
    <span size="4">姓名：</span><input type="text" name="name">
    <button type="submit">查询</button>
</form>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">身份</span></th>
        <th><span size="5">姓名</span></th>
        <th><span size="5">行部门</span></th>
        <th><span size="5">操作</span></th>
    </tr>
    <c:forEach var="user" items="${userList}">
        <tr class="detail_goods">
            <td><span size="4">${user.userType}</span></td>
            <td><span size="4">${user.name}</span></td>
            <td><span size="4">${user.department}</span></td>
            <td>
                <a href="/eat/choiceEat/?id=${user.id}" class="look_detail">
                    选择用餐</a>
            </td>
        </tr>
    </c:forEach>
</table>

<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" href="${pageContext.request.contextPath}/eat/choiceemp?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/eat/choiceemp?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/eat/choiceemp?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/eat/choiceemp?pageNum=${page.pages}" title="">尾页</a>
</div>
</body>
</html>
