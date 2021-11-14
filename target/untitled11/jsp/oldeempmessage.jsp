<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎来到员工用餐详细信息界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到员工用餐详细信息界面</h1>
    </div>
</div>
<div>

</div>
<table class="tables"  align="center" width="70%" border="1">
    <tr class="header_size">
        <th><span size="5">身份</span></th>
        <th><span size="5">姓名</span></th>
        <th><span size="5">行部门</span></th>
        <th><span size="5">操作</span></th>
    </tr>
    <c:forEach var="oldeat" items="${oldeatList}">
        <tr class="detail_goods">
            <td><span size="4">${oldeat.userType}</span></td>
            <td><span size="4">${oldeat.name}</span></td>
            <td><span size="4">${oldeat.department}</span></td>
            <td>
                <a class="look_detail" href="javascript:void(0);" onclick="deleem('${oldeat.geOid}')"  >
                    删除</a>
            </td>
        </tr>
    </c:forEach>
    <tr class="detail_goods">
        <td colspan="4">
            <span size="5">该天总用餐人数：</span>
            <span size="5" color="#a52a2a">${eenum}</span>
        </td>
    </tr>
</table>

<div class="bottom_page">
    <a class="page_change" href="/eat/findoldeemp" ><span size="5" color="#a52a2a">返回</span></a>
</div>

</div>

<script>
    //单个删除
    function deleem(geOid){
        if(confirm("确认删除吗")){
            location.href="${pageContext.request.contextPath}/eat/deleatemp/"+geOid;
        }
    }
</script>
</body>
</html>
