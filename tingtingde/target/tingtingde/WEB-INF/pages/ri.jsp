<%@ page import="com.w.util.DateAndString" %>
<%--
  Created by IntelliJ IDEA.
  User: destiny
  Date: 2018/6/24/0024
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title></title>
    <link rel="stylesheet" href="resources/css/admin.css" type="text/css"/>
    <script type="text/javascript" src="resources/js/index.js"></script>
    <script src="resources/js/jquery.js"></script>
    <script>
        $(function () {
            $(".recall").click(function () {
                var riid=parseInt($(this).prev().val());
                if (!confirm("确认撤回")){
                    return false;
                }
                $.ajax({
                    type:"post",
                    url:"recall",
                    data:{riid:riid},
                    success:function (obj) {//成功后回调函数
                        alert(obj);
                        location.reload(true);
                    },
                    error:function (obj) {

                    }
                })
            })
            $(".issue").click(function () {
                var riid=parseInt($(this).prev().val());
                if (!confirm("确认发布")){
                    return false;
                }
                $.ajax({
                    type:"post",
                    url:"issue",
                    data:{riid:riid},
                    success:function (obj) {//成功后回调函数
                        alert(obj);
                        location.reload(true);
                    },
                    error:function (obj) {

                    }
                })
            })
            $(".delete").click(function () {
                var riid=parseInt($(this).siblings().eq(0).val());
                 if (!confirm("确认删除")){
                     return false;
                 }
                $.ajax({
                    type:"post",
                    url:"delete",
                    data:{riid:riid},
                    success:function (obj) {//成功后回调函数
                        alert(obj);
                        location.reload(true);
                    },
                    error:function (obj) {

                    }
                })
            })
            $("a").mouseenter(function () {
                $(this).css("background-color","aquamarine");
            });
            $("a").mouseleave(function () {
                $(this).css("background-color","inherit");
            });
        })
    </script>
</head>
<body>
<div id="d">
    <div id="d4">
        <%--<img src="resources/images/1.gif" style="width: 1000px;height: 83px">--%>
    </div>
    <div id="d1">
        <div id="d11">
            <a href="adminLogin.jsp">&emsp;${admin.adname}</a>
        </div>
        <div id="d12">
            <a href="admin" >员工管理&emsp;</a>
            <a href="pay" >薪资管理&emsp;</a>
            <a href="organizationalManagement" >组织管理&emsp;</a>
            <a href="attendanceInformation">考勤管理&emsp;</a>
            <a href="cultivate">培训管理&emsp;</a>
            <a href="ri" style="color: red">招聘信息&emsp;</a>
            <a href="r">招聘管理&emsp;</a>
            <a href="rap">奖惩管理&emsp;</a>
        </div>
    </div>
    <div id="d5">
        <a href="ri?ristate=0"
                <c:if test="${ristate eq 0}">
                    style="color: red"
                </c:if>
        >未发布&emsp;</a>
        <a href="ri?ristate=1"
                <c:if test="${ristate eq 1}">
                    style="color: red"
                </c:if>>已发布&emsp;</a>
        <a href="addRi">添加</a>
    </div>
    <div id="d3" style="font-size: 24px">
        <div id="d31">
            <table >
                <tr style="background-color: #faebd7">
                    <th width="40px">ID</th>
                    <th width="120px">部门</th>
                    <th width="120px">职位</th>
                    <th width="100px">基本工资</th>
                    <th width="60px">人数</th>
                    <th width="180px">简介</th>
                    <th width="200px">发布时间</th>
                    <th width="180px">操作</th>
                </tr>
                <c:forEach items="${recruitInformations}" var="recruitInformation" varStatus="loop">
                    <tr >
                        <td>${recruitInformation.riid}</td>
                        <td>${recruitInformation.department.dname}</td>
                        <td>${recruitInformation.job.jname}</td>
                        <td>${recruitInformation.job.jsalary}</td>
                        <td>${recruitInformation.rinum}</td>
                        <td>${recruitInformation.riintro}</td>
                        <td>${DateAndString.dateToStringTime(recruitInformation.ridate)}</td>
                        <td><input type="hidden" name="riid" value="${recruitInformation.riid}" id="riid">
                            <c:if test="${recruitInformation.ristate eq 1}">
                                <input type="button" value="撤回" class="recall">
                            </c:if>
                            <c:if test="${recruitInformation.ristate eq 0}">
                                <input type="button" value="发布" class="issue"/>
                                <a href="alter?riid=${recruitInformation.riid}">修改</a>
                                <input type="button" value="删除" class="delete"/>
                            </c:if>
                        </td>

                    </tr>
                </c:forEach>
                    <tr>
                        <td colspan="8" id="str" style="color: red"></td>
                    </tr>
            </table>
        </div>
        <div id="d32" >
            <a href="ri?ristate=${ristate}&currentPage=${currentPage-1==0?currentPage:currentPage-1}">上一页</a>
            <a href="ri?ristate=${ristate}&currentPage=${currentPage}">第${currentPage}页</a>
            共${totalPages}页
            <a href="ri?ristate=${ristate}&currentPage=${currentPage+1>totalPages?currentPage:currentPage+1}">下一页</a>
            <form action="ri?ristate=${ristate}" method="post">
                <input style="width: 30px" type="number" min="1" max="${totalPages}" value="${currentPage}" name="currentPage">
                <input type="submit" value="跳转">
            </form>
        </div>
    </div>
</div>
</body>
</html>
