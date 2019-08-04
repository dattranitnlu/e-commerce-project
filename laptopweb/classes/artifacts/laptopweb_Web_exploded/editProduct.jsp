<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<sql:setDataSource var="root" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/lapshop" user="root"
                   password="root"/>

<!-- modal large -->
<div class="modal fade" id="editProduct-${param.productid}" tabindex="-1" role="dialog"
     aria-labelledby="largeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="largeModalLabel">Add product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <sql:query var="result" dataSource="${root}">
                SELECT * FROM PRODUCT P WHERE P.PRODUCTID = ${param.productid};
            </sql:query>
            <form action="EditProductServlet" method="post">
                <div class="modal-body">

                    <c:forEach var="product" items="${result.rows}">

                        <div class="row form-group">
<%--                            <div class="col col-md-3">--%>
<%--                                <label class=" form-control-label">Product ID</label>--%>
<%--                            </div>--%>
                            <div class="col-12 col-md-9">
                                <input type="text" name="productid" placeholder="product id..."
                                       value="${product.productid}"
                                       class="form-control" hidden>

                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class=" form-control-label">Product name</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <input type="text" name="productname" placeholder="product name..."
                                       value="${product.productname}"
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
                                <input type="text" name="productprice" placeholder="Price..."
                                       value="${product.productprice}"
                                       class="form-control">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class=" form-control-label">Type</label>
                            </div>

                            <sql:query var="cate" dataSource="${root}">
                                SELECT * FROM CATEGORY;
                            </sql:query>
                            <div class="col-12 col-md-9">
                                <select class="form-control" id="selectType" name="categorytype">

                                    <c:forEach var="type" items="${cate.rows}">
                                        <c:choose>
                                            <c:when test="${product.categoryid == type.categoryid}">
                                                <option value="${type.categoryid}"
                                                        selected>${type.categoryname}</option>
                                            </c:when>

                                            <c:otherwise>
                                                <option value="${type.categoryid}">${type.categoryname}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label for="textarea-input" class=" form-control-label">Description</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <textarea name="productdescription" id="textarea-input" rows="9"
                                          placeholder="Description..."
                                          class="form-control">${product.productdescription}</textarea>
                            </div>
                        </div>

                    </c:forEach>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Confirm</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- end modal large -->