package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.FahrradBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Fahrrad")
public class FahrradServlet extends HttpServlet {
	   /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	String id = request.getParameter("id");
    	String attribut = request.getParameter("attribut");
    	

    	
		FahrradBean f = Model.Model.getInstance().getFahrrad(id); //Model.Model.getInstance().getFahrradPreis(id);
		String json = new Gson().toJson(f);
		
    	response.setContentType("text/plain");  
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		
		/*
		
    	if (attribut == null) {
    		
		else if	 (attribut == )
    		
    	}
		     
            */
        
        
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


}