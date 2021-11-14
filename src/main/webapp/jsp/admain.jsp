<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--总页面--%>
<html>
<head>
    <title>银行后勤管理员</title>
</head>
<body>
    <!-- 导航条 -->
    <div class="wrapper">
        <jsp:include page="commom/head.jsp"></jsp:include>
    </div>


<div>
    <!-- 左侧栏 -->
    <jsp:include page="commom/leftsidebar.jsp"></jsp:include>
</div>
    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
        <div class="content-wrapper">

            <jsp:include page="commom/show.jsp"></jsp:include>


        </div>


        <div>
        <!-- 尾部 -->
            <jsp:include page="commom/foot.jsp"></jsp:include>
        </div>


</body>
</html>
