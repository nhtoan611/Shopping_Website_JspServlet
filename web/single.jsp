<%-- 
    Document   : detail
    Created on : May 25, 2017, 2:44:23 PM
    Author     : nhtoan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <title>Bonfire a Ecommerce Category Flat Bootstarp Responsive Website Template | Single :: w3layouts</title>
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
        <link rel="stylesheet" href="css/etalage.css">
        <script src="js/jquery.etalage.min.js"></script>
        <script>
            jQuery(document).ready(function ($) {

                $('#etalage').etalage({
                    thumb_image_width: 300,
                    thumb_image_height: 400,
                    source_image_width: 900,
                    source_image_height: 1200,
                    show_hint: true,
                    click_callback: function (image_anchor, instance_id) {
                        alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                    }
                });

            });
        </script>
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
    <body>
        <%
            CategoryDAO categoryDAO = new CategoryDAO();
            ProductDao productDao = new ProductDao();
            String productID = "";
            Product product = new Product();
            if (request.getParameter("productID") != null) {
                productID = request.getParameter("productID");
                product = productDao.getProduct(Long.parseLong(productID));
            }

        %>

        <jsp:include page="header.jsp"></jsp:include>

            <div class="container">
                <div class="single">
                    <div class="col-md-9 top-in-single">
                        <div class="col-md-5 single-top">	
                            <ul id="etalage">
                                <li>
                                    <a href="optionallink.html">
                                        <img class="etalage_thumb_image img-responsive" src="<%=product.getProductImage()%>" alt="" >
                                    <img class="etalage_source_image img-responsive" src="<%=product.getProductImage()%>" alt="" >
                                </a>
                            </li>
                        </ul>

                    </div>	
                    <div class="col-md-7 single-top-in">
                        <div class="single-para">
                            <h4><%=product.getProductName()%></h4>
                            <div class="para-grid">
                                <span  class="add-to">$<%=product.getProductPrice()%></span>
                                <a href="CartServlet?command=plus&productID=<%=productID %>" class="hvr-shutter-in-vertical cart-to">Add to Cart</a>					
                                <div class="clearfix"></div>
                            </div>
                            <h5>100 items in stock</h5>
                            <div class="available">
                                <h6>Available Options :</h6>
                                <ul>
                                    <li>Color:
                                        <select>
                                            <option>Silver</option>
                                            <option>Black</option>
                                            <option>Dark Black</option>
                                            <option>Red</option>
                                        </select></li>
                                    <li>Size:<select>
                                            <option>Large</option>
                                            <option>Medium</option>
                                            <option>small</option>
                                            <option>Large</option>
                                            <option>small</option>
                                        </select></li>
                                    <li>Quality:<select>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select></li>
                                </ul>
                            </div>
                            <p><%=product.getProductDesription()%></p>

                            <a href="#" class="hvr-shutter-in-vertical ">More details</a>

                        </div>
                    </div>
                    <div class="clearfix"> </div>
                    <div class="content-top-in">
                        <div class="single-bottom">
                            <br><h4>Related Product</h4><br>
                        </div>
                         <%
                            long categoryID = product.getCategoryID();
                            ArrayList<Product> listProduct = productDao.getListProductByCategoryLimit(categoryID, Long.parseLong(productID));
                            for (Product p : listProduct) {
                        %>
                        <div class="col-md-4 top-single">
                            <div class="col-md">
                                <a href="single.jsp?productID=<%=p.getProductID() %>"><img  src="<%=p.getProductImage() %>" alt="<%=p.getProductName()%>" /></a>
                                <div class="top-content">
                                    <h5><a href="single.jsp?productID=<%=p.getProductID() %>"><%=p.getProductName() %></a></h5>
                                    <div class="white">
                                        <a href="CartServlet?command=plus&productID=<%=p.getProductID() %>" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
                                        <p class="dollar"><span class="in-dollar">$</span><span><%=p.getProductPrice() %></span></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>							
                            </div>
                        </div>
                        <%
                            }
                        %>

                        <div>

                            <div class="fb-comments" data-href="http://nhtoan611.jelastic.skali.net/Shop/single.jsp?productID=<%=productID%>" data-width="850" data-numposts="5"></div>      

                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="single-bottom">
                        <h4>Categories</h4>
                        <ul>
                            <%
                                for (Category c : categoryDAO.getListCategory()) {
                            %>
                            <li><a href="product.jsp?category=<%=c.getCategoryID()%>&pages=1"><i> </i><%=c.getCategoryName()%></a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>

                    <div class="single-bottom">
                        <h4>Product Categories</h4>
                        <ul>
                            <li><a href="#"><i> </i>feugiat(5)</a></li>
                            <li><a href="#"><i> </i>Fusce (4)</a></li>
                            <li><a href="#"><i> </i> feugiat (4)</a></li>
                            <li><a href="#"><i> </i>Fusce (4)</a></li>
                            <li><a href="#"><i> </i> feugiat(2)</a></li>
                        </ul>
                    </div>

                    <div class="single-bottom">
                        <h4>Product Categories</h4>
                        <div class="product">
                            <img class="img-responsive fashion" src="images/st1.jpg" alt="">
                            <div class="grid-product">
                                <a href="#" class="elit">Consectetuer adipiscing elit</a>
                                <span class="price price-in"><small>$500.00</small> $400.00</span>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="product">
                            <img class="img-responsive fashion" src="images/st2.jpg" alt="">
                            <div class="grid-product">
                                <a href="#" class="elit">Consectetuer adipiscing elit</a>
                                <span class="price price-in"><small>$500.00</small> $400.00</span>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="product">
                            <img class="img-responsive fashion" src="images/st3.jpg" alt="">
                            <div class="grid-product">
                                <a href="#" class="elit">Consectetuer adipiscing elit</a>
                                <span class="price price-in"><small>$500.00</small> $400.00</span>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
