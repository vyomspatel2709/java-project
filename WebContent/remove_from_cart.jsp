<%@page import="com.dao.CartDao"%>
<%@page import="com.bean.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.bean.Wishlist"%>
<%
	int uid=Integer.parseInt(request.getParameter("uid"));
	int pid=Integer.parseInt(request.getParameter("pid"));
	
	Cart c=new Cart();
	c.setUid(uid);
	c.setPid(pid);
	CartDao.removeFromCart(c);
	List<Cart> list=CartDao.getCartByUser(uid);
	session.setAttribute("cart_count", list.size());
	response.sendRedirect("cart.jsp");
%>