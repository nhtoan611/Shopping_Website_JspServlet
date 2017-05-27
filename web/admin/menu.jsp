<%-- 
    Document   : menu
    Created on : May 27, 2017, 11:57:53 AM
    Author     : nhtoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin menu</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <div id="leftBar">
            <ul>
                <li><a href="${root}/Shop/admin/index.jsp">Trang chủ</a></li>
                <li><a href="${root}/Shop/admin/manager_category.jsp">Danh mục</a></li>
                <li><a href="${root}/Shop/admin/manager_product.jsp">Sản phẩm</a></li>
                <li><a href="${root}/Shop/admin/manager_bill.jsp">Hóa đơn</a></li>
                <li><a href="${root}/Shop/admin/manager_chart.jsp">Biểu đồ </a></li>
            </ul>
        </div>
    </body>
</html>
