


package REST;


import java.util.List; 
import javax.ws.rs.GET; 
import javax.ws.rs.Path; 
import javax.ws.rs.Produces; 
import javax.ws.rs.core.MediaType;  
@Path("/FahrradService") 

public class FahrradService {  
    
   @GET 
   @Path("/fahrrad") 
   @Produces("application/json")
   public String getUsers(){ 
      return "{\"prop\":\"value\"}"; 
   }  
}

/*
import javax.ws.rs.core.*;
import javax.ws.rs.*;
import com.google.gson.Gson;

@Path("fahrrad")
public class FahrradService {
    
    @GET
    @Produces("application/json")
    public String getFahrrad()
    {
    	Model.FahrradBean fahrrad = Model.Model.getInstance().getFahrraeder().get(1);
    	Gson gson = new Gson();
    	return gson.toJson(fahrrad);
    }

    //public String getFahrrad(@QueryParam("id") int id)
    
}
*/