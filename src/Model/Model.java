package Model;

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
    private HashMap<Integer,FahrradBean> fahrraeder = new HashMap<>();
    private int lastFahrradID = 1;
    
    private Model()
    {
    	CreateDummies();
    }
    
    public static Model getInstance()
    {
        if(model == null)
            model = new Model();
        return (model);
    }
    

    private void CreateDummies() {
    	LinkedList<FahrradBean> fahrraeder = new LinkedList<FahrradBean>();
    	fahrraeder.add(erzeugeFahrrad("Gazelle", 26, 300));
    	fahrraeder.add(erzeugeFahrrad("Gazelle", 28, 150));
    	fahrraeder.add(erzeugeFahrrad("Gazelle", 26, 199.99));
    	
    	for (FahrradBean fahrradBean : fahrraeder) {
			getFahrraeder().put(fahrradBean.getId(), fahrradBean);
		}
    	
    	
    }
    
    private FahrradBean erzeugeFahrrad(String marke, int groesse, double preis) {
    	FahrradBean bean = new FahrradBean();
    	bean.setId(lastFahrradID++);
    	bean.setGroesse(groesse);
    	bean.setMarke(marke);
    	bean.setPreis(preis);
    	return bean;
    }
    
    
    public HashMap<Integer,FahrradBean> getFahrraeder() {
        return fahrraeder;
    }

}
