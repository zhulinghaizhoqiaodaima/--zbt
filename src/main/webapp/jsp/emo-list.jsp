<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<html>
<head>
    <title>欢迎来到员工用餐记录界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到员工用餐记录界面</h1>
    </div>
</div>

    <form method="post" action="${pageContext.request.contextPath}/emp/Cemolist" style="text-align: center;">
        <span size="4">年份：</span><input onkeyup="if(this.value.length==1)
        {this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace
        (/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}
        else{this.value=this.value.replace(/\D/g,'')}" name="year" placeholder="请输入年份"/>

        <span size="4">月份：</span><input onkeyup="if(this.value.length==1)
        {this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                        onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}
         else{this.value=this.value.replace(/\D/g,'')}" name="month" placeholder="请输入月份"/>

        <button type="submit">查询</button>
    </form>

    <table class="tables" align="center" width="100%" border="1">
            <tr style=" text-align:center; font-size: 20px">
                <th><span>年份</span></th>
                <th><span>月份</span></th>
                <th><span >本月用餐次数</span></th>
                <th><span >本月餐饮消费</span></th>
                <th><span >餐饮费状态</span></th>
                <th><span>操作</span></th>
            </tr>
            <c:forEach var="emp" items="${empList}">
                <tr style="background-color: white; text-align: center">
                    <td><font size="4" style="color: #666666">${emp.year}</font></td>
                    <td><font size="4" style="color: #666666">${emp.month}</font></td>
                    <td><font size="4" style="color: #666666">${emp.enumber}</font></td>
                    <td><font size="" style=" color: #c43838">${emp.total}</font></td>
                    <td><span style=" color: #c43838; font-size: 18px;">${emp.state}</span></td>
                    <td>
                        <a class="look_detail" href="/emp/emglist?eOid=${emp.eOid}">查看详情</a>
                    </td>
                </tr>
            </c:forEach>

    </table>
    <div class="bottom_page">
        【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
        页,总共<span>${page.total}</span>条记录】
        <a class="page_change" href="${pageContext.request.contextPath}/emp/emolist?pageNum=1" title="">首页</a>
        <a class="page_change" href="${pageContext.request.contextPath}/emp/emolist?pageNum=${page.prePage}" title="">上一页</a>
        <a class="page_change" href="${pageContext.request.contextPath}/emp/emolist?pageNum=${page.nextPage}" title="">下一页</a>
        <a class="page_change" href="${pageContext.request.contextPath}/emp/emolist?pageNum=${page.pages}" title="">尾页</a>
    </div>


</body>
</html>
