/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestHandleProductPriceChange {

    static testMethod void testPriceChange()  {
		mghw__Invoice_Statement__c invoice = new mghw__Invoice_Statement__c(mghw__Status__c = 'Negotiating');
		insert invoice;
		
		mghw__Merchandise__c[] products = new mghw__Merchandise__c[]{
			new mghw__Merchandise__c(Name = 'item 1', mghw__Description__c = 'test product 1', mghw__Price__c = 10, mghw__Total_Inventory__c = 10),
			new mghw__Merchandise__c(Name = 'item 2', mghw__Description__c = 'test product 2', mghw__Price__c = 11, mghw__Total_Inventory__c = 10)
		};
		insert products;
		
		mghw__Line_Item__c[] lineItems = new mghw__Line_Item__c[] {
			new mghw__Line_Item__c(mghw__Invoice_Statement__c = invoice.id, mghw__Merchandise__c = products[0].id, mghw__Unit_Price__c = 10, mghw__Units_Sold__c = 3),
			new mghw__Line_Item__c(mghw__Invoice_Statement__c = invoice.id, mghw__Merchandise__c = products[1].id, mghw__Unit_Price__c = 11, mghw__Units_Sold__c = 6)
		};
		insert lineItems;
		
		products[0].price__c = 20; // raise price
		products[1].price__c = 5;  // lower price
		
		Test.startTest();
		update products;
		Test.stopTest();
		 
		lineItems = [SELECT id, unit_price__c FROM Line_Item__c WHERE id IN :lineItems];
		System.assert(lineItems[0].unit_price__c == 10);  // unchanged
		System.assert(lineItems[1].unit_price__c == 5);   // changed!!
		
	}
}