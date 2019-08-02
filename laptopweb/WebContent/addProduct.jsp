<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<sql:setDataSource var="root" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/lapshop" user="root" password="root" />
<sql:query var="result" dataSource="${root}">
    SELECT CATEGORYNAME FROM CATEGORY;
</sql:query>

<div class="container">
    <!-- The Modal -->
    <div class="modal" id="addProduct">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Adding Product</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="AddProductServlet" method="post" class="form-horizontal">
                    <!-- Modal body -->
                    <div class="modal-body">

                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class=" form-control-label">Product name</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <input type="text" name="productname" placeholder="Category name..."
                                       class="form-control">
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class=" form-control-label">Price</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <input type="text" name="productname" placeholder="Category name..."
                                       class="form-control">
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class=" form-control-label">Type</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <select class="form-control" id="exampleFormControlSelect1">

                                    <c:forEach var="item" items="${result.rows}">
                                        <option>${item}</option>
                                    </c:forEach>

                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class=" form-control-label">Description</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <input type="text" name="productname" placeholder="Category name..."
                                       class="form-control">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa fa-dot-circle-o"></i> OK
                        </button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

