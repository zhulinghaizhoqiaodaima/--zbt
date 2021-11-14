<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>每日排班信息界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
        //单个删除
        function delDaw(DAid){
            if(confirm("确认删除吗")){
                location.href="${pageContext.request.contextPath}/user/delDaw/"+DAid;
            }
        }
        //结束本日排班
        function ending(){
            if(confirm("确认结束本周吗")){
                location.href="${pageContext.request.contextPath}/user/endDAW/";
            }
        }
    </script>

</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到排班信息界面</h1>
    </div>
</div>
<div>
    <form  method="post" action="${pageContext.request.contextPath}/user/CfindAW">
        <span size="4">岗位：</span>
        <select name="post">
            <option value="选择岗位">选择岗位</option>
            <option value="食堂">食堂</option>
            <option value="维修">维修</option>
            <option value="采购">采购</option>
            <option value="其他">其他</option>
        </select>
        <span size="4">人员：</span><input type="text" name="dname">
        <button type="submit">查询</button>
    </form>
</div>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">日期</span></th>
        <th><span size="5">岗位</span></th>
        <th><span size="5">人员</span></th>
        <th><span size="5">操作</span></th>
    </tr>
    <c:forEach var="daw" items="${dawList}">
        <tr class="detail_goods">
            <td><span size="4">${daw.ddate}</span></td>
            <td><span size="4">${daw.post}</span></td>
            <td><span size="4">${daw.dname}</span></td>
            <td>
               <a href="/user/toupdateDaw?DAid=${daw.DAid}" class="look_detail"  >
                   修改</a>
               <a href="javascript:void(0);" onclick="delDaw('${daw.DAid}')" class="look_detail" >
                   删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a class="page_change" style="width: auto"  href="javascript:void(0);" onclick="ending()" >更换排班</a>
    <a class="page_change" style="width: auto"  href="${pageContext.request.contextPath}/user/findAW?pageNum=1" title="">首页</a>
    <a class="page_change" style="width: auto"  href="${pageContext.request.contextPath}/user/findAW?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" style="width: auto"  href="${pageContext.request.contextPath}/user/findAW?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" style="width: auto" href="${pageContext.request.contextPath}/user/findAW?pageNum=${page.pages}" title="">尾页</a>
</div>
</body>
</html>
