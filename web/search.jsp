<%-- 
    Document   : search
    Created on : Jun 8, 2017, 5:01:53 PM
    Author     : nhtoan
--%>

<%@page import="dao.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <!--theme-style-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Bonfire Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--fonts-->
        <link href='http://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <!--//fonts-->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!--slider-script-->
        <script src="js/responsiveslides.min.js"></script>
        <script>
            $(function () {
                $("#slider1").responsiveSlides({
                    auto: true,
                    speed: 500,
                    namespace: "callbacks",
                    pager: true,
                });
            });
        </script>
        <!--//slider-script-->
        <script>$(document).ready(function (c) {
                $('.alert-close').on('click', function (c) {
                    $('.message').fadeOut('slow', function (c) {
                        $('.message').remove();
                    });
                });
            });
        </script>
        <script>$(document).ready(function (c) {
                $('.alert-close1').on('click', function (c) {
                    $('.message1').fadeOut('slow', function (c) {
                        $('.message1').remove();
                    });
                });
            });
        </script>
    </head>
    
        <%
            String search_name = "";
            if (request.getParameter("search_name") != null) {
                search_name = request.getParameter("search_name");
            }
            ProductDao productDAO = new ProductDao();
            ArrayList<Product> listProduct = productDAO.getListProductByName(search_name);
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <%
            if(listProduct.size()<=4){
        %>
        <div class="container">
            <div class="products">
                <h2 class=" products-in">Search result</h2>


                <div class="top-products">

                    <%                        for (Product p : listProduct) {
                    %>
                    <div class="col-md-3 md-col">
                        <div class="col-md">
                            <a href="single.jsp?productID=<%=p.getProductID()%>"><img  src="<%=p.getProductImage()%>" alt="<%=p.getProductName()%>" /></a>	
                            <div class="top-content">
                                <h5><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h5>
                                <div class="white">
                                    <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">ADD TO CART</a>
                                    <p class="dollar"><span class="in-dollar">$</span><span><%=p.getProductPrice()%></span></p>
                                    <div class="clearfix"></div>
                                </div>
                            </div>							
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
                    <% }else{ %>


        <div class="container">
            <div class="content">
                <div class="content-bottom">
                    <h2 class=" products-in">Search result</h2>
                    <div class="content-bottom-in">
                        <ul id="flexiselDemo2">	
                            <%
                                for (Product p : listProduct) {
                            %>
                            <li><div class="col-md men">
                                    <a href="single.jsp?productID=<%=p.getProductID()%>"><img  src="<%=p.getProductImage()%>" alt="<%=p.getProductName()%>" /></a>
                                    <div class="top-content bag">
                                        <h5><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h5>
                                        <div class="white">
                                            <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">ADD TO CART</a>
                                            <p class="dollar"><span class="in-dollar">$</span><span><%=p.getProductPrice()%></span></p>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>							
                                </div></li>
                                <% }%>
                        </ul>
                        <script type="text/javascript">
                            $(window).load(function () {
                                $("#flexiselDemo2").flexisel({
                                    visibleItems: 4,
                                    animationSpeed: 1000,
                                    autoPlay: true,
                                    autoPlaySpeed: 3000,
                                    pauseOnHover: true,
                                    enableResponsiveBreakpoints: true,
                                    responsiveBreakpoints: {
                                        portrait: {
                                            changePoint: 480,
                                            visibleItems: 1
                                        },
                                        landscape: {
                                            changePoint: 640,
                                            visibleItems: 2
                                        },
                                        tablet: {
                                            changePoint: 768,
                                            visibleItems: 3
                                        }
                                    }
                                });

                            });
                        </script>
                        <script type="text/javascript" src="js/jquery.flexisel.js"></script>
                    </div>
                </div>

            </div>
        </div>
                        <%}%>
        <jsp:include page="footer.jsp"></jsp:include>
    
</html>
