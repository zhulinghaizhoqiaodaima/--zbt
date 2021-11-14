<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
        //单个删除
        function dellm(lMid){
            if(confirm("确认删除吗")){
                location.href="${pageContext.request.contextPath}/eat/dellm/"+lMid;
            }
        }
    </script>
    <link rel="stylesheet" href="../css/asset.css">
</head>
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到留言界面</h1>
    </div>
</div>
<form  method="post" action="${pageContext.request.contextPath}/eat/Clmessage">
    <span size="4">姓名：</span><input type="text" name="name">
    <button type="submit">查询</button>
</form>
<div class="result-wrap">
    <div>
        <table class="tables" width="100%" border="1" align="center" >
            <tr class="header_size">
                <th><span size="5">留言人</span></th>
                <th width="52%"><span size="5">留言信息</span></th>
                <th><span size="5">留言时间</span></th>
                <th><span size="5">操作</span></th>
            </tr>
            <c:forEach var="lmessage" items="${lmessageList}">
                <tr class="detail_goods">
                    <td><span size="4">${lmessage.name}</span></td>
                    <td width="52%"><span size="4">${lmessage.message}</span></td>
                    <td><span size="4">${lmessage.ltime}</span></td>
                    <td>
                        <a href="javascript:void(0);" onclick="dellm('${lmessage.lMid}')" class="look_detail">
                            删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
