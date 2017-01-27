public class STCreationWizard {

   // This member variable maintains the state of the wizard.
   // When users enter data into the wizard, their input is stored
   // in this variable. 

   mghw__Service_Ticket__c newTicket;
   mghw__Service_Ticket__c savedTicket;

   // The next method returns the member variables.
   // If this is the first time the method is called,
   // it creates an empty record for the variable.
   public mghw__Service_Ticket__c getTicket() {
      if(newTicket == null) newTicket = new mghw__Service_Ticket__c();
      return newTicket;
   }
   
  public mghw__Service_Ticket__c getSavedTicket() {
      if(savedTicket == null) {
           if (newTicket.id != null) {
               savedTicket = [select id, name from mghw__Service_Ticket__c where id = :newTicket.id LIMIT 1];
           }
           return null;
      }     
      return savedTicket;
   }


   // The next method retrieves the custom field set variables
   // for the different service ticket type selection.
   public List<Schema.FieldSetMember> getFields() {
   
       Object o;
       String fsName;
       
       o = newTicket.get('mghw__Service_Ticket_Type__c'); 
       
       // Default Field Set to Billing of it isn't set yet.
       if ( o == null || o == '--None--' ) o = 'Billing';
     
       fsName = 'mghw__' + String.valueOf(o).replace(' ','_') + '_Fields';       
       
       return SObjectType.mghw__Service_Ticket__c.fieldSets.getMap().get(fsName).getFields();
          
   }
    
   // The next three methods control navigation through
   // the wizard. Each returns a PageReference for one of the three pages
   // in the wizard. Note that the redirect attribute does not need to
   // be set on the PageReference because the URL does not need to change
   // when users move from page to page.
   public PageReference step1() {
      return Page.STCreationWizard_Step1;
   }

   public PageReference step2() {
      return Page.STCreationWizard_Step2;
   }

   public PageReference step3() {
      return Page.STCreationWizard_Step3;
   }

   public PageReference step4() {
      return Page.STCreationWizard_Step4;
   }

   // This method cancels the wizard, and returns the user to the 
   // service ticket tab
    public PageReference cancel() {
    
        if (newTicket.Id != null) {
            delete newTicket;
        }
        
        PageReference cancelTicket = new PageReference('/a07/o');
        cancelTicket.setRedirect(true);
        
        return cancelTicket; 
    }

   // This method performs the final save for the object, and
   // then navigates the user to the detail page for the new
   // service ticket.
   public PageReference save() {
        
        try
        {
          if (newTicket.Id == null) {
              
              insert newTicket;
              
              savedTicket = [select id, name from mghw__Service_Ticket__c where id = :newTicket.id LIMIT 1];
             
          } else {
          
              update newTicket;
              
          }
    
          // PageReference serviceticketPage = new ApexPages.StandardController(ticket).view();
          // serviceticketPage.setRedirect(true);
            
          // return serviceticketPage;
          return null;
          
        }
        catch (DMLException ex)
        {
          ApexPages.Message msg = new ApexPages.Message(Apexpages.Severity.ERROR, ex.getdmlMessage(0));
          ApexPages.addMessage(msg);
          return null;
        }
      
      // Query to get the Name of the record we just created.
      // ticket.Name = [select Name from mghw__Service_Ticket__c where id = :ticket.id];

      // Finally, send the user to the detail page for 
      // the new service ticket.
      // PageReference serviceticketPage = new ApexPages.StandardController(ticket).view();
      // serviceticketPage.setRedirect(true);
            
      // return serviceticketPage; 
      // return ApexPages.currentPage();
      // return null;
   }

}