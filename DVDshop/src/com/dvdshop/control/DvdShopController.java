package com.dvdshop.control;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.SetCharacterEncodingFilter;

import com.dvdshop.dao.DvdShopDAO;
import com.dvdshop.vo.DvdInfo;
import com.dvdshop.vo.MemberVO;
@WebServlet("/shop/control")
public class DvdShopController extends HttpServlet{


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	
		String menu = request.getParameter("menu");
		String genre = request.getParameter("genre");
		String detail = request.getParameter("detail");
		String login = (String) request.getSession().getAttribute("login");
		String logout = request.getParameter("logout");
		
	
		
	
		if(menu==null) {
			DvdShopDAO dao = new DvdShopDAO();
			List<DvdInfo> list =dao.mainMovie();
			request.setAttribute("list", list);
			
			
			request.getRequestDispatcher("../view/main/shopMain.jsp").forward(request, response);
		}else if(menu.equals("movie")) {
			DvdShopDAO dao = new DvdShopDAO();
			Map<String, String> map = new HashMap<String, String>();
			map.put("genre", genre);
			
			List<DvdInfo>list = dao.genreMovie(map);
			request.setAttribute("genre", list);
			request.getRequestDispatcher("../view/main/genre.jsp").forward(request, response);
		}else if(menu.equals("join")) {
			DvdShopDAO dao = new DvdShopDAO();
			
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String birth = request.getParameter("year")+"-"+request.getParameter("month") + "-"
						+ request.getParameter("day");
			
			String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2")
			+ "-"+request.getParameter("phone3");
			String email = request.getParameter("email") + "@" + request.getParameter("domain");
			
		
			MemberVO vo = new MemberVO();
			vo.setMember_id(id);
			vo.setMember_pass(pass);
			vo.setMember_birth(birth);
			vo.setMember_phone(phone);
			vo.setMember_email(email);
			
			dao.memberJoin(vo);
			 response.sendRedirect("../shop/control");
				
		}else if (menu.equals("info")) {
			DvdShopDAO dao = new DvdShopDAO();
			DvdInfo info = dao.dvdDetail(detail);
			request.setAttribute("info", info);
			request.getRequestDispatcher("../view/main/selectedDVD.jsp").forward(request, response);
			
		}else if (menu.equals("confirm")) {
			if(login==null || !login.equals("success")) {
				PrintWriter out = response.getWriter();		
				out.print("<script>alert('please, login'); location.href='../shop/control'</script>");
								
			}else {
				
				String guest = request.getParameter("guest");
				String code = request.getParameter("rentalcode");
				DvdShopDAO dao = new DvdShopDAO();
				Map<String,String> map = new HashMap<String, String>();
				map.put("code",code);
				map.put("guest",guest);
				
				if(dao.dvdRental(map)) {
					dao.dvdStock(code);
				request.getRequestDispatcher("../view/main/rental_confirm.jsp").forward(request, response);
				}
			
				
				
			}
			
			
			
			
	
		}
		
	}
	
	
}
