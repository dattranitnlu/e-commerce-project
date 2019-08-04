<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Users Management</title>
    <jsp:include page="common/linkcss.jsp"/>
</head>
<body class="animsition">

<div class="page-wrapper">

    <jsp:include page="common/menu.jsp"/>

    <div class="page-container">

        <jsp:include page="common/header.jsp"/>

        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="overview-wrap">

                                <button class="au-btn au-btn-icon au-btn--blue" data-toggle="modal"
                                        data-target="#addUser">
                                    <i class="zmdi zmdi-plus"></i>Add User
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-5">
                        <div class="col-lg">
                            <h2 class="title-1 m-b-25">List Users</h2>
                            <div class="table-responsive table--no-card m-b-40">
                                <table class="table table-borderless table-striped table-earning">
                                    <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>User ID</th>
                                        <th>Username</th>
                                        <th>Avatar</th>
                                        <th>Role</th>
                                        <th class="text-right">Options</th>

                                    </tr>
                                    </thead>

                                    <sql:setDataSource var="root" driver="com.mysql.jdbc.Driver"
                                                       url="jdbc:mysql://localhost:3306/lapshop" user="root"
                                                       password="root"/>
                                    <sql:query var="result" dataSource="${root}">
                                        SELECT * FROM USER;
                                    </sql:query>
                                    <tbody>
                                    <jsp:useBean id="map" class="java.util.HashMap" scope="request"/>
                                    <c:set var="index" value="${1}"></c:set>
                                    <c:forEach var="user" items="${result.rows}">
                                        <tr>
                                            <td>${index}</td>
                                            <td>${user.userid}</td>
                                            <td>${user.useremail}</td>

                                            <c:set var="image" value="${user.userimage}"/>
                                            <c:choose>
                                                <c:when test="${fn:trim(image) == \"\" || image == null}">
                                                    <td>
                                                        <form action="UploadUserImageServlet?id=${user.userid}"
                                                              method="post"
                                                              enctype="multipart/form-data">
                                                            <input type="file" name="file" size="10"/>
                                                            <br>

                                                            <input type="submit" value="Upload"/>
                                                        </form>
                                                    </td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>
                                                        <img src="images/${image}" alt="${image}" width="50px"
                                                             height="50px"/>
                                                        <form action="UploadUserImageServlet?id=${user.userid}"
                                                              method="post"
                                                              enctype="multipart/form-data">
                                                            <input type="file" name="file" size="10"/>
                                                            <br>

                                                            <input type="submit" value="Upload"/>
                                                        </form>
                                                    </td>

                                                </c:otherwise>
                                            </c:choose>

                                            <td>

                                                <sql:query var="roles" dataSource="${root}">
                                                    select * from userrole
                                                </sql:query>
                                                <c:forEach var="role" items="${roles.rows}">
                                                    <c:if test="${user.userroleid == role.userroleid}">
                                                        <strong>${role.rolename}</strong>
                                                    </c:if>
                                                </c:forEach>

                                            </td>

                                            <td class="text-right">
                                                <button data-toggle="modal"
                                                        data-target="#infoUser-${user.userid}">
                                                    <i class="fas fa-info-circle"></i></button>
                                                <c:set target="${requestScope.map}" property="${user.userid}"
                                                       value="${user.userid}"/>

                                                <button data-toggle="modal"
                                                        data-target="#editUser-${user.userid}"><i
                                                        class="fas fa-pencil-square-o"></i></button>

                                            </td>
                                        </tr>
                                        <c:set var="index" value="${index + 1}"></c:set>

                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="copyright">
                                <p>Copyright © 2019. Template by <a href="index.jsp">Dat Tran</a>.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT-->

        <jsp:include page="addUser.jsp"/>
    </div>

</div>


<c:forEach items="${requestScope.map}" var="item">
    <jsp:include page="editUser.jsp?userid=${item.value}"/>
</c:forEach>

<jsp:include page="common/linkjs.jsp"/>
</body>
</html>
