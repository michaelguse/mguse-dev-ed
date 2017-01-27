public class OrderStatusCallout{
    
    public static String authorizationHeader() {
    
        String username = 'SFDC_REMOTE';
        String password = 'j@sp3r01';
          
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
    
        return authorizationHeader;
    }
    
	public static void call_Portal_REST(String inputOrderNumber) {
    
        newellComOtcportalstatusdetail.HTTPS_Port stub = new newellComOtcportalstatusdetail.HTTPS_Port();
        stub.inputHttpHeaders_x = new Map<String, String>();
        stub.inputHttpHeaders_x.put('Authorization', authorizationHeader());
        
        newellComOtcportalstatusdetail.Order_element orderNumber = new newellComOtcportalstatusdetail.Order_element();
        orderNumber.OrderNumber = inputOrderNumber;
    
        List <newellComOtcportalstatusdetail.Order_element> orderNumbers = new List<newellComOtcportalstatusdetail.Order_element>();
        orderNumbers.add(orderNumber);
    
        List<newellComOtcportalstatusdetail.SalesOrder_element> salesOrders = stub.Order_REST(orderNumbers);
    }

    public static void call_Portal_OrderInfo_OB(String inputOrderNumber) {
    
        newellComOtcportalstatusdetail.HTTPS_Port stub = new newellComOtcportalstatusdetail.HTTPS_Port();
        stub.inputHttpHeaders_x = new Map<String, String>();
        stub.inputHttpHeaders_x.put('Authorization', authorizationHeader());
        
        newellComOtcportalstatusdetail.OrderNumbers_element orderNumber = new newellComOtcportalstatusdetail.OrderNumbers_element();
        orderNumber.PortalOrderNumber = inputOrderNumber;
    
        List <newellComOtcportalstatusdetail.OrderNumbers_element> orderNumbers = new List<newellComOtcportalstatusdetail.OrderNumbers_element>();
        orderNumbers.add(orderNumber);
    
        List<newellComOtcportalstatusdetail.SalesOrder_element> salesOrders = stub.Portal_OrderInfo_OB(orderNumbers);
    }
}