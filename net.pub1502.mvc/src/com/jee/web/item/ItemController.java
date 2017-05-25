package com.jee.web.item;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jee.web.global.Command;
import com.jee.web.global.SimpleCommandFactory;


/**
 * Servlet implementation class ItemController
 */
@WebServlet("/control/item.do")
public class ItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SimpleCommandFactory factory = new SimpleCommandFactory();   
	String  view;
	Command command ;    
	ItemVo ivo = new ItemVo();
   
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
		System.out.println("p1 :"+ p1);
		System.out.println("p2 :"+ p2);
		System.out.println("p3 :"+ p3);
		System.out.println("p4 :"+ p4);
		System.out.println("p5 :"+ p5);
		command = factory.createCommand(p1,p2,p3,p4,p5);
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		init(request,response);
		switch (command.getCommand()) {
		case "main": 
			if(command.getKeyword().equals("NONE")){
				command.setStart(command.getPageNO(), command.PAGESIZE);
				command.setEnd(command.getPageNO());
				System.out.println("list :" + ItemDao.getInstance().getItemList());
				request.setAttribute("list", ItemDao.getInstance().getItemList());
				request.setAttribute("totCount",ItemDao.getInstance().getTotalCount() );
			}else{
				request.setAttribute("list", ItemDao.getInstance().getItemSearch(command));
				request.setAttribute("totCount", ItemDao.getInstance().getSearchCount(command));
			}
			request.setAttribute("pageNO", command.getPageNO());
			process(request,response,"main");
			break;
		case "list": process(request,response,"list");break;
		case "add" :
			
			String itemName = request.getParameter("itemName");
			if(itemName != null){
				itemName = new String(itemName.getBytes("8859_1"),"utf-8");
				System.out.println("품명"+itemName);
			}
			String sPrice = request.getParameter("price");
			if(sPrice !=null){
				sPrice = new String(sPrice.getBytes("8859_1"),"utf-8");
				int price = Integer.parseInt(sPrice);
				System.out.println("가격"+price);
			}
			String pdDate = request.getParameter("pdDate");
			if(pdDate !=null){
				pdDate = new String(pdDate.getBytes("8859_1"),"utf-8");
				System.out.println("생산일"+pdDate);
			}
			String sCapa = request.getParameter("capa");
			if(sCapa != null){
				sCapa = new String(sCapa.getBytes("8859_1"),"utf-8");
				int capa = Integer.parseInt(sCapa);
				System.out.println("용량"+capa);
			}
			String description = request.getParameter("description");
			if(description != null){
				description = new String(description.getBytes("8859_1"),"utf-8");
				System.out.println("설명"+ description);
			}
			String pdOrg = request.getParameter("pdOrg");
			if(pdOrg != null){
				pdOrg = new String(pdOrg.getBytes("8859_1"),"utf-8");
				System.out.println("원산지"+pdOrg);
			}
			String saleType = request.getParameter("saleType");
			if(saleType != null){
				saleType = new String(saleType.getBytes("8859_1"),"utf-8");
				System.out.println("판매용"+saleType);
			}
			String sDcRate = request.getParameter("dcRate");
			if(sDcRate != null){
				sDcRate = new String(sDcRate.getBytes("8859_1"),"utf-8");
				int dcRate = Integer.parseInt(sDcRate);
				System.out.println("할인률"+dcRate);
			}
			String sAlcol = request.getParameter("alcol");
			if(sAlcol != null){
				sAlcol = new String(sAlcol.getBytes("8859_1"),"utf-8");
				int alcol = Integer.parseInt(sAlcol);
				System.out.println("알콜"+alcol);
			}
			
			ivo.setItemName(request.getParameter("itemName"));
			ivo.setPrice(Integer.parseInt(request.getParameter("price")));
			ivo.setPdDate(request.getParameter("pdDate"));
			ivo.setCapa(Integer.parseInt(request.getParameter("capa")));
			ivo.setAlcol(Integer.parseInt(request.getParameter("alcol")));
			ivo.setDescription(request.getParameter("description"));
			ivo.setPdOrg(request.getParameter("pdOrg"));
			ivo.setSaleType(request.getParameter("saleType"));
			ivo.setDcRate(Integer.parseInt(request.getParameter("dcRate")));
			ItemDao.getInstance().insertItem(ivo);
			request.setAttribute("result", "mg_item");
			process(request, response, "main");
		case "imglist" : 
			request.setAttribute("result", "imglist");
			process(request, response, "main");
			break;
		case "detail":
			request.setAttribute("result", "detail");
			process(request, response, "main");
			break;
		case "soju":
			request.setAttribute("result", "soju");
			process(request, response, "main");
			break;
		case "beer":
			request.setAttribute("result", "beer");
			process(request, response, "main");
			break;
		case "yangju":
			request.setAttribute("result", "yangju");
			process(request, response, "main");
			break;
		case "budwiser":
			request.setAttribute("result", "budwiser");
			process(request, response, "main");
			break;
		default:
			break;
		}
	}
	private void process(HttpServletRequest request, HttpServletResponse response,String view) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("/views/item/"+view+".jsp");
		dis.forward(request, response);
	}
}
