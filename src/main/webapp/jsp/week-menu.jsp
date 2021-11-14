<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎来到菜单信息界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到菜单信息界面</h1>
    </div>
</div>
<div>

</div>
<table class="tables"  align="center" width="100%" border="1">
    <tr style="font-size: 20px; text-align:center;">
        <th><span size="5">月份</span></th>
        <th><span size="5">第几周</span></th>
        <th><span size="5">周几</span></th>
        <th><span size="5">荤菜1</span></th>
        <th><span size="5">荤菜2</span></th>
        <th><span size="5">素菜</span></th>
        <th><span size="5">汤</span></th>
        <th><span size="5">选项</span></th>
    </tr>
    <c:forEach var="menu" items="${menuList}">
        <tr style="background-color: white; text-align: center;color: #666666">
            <td><font size="4">${menu.month}</font></td>
            <td><font size="4">${menu.week}</font></td>
            <td><font size="4">${menu.weekday}</font></td>
            <td><font size="4">${menu.meatone}</font></td>
            <td><font size="4">${menu.meattwo}</font></td>
            <td><font size="4">${menu.vegetable}</font></td>
            <td><font size="4">${menu.soup}</font></td>
            <td>
                <a href="/menu/updatmenu?mid=${menu.mid}" class="look_detail" >
                    修改</a>
                <a href="javascript:void(0);" onclick="delmenu('${menu.mid}')" class="look_detail">
                    删除</a>
            </td>
        </tr>
    </c:forEach>

</table>
</div>

<div class="bottom_page">
    <a href="/menu/addmenuy"  class="page_change">新增本周菜单</a>
    <a class="page_change" href="javascript:void(0);" onclick="ending('${menu.week}')" >上线下周菜单</a>
</div>

<script>
    //单个删除
    function delmenu(mid){
        if(confirm("确认删除吗")){
            location.href="${pageContext.request.contextPath}/menu/del/"+mid;
        }
    }
    //结束本周菜单
    function ending(week){
        if(confirm("确认结束本周吗")){
            location.href="${pageContext.request.contextPath}/menu/end/"+week;
        }
    }
</script>
</body>
</html>
