package com.jee.web.guest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jee.web.global.Command;
import com.jee.web.global.SimpleCommandFactory;


/**
 * Servlet implementation class ProductController
 */
@WebServlet("/control/guest.do")
public class GuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SimpleCommandFactory factory = new SimpleCommandFactory();   
	String  view;
	Command command ; 
	List<GuestVo>glist = new ArrayList<GuestVo>();
	GuestVo gvo;
	
   
	public void init(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p0 = request.getServletPath().split("/")[2];
		String p1 = p0.substring(0,p0.indexOf("."));
		String p2 = request.getParameter("command");
		String p3 = request.getParameter("pageNO");
		String p4 = request.getParameter("keyField");
		String p5 = request.getParameter("keyword");
		if(p2 == null){ p2 = "main";}
		if(p3 == null){	p3 = "1"; }
		if(p4 == null){ p4 = "NONE";}
		if(p5 == null){ p5 = "NONE";}
		System.out.println("param2 :"+ p2);
		System.out.println("param3 :"+ p3);
		System.out.println("param4 :"+ p4);
		System.out.println("param5 :"+ p5);
		command = factory.createCommand(p1,p2,p3,p4,p5);
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		init(request,response);
		System.out.println("컨트롤러 명령어 : "+command.getCommand());
		if(command.getKeyword().equals("NONE")){
			System.out.println("컨트롤러에 검색어가 없습니다.");
		}
			
		switch (command.getCommand()) {
		/*case "main": process(request,response,"main");break;*/
		case "main" :
			if(command.getKeyword().equals("NONE")){
				command.setStart(command.getPageNO(), command.PAGESIZE);
				command.setEnd(command.getPageNO());
				request.setAttribute("list", GuestDao.getInstance().getGuestList(command));
				request.setAttribute("totCount",GuestDao.getInstance().getTotalCount() );
			}else{
				request.setAttribute("list", GuestDao.getInstance().getGuestSearch(command));
				request.setAttribute("totCount", GuestDao.getInstance().getSearchCount());
			}
			request.setAttribute("pageNO", command.getPageNO());
			process(request,response,"main");
			break;
		case "detail":
			if(command.getKeyword().equals("NONE")){
				System.out.println("검색어가 없습니다.");
				//response.sendRedirect("/views/guest/main.jsp");
			}else{
				System.out.println("case 통과한 컨트롤러 검색어는 "+command.getKeyword());
				gvo = GuestDao.getInstance().getOneGuestByID(command);
				System.out.println("게스트 객체 리턴값 :"+gvo.getName());
				request.setAttribute("guest", GuestDao.getInstance().getOneGuestByID(command));
				request.setAttribute("result", "detail");
			}
			process(request,response,"main");
			break;
		case "edit":
			String name = request.getParameter("name");
			String title = request.getParameter("title");
			String pay = request.getParameter("pay");
			gvo.setName(name);
			gvo.setTitle(title);
			gvo.setPay(Integer.parseInt(pay));
			int result = GuestDao.getInstance().updateGuestTitle(gvo);
			if(result == 1){
				System.out.println("성공적으로 수정됨");
			}
			request.setAttribute("guest", GuestDao.getInstance().getOneGuestByID(command));
			process(request, response, "main");
			break;
		default:
			break;
		}
	}
	private void process(HttpServletRequest request, HttpServletResponse response,String view) throws ServletException, IOException {
		
		RequestDispatcher dis = request.getRequestDispatcher("/views/guest/"+view+".jsp");
		dis.forward(request, response);
	}
}
