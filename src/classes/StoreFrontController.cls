public class StoreFrontController {

    List<DisplayMerchandise> products;
    
    Map<String, Integer> shoppingCart = new Map<String, Integer>();

    // Action method to handle purchasing process 
    public PageReference addToCart() {
        for(DisplayMerchandise p : products) {
            if (0 < p.qtyToBuy) {
                shoppingCart.put(p.name, p.qtyToBuy);
            }
            else if (p.qtyToBuy == 0) {
                shoppingCart.remove(p.name);
            }
            else if (p.qtyToBuy == null) {
                shoppingCart.remove(p.name);
            }
        }
        return null; // stay on the same page 
    }
    
    public String getCartContents() {
        if(0 == shoppingCart.size()) {
            return '(empty)';
        }
        String msg = '<ul>\n';
        for(String p : shoppingCart.keySet() ) {
            msg += '<li>';
            msg += p + ' (' + shoppingCart.get(p) + ')';
            msg += '</li>\n';
        }
        msg += '</ul>';
        return msg;
    }

    public List<DisplayMerchandise> getProducts() {
        if(products == null) {
            products = new List<DisplayMerchandise>();
            for(Merchandise__c item : [
                    SELECT Id, Name, Description__c, Price__c, Total_Inventory__c 
                    FROM Merchandise__c]) {
                products.add(new DisplayMerchandise(item));
            }
        }
        return products;
    }
    
    // Inner class to hold online store details for item
    public class DisplayMerchandise {

        private Merchandise__c merchandise;
        public DisplayMerchandise(Merchandise__c item) {
            this.merchandise = item;
        }

        // Properties for use in the Visualforce view
        public String name {
            get { return merchandise.Name; }
        }
        public String description {
            get { return merchandise.Description__c; }
        }
        public Decimal price {
            get { return merchandise.Price__c; }
        }
        public Boolean inStock {
            get { return (0 < merchandise.Total_Inventory__c); }
        }
        public Integer qtyToBuy { get; set; }
    }
}