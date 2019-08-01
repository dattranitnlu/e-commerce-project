<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>Categories Management</title>
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

                                <button class="au-btn au-btn-icon au-btn--blue"  data-toggle="modal" data-target="#addCategory">
                                    <i class="zmdi zmdi-plus"></i>Add category</button>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-5">
                        <div class="col-lg-12">
                            <h2 class="title-1 m-b-25">List Category</h2>
                            <div class="table-responsive table--no-card m-b-40">
                                <table class="table table-borderless table-striped table-earning">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Category ID</th>
                                            <th>Category name</th>
                                            <th class="text-right">Options</th>

                                        </tr>
                                    </thead>

                                    <sql:setDataSource var="root" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/lapshop" user="root" password="root" />
                                    <sql:query var="result" dataSource="${root}">
                                        SELECT * FROM CATEGORY;
                                    </sql:query>
                                    <tbody>
                                        <c:set var="index" value="${1}"></c:set>
                                        <c:forEach var="category" items="${result.rows}">
                                            <tr>
                                                <td>${index}</td>
                                                <td>${category.categoryid}</td>
                                                <td>${category.categoryname}</td>
                                                <td class="text-right">
                                                    <a href="#"><i class="fas fa-info-circle"></i></a>

                                                    <a href="#"><i class="fas fa-pencil-square-o"></i></a>
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
    </div>

</div>

<jsp:include page="addCategory.jsp" />

<jsp:include page="common/linkjs.jsp"/>
</body>

</html>

