public with sharing class OrderShipInfo {  
     private final String EXTERNAL_END_POINT_URL = 'http://intg-playground.herokuapp.com/services/rest/iOrder/';  
    /*  
     *  Ship Info Class to hold REST API response data  
    */  
   public class ShipInfo  
   {
     public String id{get;set;}  
     public String status{get;set;}  
     public String comments{get;set;}  
     public String orderOwner{get;set;}  
   }     

  public ShipInfo getOrderShipInfo(String externalID){     
   try{  
       HttpRequest req = new HttpRequest();  
       req.setEndpoint(EXTERNAL_END_POINT_URL + externalID);  
       req.setMethod('GET');            
       req.setHeader('Content-Type', 'application/x-www-form-urlencoded');  
       req.setTimeout(60000);  

       Http http = new Http();  
       HttpResponse res = http.send(req);  
        ShipInfo theStatus = (ShipInfo)JSON.deserialize(res.getbody(),ShipInfo.class);  
        return theStatus;  

   }catch(CallOutException ce){  
       throw ce;  
   }  
   return null;  
  }      
}