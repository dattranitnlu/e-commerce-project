<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <c:set var="root" value="${pageContext.request.contextPath}"/>

        <!-- Jquery JS-->
        <script src="${root}/vendor/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="${root}/vendor/bootstrap-4.1/popper.min.js"></script>
        <script src="${root}/vendor/bootstrap-4.1/bootstrap.min.js"></script>
        <!-- Vendor JS       -->
        <script src="${root}/vendor/slick/slick.min.js">
        </script>
        <script src="${root}/vendor/wow/wow.min.js"></script>
        <script src="${root}/vendor/animsition/animsition.min.js"></script>
        <script src="${root}/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
        </script>
        <script src="${root}/vendor/counter-up/jquery.waypoints.min.js"></script>
        <script src="${root}/vendor/counter-up/jquery.counterup.min.js">
        </script>
        <script src="${root}/vendor/circle-progress/circle-progress.min.js"></script>
        <script src="${root}/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="${root}/vendor/chartjs/Chart.bundle.min.js"></script>
        <script src="${root}/vendor/select2/select2.min.js">
        </script>

        <!-- Main JS-->
        <script src="${root}/js/main.js"></script>
    </body>
</html>
