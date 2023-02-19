<%@page import="com.dao.CartDao"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
   <head>
      
   </head>
   <body>
         
      
      <!-- product section -->
      <section class="product_section layout_padding">
         <div class="container">
            <div class="heading_container heading_center">
               <h2>
                  Product <span>Detail</span>
               </h2>
            </div>
            <div class="row">
            	<%
            		int pid=Integer.parseInt(request.getParameter("pid"));
            		int uid=u.getId();
            		boolean wishlist_flag=WishlistDao.getWishlistByPidUid(pid, uid);
            		boolean cart_flag=CartDao.getCartByPidUid(pid, uid);
            		Product p=ProductDao.getProductById(pid);
            	%>
               <div class="col-sm-6 col-md-4 col-lg-4">
                  <div class="box">
                     <div class="option_container">
                        <div class="options">
                          
                          <%
                          	if(u==null)
                          	{
                          %>
                          		<a href="login.jsp" class="option2">
                           			Login
                           		</a>
                           
                          <%		
                          	}
                          	else
                          	{
                          %>
                          		<%
	                           	if(cart_flag==true)
	                           	{
	                           %>
	                           		 <a href="remove_from_cart.jsp?pid=<%=p.getPid()%>&uid=<%=u.getId() %>" class="option2">
			                           Remove From Cart
			                         </a>
	                           <%		
	                           	}
	                           	else
	                           	{
	                           %>
	                           		 <a href="add_to_cart.jsp?pid=<%=p.getPid()%>&uid=<%=u.getId() %>" class="option2">
			                           Add To Cart
			                         </a>
	                           <%		
	                           	}
	                           %>
	                           
	                           <%
	                           	if(wishlist_flag==true)
	                           	{
	                           %>
	                           		 <a href="remove_from_wishlist.jsp?pid=<%=p.getPid()%>&uid=<%=u.getId() %>" class="option2">
			                           Remove From Wishlist
			                         </a>
	                           <%		
	                           	}
	                           	else
	                           	{
	                           %>
	                           		 <a href="add_to_wishlist.jsp?pid=<%=p.getPid()%>&uid=<%=u.getId() %>" class="option2">
			                           Add To Wishlist
			                         </a>
	                           <%		
	                           	}
	                           %>
	                          
                          <%		
                          	}
                          %>	
                           
                        </div>
                     </div>
                     <div class="img-box">
                        <img src="product_images/<%=p.getProduct_image() %>" alt="">
                     </div>
                     <div class="detail-box">
                        <h5>
                           <%=p.getProduct_name() %>
                        </h5>
                        
                     </div>
                     <div class="detail-box">
                        <h5>
                           Price : <%=p.getProduct_price() %>
                        </h5>
                     </div>
                     <div class="detail-box">
                        <h5>
                           Detail : <%=p.getProduct_desc() %>
                        </h5>
                     </div>
                     <div class="detail-box">
                        <h5>
                           Category : <%=p.getProduct_category() %>
                        </h5>
                     </div>
                  </div>
               </div>
               
         </div>
      </section>
      <!-- end product section -->

      
      <!-- footer start -->
      <footer>
         <div class="container">
            <div class="row">
               <div class="col-md-4">
                   <div class="full">
                      <div class="logo_footer">
                        <a href="#"><img width="210" src="images/logo.png" alt="#" /></a>
                      </div>
                      <div class="information_f">
                        <p><strong>ADDRESS:</strong> 28 White tower, Street Name New York City, USA</p>
                        <p><strong>TELEPHONE:</strong> +91 987 654 3210</p>
                        <p><strong>EMAIL:</strong> yourmain@gmail.com</p>
                      </div>
                   </div>
               </div>
               <div class="col-md-8">
                  <div class="row">
                  <div class="col-md-7">
                     <div class="row">
                        <div class="col-md-6">
                     <div class="widget_menu">
                        <h3>Menu</h3>
                        <ul>
                           <li><a href="#">Home</a></li>
                           <li><a href="#">About</a></li>
                           <li><a href="#">Services</a></li>
                           <li><a href="#">Testimonial</a></li>
                           <li><a href="#">Blog</a></li>
                           <li><a href="#">Contact</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="widget_menu">
                        <h3>Account</h3>
                        <ul>
                           <li><a href="#">Account</a></li>
                           <li><a href="#">Checkout</a></li>
                           <li><a href="#">Login</a></li>
                           <li><a href="#">Register</a></li>
                           <li><a href="#">Shopping</a></li>
                           <li><a href="#">Widget</a></li>
                        </ul>
                     </div>
                  </div>
                     </div>
                  </div>     
                  <div class="col-md-5">
                     <div class="widget_menu">
                        <h3>Newsletter</h3>
                        <div class="information_f">
                          <p>Subscribe by our newsletter and get update protidin.</p>
                        </div>
                        <div class="form_sub">
                           <form>
                              <fieldset>
                                 <div class="field">
                                    <input type="email" placeholder="Enter Your Mail" name="email" />
                                    <input type="submit" value="Subscribe" />
                                 </div>
                              </fieldset>
                           </form>
                        </div>
                     </div>
                  </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- footer end -->
      <div class="cpy_">
         <p>© 2021 All Rights Reserved By <a href="https://html.design/">Free Html Templates</a></p>
      </div>
      <!-- jQery -->
      <script src="js/jquery-3.4.1.min.js"></script>
      <!-- popper js -->
      <script src="js/popper.min.js"></script>
      <!-- bootstrap js -->
      <script src="js/bootstrap.js"></script>
      <!-- custom js -->
      <script src="js/custom.js"></script>
   </body>
</html>