<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
    <!-- The Modal -->
    <div class="modal" id="editProduct-${param.productid}">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Edit Product</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <sql:setDataSource var="root" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/lapshop"
                                   user="root" password="root"/>
                <sql:query var="result" dataSource="${root}">
                    SELECT * FROM PRODUCT P WHERE P.PRODUCTID = ${param.productid};
                </sql:query>
                <form action="EditProductServlet" method="post" class="form-horizontal">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <c:forEach var="item" items="${result.rows}">
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class=" form-control-label">ID</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" name="productid" placeholder="product ID..."
                                           class="form-control" value="${item.productid}" disabled>
                                    <span class="help-block"></span>
                                </div>
                            </div>


                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class=" form-control-label">Name</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" name="productname" placeholder="product name..."
                                           class="form-control" value="${item.productname}">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </c:forEach>
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
