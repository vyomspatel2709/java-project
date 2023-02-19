<%@page import="java.util.List"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.bean.Wishlist"%>
<%
	int uid=Integer.parseInt(request.getParameter("uid"));
	int pid=Integer.parseInt(request.getParameter("pid"));
	
	Wishlist w=new Wishlist();
	w.setUid(uid);
	w.setPid(pid);
	WishlistDao.removeFromWishlist(w);
	//request.setAttribute("msg","Product Added To Wishlist");
	List<Wishlist> list=WishlistDao.getWishlistByUser(uid);
	session.setAttribute("wishlist_count", list.size());
	response.sendRedirect("wishlist.jsp");
%>