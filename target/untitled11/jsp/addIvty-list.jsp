<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>物品验收界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到物品验收界面</h1>
    </div>
</div>

<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">订单生成人</span></th>
        <th><span size="5">物品种类</span></th>
        <th><span size="5">状态</span></th>
        <th><span size="5">入库时间</span></th>
        <th><span size="5">操作</span></th>
    </tr>
    <c:forEach var="pcgList" items="${pcgList}">
        <tr style="background-color: cornsilk; text-align: center">
            <td><span size="4">${pcgList.name}</span></td>
            <td><span size="4">${pcgList.kindnum}</span></td>
            <td><span size="4" color="#a52a2a">${pcgList.ivtstate}</span></td>
            <td><span size="4">${pcgList.rtime}</span></td>
            <td>
                <a href="/pcg/addIvtm?ppid=${pcgList.ppid}" style="width:80px;height:40px;background-color:goldenrod;color:#FFFFCC;border-radius:15px"  >
                    查看详情</a>
                <a href="/pcg/BPS?ppid=${pcgList.ppid}" style="width:80px;height:40px;background-color:goldenrod;color:#FFFFCC;border-radius:15px"  >
                    物品入库</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
