<%-- 
    Document   : contact
    Created on : May 23, 2017, 10:27:42 PM
    Author     : nhtoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
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
        <jsp:include page="header.jsp"></jsp:include>

            <div class="container">
                <div class="contact">
                    <h2 class=" contact-in">CONTACT</h2>

                    <div class="col-md-6 contact-top">
                        <h3>Info</h3>
                        <div class="map">
                         <iframe src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJKQqAE44ANTERDbkQYkF-mAI&key=AIzaSyDoDCDiI61HnoNaRtaY7cPcctRWo-KG-2g" allowfullscreen"></iframe>			
                        </div>

                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas </p>
                        <p>Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id </p>				
                        <ul class="social ">
                            <li><span><i > </i>9, Minh Khai, Ha Noi</span></li>
                            <li><span><i class="mes"> </i>+ 84 969220842</span></li>
                            <li><a href="mailto:info@example.com"><i class="down"> </i>nhtoan611@gmail.com</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 contact-top">
                        <h3>Want to work with me?</h3>
                        <div>
                            <span>Your Name </span>		
                            <input type="text" value="" >						
                        </div>
                        <div>
                            <span>Your Email </span>		
                            <input type="text" value="" >						
                        </div>
                        <div>
                            <span>Subject</span>		
                            <input type="text" value="" >	
                        </div>
                        <div>
                            <span>Your Message</span>		
                            <textarea> </textarea>	
                        </div>
                        <input type="submit" value="SEND" >	
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
