<%-- 
    Document   : content
    Created on : May 23, 2017, 10:09:56 PM
    Author     : nhtoan
--%>

<%@page import="model.Product"%>
<%@page import="dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>content</title>
    </head>
    <body>
        <%
            ProductDao productDAO = new ProductDao();
        %>
        <div class="container">
            <div class="content">
                <div class="content-top">
                    <h3 class="future">FEATURED</h3>
                    <div class="content-top-in">
                        <%
                            for (Product p : productDAO.getProductByPrice()) {
                        %>
                        <div class="col-md-3 md-col">
                            <div class="col-md">

                                <a href="single.jsp?productID=<%=p.getProductID()%>"><img  src="<%=p.getProductImage()%>" alt="" /></a>	
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
                        <% }%>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <!---->
                <div class="content-middle">
                    <h3 class="future">BRANDS</h3>
                    <div class="content-middle-in">
                        <ul id="flexiselDemo1">			
                            <li><img src="images/ap.png"/></li>
                            <li><img src="images/ap1.png"/></li>
                            <li><img src="images/ap2.png"/></li>
                            <li><img src="images/ap3.png"/></li>

                        </ul>
                        <script type="text/javascript">
                            $(window).load(function () {
                                $("#flexiselDemo1").flexisel({
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
                <!---->
                <div class="content-bottom">
                    <h3 class="future">NOT FINISH</h3>
                    <div class="content-bottom-in">
                        <ul id="flexiselDemo2">			
                            <li><div class="col-md men">
                                    <a href="single.html" class="compare-in "><img  src="images/pi4.jpg" alt="" />
                                        <div class="compare in-compare">
                                            <span>Add to Compare</span>
                                            <span>Add to Whislist</span>
                                        </div></a>
                                    <div class="top-content bag">
                                        <h5><a href="single.html">Symbolic Bag</a></h5>
                                        <div class="white">
                                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
                                            <p class="dollar"><span class="in-dollar">$</span><span>4</span><span>0</span></p>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>							
                                </div></li>
                            <li><div class="col-md men">
                                    <a href="single.html" class="compare-in "><img  src="images/pi5.jpg" alt="" />
                                        <div class="compare in-compare">
                                            <span>Add to Compare</span>
                                            <span>Add to Whislist</span>
                                        </div></a>	
                                    <div class="top-content bag">
                                        <h5><a href="single.html">Interesting Read</a></h5>
                                        <div class="white">
                                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
                                            <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>5</span></p>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>							
                                </div></li>
                            <li><div class="col-md men">
                                    <a href="single.html" class="compare-in "><img  src="images/pi6.jpg" alt="" />
                                        <div class="compare in-compare">
                                            <span>Add to Compare</span>
                                            <span>Add to Whislist</span>
                                        </div></a>	
                                    <div class="top-content bag">
                                        <h5><a href="single.html">The Carter</a></h5>
                                        <div class="white">
                                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
                                            <p class="dollar"><span class="in-dollar">$</span><span>1</span><span>0</span></p>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>							
                                </div></li>
                            <li><div class="col-md men">
                                    <a href="single.html" class="compare-in "><img  src="images/pi7.jpg" alt="" />
                                        <div class="compare in-compare">
                                            <span>Add to Compare</span>
                                            <span>Add to Whislist</span>
                                        </div></a>	
                                    <div class="top-content bag">
                                        <h5><a href="single.html">Onesie</a></h5>
                                        <div class="white">
                                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
                                            <p class="dollar"><span class="in-dollar">$</span><span>6</span><span>0</span></p>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>							
                                </div></li>

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
                    </div>
                </div>
                <ul class="start">
                    <li ><a href="#"><i></i></a></li>
                    <li><span>1</span></li>
                    <li class="arrow"><a href="#">2</a></li>
                    <li class="arrow"><a href="#">3</a></li>
                    <li class="arrow"><a href="#">4</a></li>
                    <li class="arrow"><a href="#">5</a></li>
                    <li ><a href="#"><i  class="next"> </i></a></li>
                </ul>
            </div>
        </div>
    </body>
</html>
