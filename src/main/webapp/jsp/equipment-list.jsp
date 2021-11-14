<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>欢迎来到设备信息界面</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
            //报修
            function repairs(eqid){
            if(confirm("该设备确认报修？")){
            location.href="${pageContext.request.contextPath}/equipment/torepairs/"+eqid;
                }
          }
            //报废
            function scrap(eqid){
                if(confirm("确认报废该设备？")){
                    location.href="${pageContext.request.contextPath}/equipment/toscrap/"+eqid;
                }
            }
        </script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到设备信息界面</h1>
    </div>
</div>

<form style="text-align: center;"  method="post" action="${pageContext.request.contextPath}/equipment/Ctofindequipment">
    <span size="4">所属部门：</span>
    <select name="department">
        <option value="选择部门">选择部门</option>
        <option value="前台">前台</option>
        <option value="宿舍">宿舍</option>
        <option value="食堂">食堂</option>
        <option value="其他">其他</option>
    </select>
    <span size="4">设备名：</span><input type="text" name="eqname">
    <span size="4">状态：</span>
    <select name="eqstate">
        <option value="状态">状态</option>
        <option value="正常">正常</option>
        <option value="维修中">维修中</option>
    </select>
    <button type="submit" class="login_button">查询</button>
</form>
<table class="tables"  align="center" width="100%" border="1">
    <tr class="header_size">
        <th><span size="5">设备名</span></th>
        <th width="40%"><span size="5">设备信息</span></th>
        <th><span size="5">所属部门</span></th>
        <th><span size="5" color="#a52a2a">状态</span></th>
        <th><span size="5">上一次维修时间</span></th>
        <th><span size="5">操作</span></th>
    </tr>
    <c:forEach var="EqList" items="${EqList}">
        <tr class="detail_goods">
            <td><span size="4">${EqList.eqname}</span></td>
            <td width="40%"><span size="4">${EqList.eqmessage}</span></td>
            <td><span size="4">${EqList.department}</span></td>
            <td><span size="4" color="#a52a2a">${EqList.eqstate}</span></td>
            <td><span size="4">${EqList.wtime}</span></td>
            <td>
                <a href="javascript:void(0);" onclick="repairs('${EqList.eqid}')" class="look_detail" >
                    报修</a>
                <a href="/equipment/updateEq?eqid=${EqList.eqid}" class="look_detail"  >
                    修改信息</a>
            </td>
        </tr>
    </c:forEach>
</table>

<div class="bottom_page">
    【当前第<span>${page.pageNum}</span>页，总共<span>${page.pages}</span>
    页,总共<span>${page.total}</span>条记录】
    <a href="/equipment/toaddEq" class="page_change">新增</a>
    <a class="page_change" href="${pageContext.request.contextPath}/equipment/tofindequipment?pageNum=1" title="">首页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/equipment/tofindequipment?pageNum=${page.prePage}" title="">上一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/equipment/tofindequipment?pageNum=${page.nextPage}" title="">下一页</a>
    <a class="page_change" href="${pageContext.request.contextPath}/equipment/tofindequipment?pageNum=${page.pages}" title="">尾页</a>
</div>
</body>
</html>
