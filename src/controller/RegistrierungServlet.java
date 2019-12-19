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

@WebServlet("/Registrierung")
public class RegistrierungServlet extends HttpServlet {

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

		String mail = request.getParameter("mail");
		String name = request.getParameter("name");
		String vorname = request.getParameter("vorname");
		String passwort = request.getParameter("pw");
		int fehler = 0;
		Pattern pattern;
		Matcher matcher;
		
		// Mail prüfen
		pattern = Pattern.compile(
				"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])",
				Pattern.CASE_INSENSITIVE); // regulärer Ausdruck von http://emailregex.com/
		matcher = pattern.matcher(mail);
		if (!(matcher.matches()))
			fehler = 1;//;
		/*
		// passwort prüfen
		pattern = Pattern.compile(
				"\"^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$\"");
		matcher = pattern.matcher(passwort);
		if (!(matcher.matches()))
			fehler = 2;//;
		*/
		// name prüfen
		else if(name.length() < 2 || name.length() > 50)
			fehler = 3;//;
		
		// vorname prüfen
		else if(vorname.length() < 2 || vorname.length() > 50)
			fehler = 4;//;
		
		// prüfen, ob benutzer schon existiert
		else if (Model.Model.getInstance().pruefeBenutzerExistiert(mail)) {
			fehler = 5;
		}// registrieren
		else if (!Model.Model.getInstance().registriereBenutzer(mail, name, vorname, passwort)) {
			fehler = 6;
		}
		
		// Antwort
        //Weiterleitung an Fahrrad-Seite
        RequestDispatcher disp = request.getRequestDispatcher("/registrierung.jsp?error=" + fehler);
        disp.forward(request, response);

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
