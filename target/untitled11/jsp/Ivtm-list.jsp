<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>欢迎来到库存维护界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">库存维护界面</h1>
    </div>
</div>

<a href="/pcg/addIvty" style="display: inline-block;
    width: 100px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    border-radius: 5px;"  type="button" class="login_button">手动录入库存</a>
<a href="/pcg/toaddIvtyByCAA" style="display: inline-block;
    width: 100px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    border-radius: 5px;" type="button" class="login_button">从验收单录入库存</a>

<div>
    <form  method="post" action="${pageContext.request.contextPath}/pcg/CtoIvtm">
        <span size="4">种类：</span>
        <select name="kind">
            <option value="选择种类">选择种类</option>
            <option value="食品类">食品类</option>
            <option value="生活类">生活类</option>
            <option value="其他">其他</option>
        </select>
        <span size="4">名称：</span><input type="text" name="imessage">
        <button type="submit" class="login_button">查询</button>
    </form>
</div>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">名称</span></th>
        <th><span size="5">类别</span></th>
        <th><span size="5">数量</span></th>
        <th><span size="5">单位</span></th>
        <th><span size="5">操作</span></th>
    </tr>
    <c:forEach var="IvtList" items="${IvtList}">
        <tr class="detail_goods">
            <td><span size="4">${IvtList.imessage}</span></td>
            <td><span size="4">${IvtList.kind}</span></td>
            <td><span size="4">${IvtList.inum}</span></td>
            <td><span size="4">${IvtList.unit}</span></td>
            <td>
                <a href="/pcg/toupdateIvt?Ivid=${IvtList.ivid}" class="look_detail"  >
                    修改</a>
                <a href="/pcg/toOutIvt?Ivid=${IvtList.ivid}" class="look_detail"  >
                    出库</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/toIvtm?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/toIvtm?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/toIvtm?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/pcg/toIvtm?pageNum=${page.pages}" title="">尾页</a>
</div>
</body>
</html>
