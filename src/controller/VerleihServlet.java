package controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.FahrradBean;
import Model.Model;

@WebServlet("/Verleih")
public class VerleihServlet extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String fahrradId = request.getParameter("fahrrad");
		String aktion = request.getParameter("aktion");

		int benutzerId = Integer.parseInt(request.getSession().getAttribute("benutzerid").toString());
		
		
		if(aktion==null || aktion.equals("")) {
			//-> prüfe ob fahrrad auf Lager ist

			int result = Model.getInstance().pruefeFahrradAufLager(Integer.parseInt((fahrradId)));
			
	    	response.setContentType("text/plain");  
			response.setCharacterEncoding("UTF-8");   		 
	    	response.getWriter().write(String.valueOf(result));

		}else if (aktion.equals("ausleihen")) {
			
			if (Model.getInstance().pruefeFahrradAufLager(Integer.parseInt(fahrradId)) <= 0) {
				//ist bereits verliehen
			
			}else {
				//leihe Fahrrad aus
				boolean result = Model.getInstance().erzeugeVerleih(
						Integer.parseInt(fahrradId), (benutzerId));
				
		        //Weiterleitung an Fahrrad-Seite
		        RequestDispatcher disp = request.getRequestDispatcher("/fahrraeder.jsp");
		        disp.forward(request, response);
			}
						
		}else if (aktion.equals("entfernen")) {
			

			String benutzername = request.getSession().getAttribute("username").toString();
			
			if(benutzername.equals("admin")) { //nur der Admin darf Fahrräder als zurückgegeben kennzeichnen
				
				boolean result;
				

				benutzerId = Integer.parseInt(request.getParameter("benutzer"));
				
				//if (fahrradIstVerliehenAn == (benutzerId)) {
					//Lösche verleih
					 result = Model.getInstance().entferneVerleih(Integer.parseInt(fahrradId),
							(benutzerId));					

				//}else {
					//zu löschender Verleih existiert nicht
				//	result = false;
				//}
				
		    	response.setContentType("text/plain");  
				response.setCharacterEncoding("UTF-8");   		 
		    	response.getWriter().write(result?"1":"0");  
				
			}else if (aktion.equals("pruefen")) {
				
				boolean result = Model.getInstance().pruefeVerleih(Integer.parseInt(fahrradId), benutzerId);
				
		    	response.setContentType("text/plain");  
				response.setCharacterEncoding("UTF-8");   		 
		    	response.getWriter().write(result?"1":"0");  
			}
      
		
		}
			
		
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
	// + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		processRequest(request, response);
  
		
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
