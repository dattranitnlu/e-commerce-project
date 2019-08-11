<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html>
<head>
    <title>Products Management</title>
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
                                        data-target="#addProduct">
                                    <i class="zmdi zmdi-plus"></i>Add Product
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-5">
                        <div class="col-lg">
                            <h2 class="title-1 m-b-25">List Products</h2>
                            <div class="table-responsive table--no-card m-b-40">
                                <table class="table table-borderless table-striped table-earning">
                                    <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Product ID</th>
                                        <th>Product name</th>
                                        <th>Product image</th>
                                        <th>Price</th>
                                        <th>Category</th>
                                        <th class="text-right">Options</th>

                                    </tr>
                                    </thead>

                                    <sql:setDataSource var="root" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                                       url="jdbc:sqlserver://den1.mssql8.gear.host;databaseName=lapshop" user="lapshop"
                                                       password="Kq9lPD!D?9L4"/>
                                    <sql:query var="result" dataSource="${root}">
                                        SELECT *
                                        FROM PRODUCT P, CATEGORY C
                                        WHERE P.CATEGORYID = C.CATEGORYID;
                                    </sql:query>
                                    <tbody>
                                    <jsp:useBean id="map" class="java.util.HashMap" scope="request"/>
                                    <c:set var="index" value="${1}"></c:set>
                                    <c:forEach var="product" items="${result.rows}">
                                        <tr>
                                            <td>${index}</td>
                                            <td>${product.productid}</td>
                                            <td>${product.productname}</td>

                                            <c:set var="image" value="${product.productimage}"/>
                                            <c:choose>
                                                <c:when test="${fn:trim(image) == \"\" || image == null}">
                                                    <td>
                                                        <form action = "UploadServlet?id=${product.productid}" method = "post"
                                                              enctype = "multipart/form-data">
                                                            <input type = "file" name = "file" size = "10" />
                                                            <br>

                                                            <input type = "submit" value = "Upload" />
                                                        </form>
                                                    </td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>
                                                        <img src="images/${image}" alt="${image}" width="50px"
                                                             height="50px"/>
                                                        <form action = "UploadServlet?id=${product.productid}" method = "post"
                                                              enctype = "multipart/form-data">
                                                            <input type = "file" name = "file" size = "10" />
                                                            <br>

                                                            <input type = "submit" value = "Upload" />
                                                        </form>
                                                    </td>

                                                </c:otherwise>
                                            </c:choose>

                                            <td><strong>$${product.productprice}</strong></td>
                                            <td>${product.categoryname}</td>
                                            <td class="text-right">
<%--                                                <button data-toggle="modal"--%>
<%--                                                        data-target="#listCategory-${product.productid}">--%>
<%--                                                    <i class="fas fa-info-circle"></i></button>--%>
                                                <c:set target="${requestScope.map}" property="${product.productid}"
                                                       value="${product.productid}"/>

                                                <button data-toggle="modal"
                                                        data-target="#editProduct-${product.productid}"><i
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

        <jsp:include page="addProduct.jsp"/>
    </div>

</div>


<c:forEach items="${requestScope.map}" var="item">
    <jsp:include page="editProduct.jsp?productid=${item.value}"/>
</c:forEach>

<jsp:include page="common/linkjs.jsp"/>
</body>
</html>
