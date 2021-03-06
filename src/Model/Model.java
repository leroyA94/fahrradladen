package Model;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.LinkedList;
import javax.servlet.http.HttpServletRequest;



public class Model {
    
    private static Model model;
    private String user   = "webapp";
    private String pw = "test";
    private String db = "Fahrradladen";
    private String treiber = "org.mariadb.jdbc.Driver";
    
    private Model()
    {
    	
    }
    
    public static Model getInstance()
    {
        if(model == null)
            model = new Model();
        return (model);
    }
      
    private boolean executeOnDB(String statement) {

	

    Connection cn = null;
    Statement  st = null;
    ResultSet rs = null;
    boolean successfull = false;
    
	 	try {
	
	      Class.forName( treiber );
	      cn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/" + db + "?user=" + user + "&password=" +  pw );
	      st = cn.createStatement();

	      // ausführen
	      rs =  st.executeQuery( statement );

	      successfull = true;
	      
	    } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
	      try { if( null != rs ) rs.close(); } catch( Exception ex ) {}
	      try { if( null != st ) st.close(); } catch( Exception ex ) {}
	      try { if( null != cn ) cn.close(); } catch( Exception ex ) {}
	    }
	 	
	 	return successfull;
    }
    
    public String [] [] getDBResult(String tabelle, String spalten, String where){
	      //String db_url = "jdbc:mysql://localhost/Fahrradladen";
		  //String treiber = "com.mysql.jdbc.Driver";
		
		  //String treiber = "org.hsqldb.jdbcDriver";
		  //String db_url = "jdbc:hsqldb:http://localhost/Fahrradladen";
		  //String db_url = "jdbc:hsqldb:hsql:http://localhost/Fahrradladen";

		  String table = db + "." + tabelle;
		  
		  String statement = "SELECT " + spalten + " FROM " + table; 
		  if(!(where == null || where.equals("")))
			  statement = statement + " WHERE " + where;
		  statement = statement + ";";
		  
		  String statement_count = "SELECT COUNT(*) FROM " + table;
		  if(!(where == null || where.equals("")))
			  statement_count = statement_count + " WHERE " + where;
		  statement_count = statement_count + ";";
		
		

	    Connection cn = null;
	    Statement  st = null;
	    ResultSet rs = null;
		    
		    int n_reihen, n_spalten;
		  String [][] result = new String [0][0];
		  
		    
		 	try {
   	
		      Class.forName( treiber );
		      //Class.forName("org.mariadb.jdbc.Driver");
		      
		      //org.hsqldb.jdbcDriver.driverInstance();
		      //cn = DriverManager.getConnection( db_url, user, pw );
		      cn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/" + db + "?user=" + user + "&password=" +  pw );
		      st = cn.createStatement();
		      
		      //Reihen-Anzahl ermitteln
		      rs =  st.executeQuery( statement_count );
				
		      rs.next();
		      n_reihen = rs.getInt( 1 );
		      
		      // Daten holen
		      rs =  st.executeQuery( statement );
			
	
		      ResultSetMetaData rsmd = rs.getMetaData();
		      n_spalten = rsmd.getColumnCount();
		      result = new String [n_reihen] [n_spalten];
		      
		      
		      int i_reihe = -1;
		      while( rs.next() )
		      {
		    	  i_reihe +=1 ;
			       for( int i=1; i<=n_spalten; i++ )  
			          result[i_reihe] [i-1] = rs.getString(i);
		      }
		    } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
		      try { if( null != rs ) rs.close(); } catch( Exception ex ) {}
		      try { if( null != st ) st.close(); } catch( Exception ex ) {}
		      try { if( null != cn ) cn.close(); } catch( Exception ex ) {}
		    }
		 	
		 	return result;
    }
    
    public String getFahrradPreis(String id) {
    	
    	String [] [] dbResult = getDBResult("Fahrraeder", "Preis", "Id = '" + id +"'");
    	
    	if (dbResult.length == 0)
    		return null;
    	else
    		return dbResult[0][0];
    	
    }
    
    public FahrradBean getFahrrad(String id) {
    	
    	String [] [] dbResult = getDBResult("Fahrraeder", "Marke, Groesse, Preis, aufLager, bild ", "Id = '" + id +"'");

    	if (dbResult.length == 0)
    		return null;
    	else {
    		FahrradBean bean = new FahrradBean();
    		bean.setId(Integer.parseInt(id));
    		bean.setMarke(dbResult[0][0]);
    		bean.setGroesse(Integer.parseInt(dbResult[0][1]));
    		bean.setPreis(Double.parseDouble(dbResult[0][2]));
    		bean.setAufLager(Integer.parseInt(dbResult[0][3]));
    		bean.setBild((dbResult[0][4]));
    		return bean;
    	}
    	
    }
    
    public int pruefeLogin(String username, String pw){

    	String [] [] userdata = getDBResult("Benutzer",
    			"Id", "Benutzername='" + username + "' AND Passwort='" + pw + "' ");
    	
    	if(userdata.length == 0)
    		return 0;
    	else    	
    		return Integer.parseInt(userdata[0][0]);
    	
     }
    
    public boolean pruefeBenutzerExistiert(String username) {
    	String [] [] userdata = getDBResult("Benutzer",
    			"*", "Benutzername='" + username + "'");
    	
    		return (userdata.length > 0);
    }
    
    public boolean registriereBenutzer(String username, String name, String vorname, String pw) {

    	return executeOnDB("INSERT INTO Fahrradladen.Benutzer (Benutzername, Name, Vorname , Passwort) VALUES (\"" + username + "\", \"" + name + "\", \"" + vorname + "\",\"" + pw +"\");");
    	
    }
    
    public boolean pruefeVerleih( int fahrradId, int benutzerId) {

    	String [] []  result;
    	result = getDBResult("Verleihe",
    			"benutzerId, fahrradId", "benutzerId='" + benutzerId + "' AND fahrradId='" + fahrradId + "' "); 
    		return (result.length > 0);	

    }
    
    public boolean erzeugeVerleih( int fahrradId, int benutzerId) {

    	boolean result;
    	result = executeOnDB("INSERT INTO Fahrradladen.Verleihe (fahrradId, benutzerId) VALUES (\"" + fahrradId + "\", \"" + benutzerId + "\");");
    	if (result)
    		result = executeOnDB(" update Fahrradladen.Fahrraeder set aufLager = " + pruefeFahrradAufLager(fahrradId) + " -1 WHERE Id = "+ fahrradId + ";");
    	
    	return result;
    }
    
    public boolean entferneVerleih( int fahrradId, int benutzerId) {

    	boolean result;
    	result = executeOnDB("DELETE FROM Fahrradladen.Verleihe WHERE fahrradId=" + fahrradId + " AND benutzerId=" + benutzerId + ";");
    	if(result)
    		result = executeOnDB(" update Fahrradladen.Fahrraeder set aufLager = " + pruefeFahrradAufLager(fahrradId) + " +1 WHERE Id = "+ fahrradId + ";");
    	
    	return result;
    }
    
    public int pruefeFahrradIstVerliehenAn(int id) {
    	String [] [] data = getDBResult("Verleihe",
    			"benutzerId", "fahrradId='" + id + "'");
    	
    	if(data.length == 0)
    		return 0;
    	else
    		return Integer.parseInt(data[0][0]);
    }
    
    public int pruefeFahrradAufLager(int id) {
    	String [] [] data = getDBResult("Fahrraeder",
    			"aufLager", "Id='" + id + "'");
    	
    	if(data.length == 0)
    		return 0;
    	else
    		return Integer.parseInt(data[0][0]);
    }
    
    
}
