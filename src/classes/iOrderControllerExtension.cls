public class iOrderControllerExtension  
 {  
     private iOrder__c myOrder;  
     OrderShipInfo myOrderShipInfo;  
     OrderShipInfo.ShipInfo theShipInfo;    
     private ApexPages.StandardController controller {get; set;}  

   public iOrderControllerExtension(ApexPages.StandardController controller) {  
    //initialize the stanrdard controller  
    this.controller = controller;  
    this.myOrder = (iOrder__c)controller.getRecord();  
   }
   public void refreshOrderShipInfo()  
   {  
     myOrderShipInfo = new OrderShipInfo();  
     theShipInfo = myOrderShipInfo.getOrderShipInfo(this.myOrder.Order_External_ID__c);  

     myOrder.Order_Status__c = theShipInfo.status;    
     update myOrder;     
   }  
   public String getOrderStatus()  
   {  
    return theShipInfo.status;  
   }  
   public String getOrderComments()  
   {  
     return theShipInfo.comments;  
   }  
   public String getOrderOwner()  
   {  
     return theShipInfo.orderOwner;  
   }  
 }