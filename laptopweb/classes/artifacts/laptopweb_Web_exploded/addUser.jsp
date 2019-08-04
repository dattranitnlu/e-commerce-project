<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<sql:setDataSource var="root" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/lapshop" user="root"
                   password="root"/>

<!-- modal large -->
<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="largeModalLabel">Add user</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form name="formAddUser" onsubmit="return checkPassWord()" action="AddUserServlet" method="post">
                <div class="modal-body">

                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label class=" form-control-label">Fullname:</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" name="fullname" placeholder="Fullname..."
                                   class="form-control" required>

                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label class=" form-control-label">Username</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" name="username" placeholder="Username..."
                                   class="form-control" required>

                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label class=" form-control-label">Password</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="password" name="password1" placeholder="Type password..."
                                   class="form-control" required>

                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label class=" form-control-label">Retype Password</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="password" name="password2" placeholder="Retype Password..."
                                   class="form-control" required>

                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label class=" form-control-label">Role</label>
                        </div>

                        <sql:query var="roles" dataSource="${root}">
                            select * from userrole
                        </sql:query>
                        <div class="col-12 col-md-9">
                            <select class="form-control" id="selectType" name="userrole">

                                <c:forEach var="role" items="${roles.rows}">
                                    <option value="${role.userroleid}">${role.rolename}</option>
                                </c:forEach>

                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>

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
<script>
    function checkPassWord() {
        var password = document.forms["formAddUser"]["password1"].value;
        var retypePassword = document.forms["formAddUser"]["password2"].value;
        if(password != retypePassword) {
            alert("Two password field isn't correct. Please type correct!");
            return false;
        }
    }
</script>