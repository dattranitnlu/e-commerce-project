<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- modal large -->
<div class="modal fade" id="listCategory-${param.categoryid}" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="largeModalLabel">Large Modal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-lg-12">
                            <h2 class="title-1 m-b-25">List Products Of Category</h2>
                            <div class="table-responsive table--no-card m-b-40">
                                <table class="table table-borderless table-striped table-earning">
                                    <thead>
                                    <tr>

                                        <th>Product ID</th>
                                        <th>Product name</th>
                                        <th class="text-right">Price</th>

                                    </tr>
                                    </thead>

                                    <sql:setDataSource var="root" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                                       url="jdbc:sqlserver://den1.mssql8.gear.host;databaseName=lapshop" user="lapshop"
                                                       password="Kq9lPD!D?9L4"/>
                                    <sql:query var="result" dataSource="${root}">
                                        SELECT * FROM PRODUCT P WHERE P.CATEGORYID = ${param.categoryid};
                                    </sql:query>
                                    <tbody>

                                    <c:forEach var="product" items="${result.rows}">

                                        <tr>
                                            <td>${product.productid}</td>
                                            <td>${product.productname}</td>
                                            <td class="text-right">${product.productprice}</td>
                                        </tr>

                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Confirm</button>
            </div>
        </div>
    </div>
</div>
