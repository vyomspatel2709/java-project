package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Cart;
import com.bean.User;
import com.bean.Wishlist;
import com.dao.CartDao;
import com.dao.UserDao;
import com.dao.WishlistDao;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("sign up"))
		{
			boolean flag=UserDao.checkEmail(request.getParameter("email"));
			if(flag==true)
			{
				request.setAttribute("msg", "Email Already Registered");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
			else if(request.getParameter("password").equals(request.getParameter("cpassword")))
			{
				User u=new User();
				u.setFname(request.getParameter("fname"));
				u.setLname(request.getParameter("lname"));
				u.setEmail(request.getParameter("email"));
				u.setMobile(Long.parseLong(request.getParameter("mobile")));
				u.setAddress(request.getParameter("address"));
				u.setPassword(request.getParameter("password"));
				u.setUsertype(request.getParameter("usertype"));
				UserDao.signupUser(u);
				request.setAttribute("msg", "User Sign Up Successfull");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
			else
			{
				String msg="Password & Confirm Password Does Not Matched";
				request.setAttribute("msg",msg);
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("login"))
		{
			User u=UserDao.checkLogin(request.getParameter("email"), request.getParameter("password"));
			if(u==null)
			{
				String msg="Email Or Password Is Incorrect";
				request.setAttribute("msg",msg);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else if(u.getUsertype().equals("user"))
			{
				HttpSession session=request.getSession();
				List<Wishlist> list=WishlistDao.getWishlistByUser(u.getId());
				session.setAttribute("wishlist_count", list.size());
				List<Cart> list1=CartDao.getCartByUser(u.getId());
				session.setAttribute("cart_count", list1.size());
				session.setAttribute("u", u);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else
			{
				HttpSession session=request.getSession();
				session.setAttribute("u", u);
				request.getRequestDispatcher("seller_index.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("change password"))
		{
			HttpSession session=request.getSession();
			User u=(User) session.getAttribute("u");
			
			if(u.getPassword().equals(request.getParameter("old_password")))
			{
				if(request.getParameter("new_password").equals(request.getParameter("cnew_password")))
				{
					UserDao.chagePassword(u.getEmail(), request.getParameter("new_password"));
					response.sendRedirect("logout.jsp");
				}
				else if(u.getUsertype().equals("user"))
				{
					String msg="New Password & Confirm New Password Does Not Matched";
					request.setAttribute("msg",msg);
					request.getRequestDispatcher("changepassword.jsp").forward(request, response);
				}
				else
				{
					String msg="New Password & Confirm New Password Does Not Matched";
					request.setAttribute("msg",msg);
					request.getRequestDispatcher("seller_changepassword.jsp").forward(request, response);
				}
			}
			else if(u.getUsertype().equals("user"))
			{
				String msg="Old Password Is Incorrect";
				request.setAttribute("msg",msg);
				request.getRequestDispatcher("changepassword.jsp").forward(request, response);
			}
			else
			{
				String msg="Old Password Is Incorrect";
				request.setAttribute("msg",msg);
				request.getRequestDispatcher("seller_changepassword.jsp").forward(request, response);
			}
		}
	}

}
