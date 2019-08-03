<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
    <!-- The Modal -->
    <div class="modal" id="editCategory-${param.categoryid}">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Edit Category</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <sql:setDataSource var="root" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/lapshop"
                                   user="root" password="root"/>
                <sql:query var="result" dataSource="${root}">
                    SELECT * FROM CATEGORY CA WHERE CA.CATEGORYID = ${param.categoryid};
                </sql:query>
                <form action="EditCategoryServlet" method="post" class="form-horizontal">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <c:forEach var="item" items="${result.rows}">
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class=" form-control-label">ID</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" name="categoryid" placeholder="Category ID..."
                                           class="form-control" value="${param.categoryid}" disabled>
                                    <input type="hidden" name="id" placeholder="Category ID..."
                                           class="form-control" value="${param.categoryid}">
                                    <span class="help-block"></span>
                                </div>
                            </div>


                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class=" form-control-label">Name</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" name="categoryname" placeholder="Category name..."
                                           class="form-control" value="${item.categoryname}">
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

