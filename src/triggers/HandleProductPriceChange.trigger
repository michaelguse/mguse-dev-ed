trigger HandleProductPriceChange on mghw__Merchandise__c (after update) {

// update invoice line items associated with open invoices
List<mghw__Line_Item__c> openLineItems = 
	[SELECT j.mghw__Unit_Price__c, j.mghw__Merchandise__r.mghw__Price__c
	 FROM mghw__Line_Item__c j 
	 WHERE j.mghw__Invoice_Statement__r.mghw__Status__c = 'Negotiating'  
	 AND j.mghw__Merchandise__r.id IN :Trigger.new 
 	 FOR UPDATE]; 

for (mghw__Line_Item__c li: openLineItems) {
   if ( li.mghw__Merchandise__r.mghw__Price__c < li.mghw__Unit_Price__c ) { 
         li.mghw__Unit_Price__c = li.mghw__Merchandise__r.mghw__Price__c;
   }
}

update openLineItems;

}