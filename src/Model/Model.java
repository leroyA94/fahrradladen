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
    	
    }
    
    public static Model getInstance()
    {
        if(model == null)
            model = new Model();
        return (model);
    }
    
    
    public HashMap<Integer,FahrradBean> getFahrraeder() {
        return fahrraeder;
    }

}
