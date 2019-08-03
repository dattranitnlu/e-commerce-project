<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<sql:setDataSource var="root" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/lapshop" user="root" password="root" />

<!-- modal large -->
<div class="modal fade" id="addProduct" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="largeModalLabel">Add product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" method="post">
            <div class="modal-body">
                <div class="row form-group">
                    <div class="col col-md-3">
                        <label class=" form-control-label">Product ID</label>
                    </div>
                    <div class="col-12 col-md-9">
                        <input type="text" name="productid" placeholder="product ID..."
                               class="form-control">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col col-md-3">
                        <label class=" form-control-label">Product name</label>
                    </div>
                    <div class="col-12 col-md-9">
                        <input type="text" name="productname" placeholder="product name..."
                               class="form-control">

                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col col-md-3">
                        <label class=" form-control-label">Product price</label>
                    </div>
                    <div class="col-1 col-md-1"><h3>$</h3></div>
                    <div class="col-11 col-md-8">
                        <input type="text" name="category" placeholder="Price..."
                               class="form-control">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3">
                        <label class=" form-control-label">Type</label>
                    </div>

                    <sql:query var="result" dataSource="${root}">
                        SELECT CATEGORYNAME FROM CATEGORY;
                    </sql:query>
                    <div class="col-12 col-md-9">
                        <select class="form-control" id="selectType">
                            <c:forEach var="type" items="${result.rows}">
                                <option>${type.categoryname}</option>
                            </c:forEach>
                        </select>
                        <span class="help-block"></span>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Confirm</button>
            </div>
            </form>
        </div>
    </div>
</div>
<!-- end modal large -->
