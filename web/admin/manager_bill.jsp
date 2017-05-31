<%-- 
    Document   : manager_bill
    Created on : May 27, 2017, 3:07:18 PM
    Author     : nhtoan
--%>

<%@page import="dao.UsersDAO"%>
<%@page import="model.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BillDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager bill</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
         
        <%
           BillDAO billDAO = new BillDAO();
           ArrayList<Bill> listBill = billDAO.getListBill();
           UsersDAO usersDAO = new UsersDAO();
        %>

        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Manager bill</h3>

                    <table class="data">
                        <tr class="data">
                            <th class="data" width="30px">Bill id</th>
                            <th class="data">User id</th>
                            <th class="data">Total</th>
                            <th class="data">Method</th>
                            <th class="data">Address</th>
                            <th class="data">Date</th>
                            <th class="data" width="120px">Options</th>
                        </tr>
                        
                        <%for(Bill bill : listBill){%>
                        <tr class="data">
                            <td class="data" width="30px"><%=bill.getBillID()%></td>
                            <td class="data"><%=usersDAO.getUser(bill.getUserID()).getUserEmail()%></td>
                            <td class="data"><%=bill.getTotal()%></td>
                            <td class="data"><%=bill.getPayment()%></td>
                            <td class="data"><%=bill.getAddress()%></td>
                            <td class="data"><%=bill.getDate()%></td>
                            <td class="data" width="120px">
                                <center>
                                    <a href="#">Confirm</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                                    <a href="#">Delete</a>
                                </center>
                            </td>
                        </tr>
                        <%}%>

                    </table>
                </div>
                <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>

        </div>
    </body>
</html>
