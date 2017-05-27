<%-- 
    Document   : insert_category
    Created on : May 27, 2017, 3:13:39 PM
    Author     : nhtoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật danh mục</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <%
            String error="";
            if(request.getParameter("error")!=null){
                error=request.getParameter("error");
            }
            %>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Thông tin danh mục</h3>
                    <hr>
                    <a href="/Shop/admin/manager_category.jsp">Quay lại</a>
                    <form action="/Shop/ManagerCategoryServlet" method="post">
                    <table width="95%">
                        <tr><td><b>Tên danh mục</b></td><td><input type="text" class="sedang" name="category_name"><%=error %></td></tr>
                        
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="category_id" value="<%=request.getParameter("category_id") %>">
                                <input type="submit" class="button" value="Save">
                            </td></tr>
                    </table>
                    </form>
                </div>
                <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>

        </div>
    </body>
</html>
