<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>点餐系统管页</title>
</head>
<body>
<!-- 导航条 -->
<div class="wrapper">
    <jsp:include page="emp/head.jsp"></jsp:include>
</div>


<div>
    <!-- 左侧栏 -->
    <jsp:include page="emp/leftsidebar.jsp"></jsp:include>
</div>
<!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
<div class="content-wrapper">

    <jsp:include page="emp/show.jsp"></jsp:include>


</div>


<div>
    <!-- 尾部 -->
    <jsp:include page="emp/foot.jsp"></jsp:include>
</div>

</body>
</html>
