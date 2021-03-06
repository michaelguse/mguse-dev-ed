//Generated by wsdl2apex

public class newellComOtcportalstatusdetail {
    public class SalesOrder_Header_element {
        public String Doc_Date_H;
        public String Purch_No_H;
        public String Prc_Stat_H;
        public String Dlv_Stat_H;
        public String Req_Date_H;
        public String Dlv_Block_H;
        public String Z_Cred_Block_H;
        public String Z_Bil_Block_H;
        public String Z_Head_Comp_Stat_H;
        public String Z_Item_Comp_Stat_H;
        public String Creation_Date_H;
        public String Creation_Time_H;
        public String Z_Discounts_H;
        public String Z_Surcharges_H;
        public String Z_Freight_Charges_H;
        public String Z_Taxes_H;
        public String Z_Grand_Total_H;
        private String[] Doc_Date_H_type_info = new String[]{'Doc_Date_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Purch_No_H_type_info = new String[]{'Purch_No_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Prc_Stat_H_type_info = new String[]{'Prc_Stat_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Dlv_Stat_H_type_info = new String[]{'Dlv_Stat_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Req_Date_H_type_info = new String[]{'Req_Date_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Dlv_Block_H_type_info = new String[]{'Dlv_Block_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Cred_Block_H_type_info = new String[]{'Z_Cred_Block_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Bil_Block_H_type_info = new String[]{'Z_Bil_Block_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Head_Comp_Stat_H_type_info = new String[]{'Z_Head_Comp_Stat_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Item_Comp_Stat_H_type_info = new String[]{'Z_Item_Comp_Stat_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Creation_Date_H_type_info = new String[]{'Creation_Date_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Creation_Time_H_type_info = new String[]{'Creation_Time_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Discounts_H_type_info = new String[]{'Z_Discounts_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Surcharges_H_type_info = new String[]{'Z_Surcharges_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Freight_Charges_H_type_info = new String[]{'Z_Freight_Charges_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Taxes_H_type_info = new String[]{'Z_Taxes_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Grand_Total_H_type_info = new String[]{'Z_Grand_Total_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'Doc_Date_H','Purch_No_H','Prc_Stat_H','Dlv_Stat_H','Req_Date_H','Dlv_Block_H','Z_Cred_Block_H','Z_Bil_Block_H','Z_Head_Comp_Stat_H','Z_Item_Comp_Stat_H','Creation_Date_H','Creation_Time_H','Z_Discounts_H','Z_Surcharges_H','Z_Freight_Charges_H','Z_Taxes_H','Z_Grand_Total_H'};
    }
    public class Delivery_Shipment_Details_element {
        public newellComOtcportalstatusdetail.ItemDeliveryDetails_element ItemDeliveryDetails;
        public newellComOtcportalstatusdetail.ItemShipmentDetails_element ItemShipmentDetails;
        private String[] ItemDeliveryDetails_type_info = new String[]{'ItemDeliveryDetails','urn:newell.com:OTCPortalStatusDetail','ItemDeliveryDetails_element','0','1','false'};
        private String[] ItemShipmentDetails_type_info = new String[]{'ItemShipmentDetails','urn:newell.com:OTCPortalStatusDetail','ItemShipmentDetails_element','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'ItemDeliveryDetails','ItemShipmentDetails'};
    }
    public class SalesOrder_element {
        public newellComOtcportalstatusdetail.DOC_Number_element[] DOC_Number;
        public newellComOtcportalstatusdetail.Return_element Return_x;
        private String[] DOC_Number_type_info = new String[]{'DOC_Number','urn:newell.com:OTCPortalStatusDetail','DOC_Number_element','0','-1','false'};
        private String[] Return_x_type_info = new String[]{'Return','urn:newell.com:OTCPortalStatusDetail','Return_element','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'DOC_Number','Return_x'};
    }
    public class ItemDeliveryDetails_element {
        public String DELIV_NUMB;
        public String DELIV_DATE;
        public String Z_DLV_GM_STAT_H;
        public String Z_DLV_BIL_STAT_H;
        public String DELIV_ITEM;
        public String DLV_QTY;
        public String S_UNIT_DLV;
        public String DLV_UNIT_ISO;
        public String Z_DLV_GM_STAT_I;
        public String Z_DLV_BIL_STAT_I;
        public String Z_Track_No_I;
        private String[] DELIV_NUMB_type_info = new String[]{'DELIV_NUMB','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DELIV_DATE_type_info = new String[]{'DELIV_DATE','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_DLV_GM_STAT_H_type_info = new String[]{'Z_DLV_GM_STAT_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_DLV_BIL_STAT_H_type_info = new String[]{'Z_DLV_BIL_STAT_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DELIV_ITEM_type_info = new String[]{'DELIV_ITEM','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DLV_QTY_type_info = new String[]{'DLV_QTY','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] S_UNIT_DLV_type_info = new String[]{'S_UNIT_DLV','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DLV_UNIT_ISO_type_info = new String[]{'DLV_UNIT_ISO','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_DLV_GM_STAT_I_type_info = new String[]{'Z_DLV_GM_STAT_I','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_DLV_BIL_STAT_I_type_info = new String[]{'Z_DLV_BIL_STAT_I','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Track_No_I_type_info = new String[]{'Z_Track_No_I','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'DELIV_NUMB','DELIV_DATE','Z_DLV_GM_STAT_H','Z_DLV_BIL_STAT_H','DELIV_ITEM','DLV_QTY','S_UNIT_DLV','DLV_UNIT_ISO','Z_DLV_GM_STAT_I','Z_DLV_BIL_STAT_I','Z_Track_No_I'};
    }
    public class Order_element {
        public String OrderNumber;
        private String[] OrderNumber_type_info = new String[]{'OrderNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'OrderNumber'};
    }
    public class SalesOrder_DetailResponse_DT {
        public newellComOtcportalstatusdetail.SalesOrder_element[] SalesOrder;
        private String[] SalesOrder_type_info = new String[]{'SalesOrder','urn:newell.com:OTCPortalStatusDetail','SalesOrder_element','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'SalesOrder'};
    }
    public class ItemShipmentDetails_element {
        public String Z_SHIPMENT_NUMB_I;
        public String Z_CARRIER_NAME_I;
        public String Z_PRO_NUMBER_I;
        public String Z_CONTAINER_ID_I;
        public String Z_SHIP_START_DATE_I;
        public String Z_SHIP_START_TIME_I;
        private String[] Z_SHIPMENT_NUMB_I_type_info = new String[]{'Z_SHIPMENT_NUMB_I','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_CARRIER_NAME_I_type_info = new String[]{'Z_CARRIER_NAME_I','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_PRO_NUMBER_I_type_info = new String[]{'Z_PRO_NUMBER_I','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_CONTAINER_ID_I_type_info = new String[]{'Z_CONTAINER_ID_I','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_SHIP_START_DATE_I_type_info = new String[]{'Z_SHIP_START_DATE_I','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_SHIP_START_TIME_I_type_info = new String[]{'Z_SHIP_START_TIME_I','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'Z_SHIPMENT_NUMB_I','Z_CARRIER_NAME_I','Z_PRO_NUMBER_I','Z_CONTAINER_ID_I','Z_SHIP_START_DATE_I','Z_SHIP_START_TIME_I'};
    }
    public class OrderInfo_DT {
        public newellComOtcportalstatusdetail.OrderNumbers_element[] OrderNumbers;
        private String[] OrderNumbers_type_info = new String[]{'OrderNumbers','urn:newell.com:OTCPortalStatusDetail','OrderNumbers_element','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'OrderNumbers'};
    }
    public class DOC_Number_element {
        public String Doc_Num_H;
        public newellComOtcportalstatusdetail.SalesOrder_Header_element SalesOrder_Header;
        public newellComOtcportalstatusdetail.SalesOrder_Partners_element SalesOrder_Partners;
        public newellComOtcportalstatusdetail.SalesOrder_Items_element SalesOrder_Items;
        private String[] Doc_Num_H_type_info = new String[]{'Doc_Num_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] SalesOrder_Header_type_info = new String[]{'SalesOrder_Header','urn:newell.com:OTCPortalStatusDetail','SalesOrder_Header_element','0','1','false'};
        private String[] SalesOrder_Partners_type_info = new String[]{'SalesOrder_Partners','urn:newell.com:OTCPortalStatusDetail','SalesOrder_Partners_element','0','1','false'};
        private String[] SalesOrder_Items_type_info = new String[]{'SalesOrder_Items','urn:newell.com:OTCPortalStatusDetail','SalesOrder_Items_element','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'Doc_Num_H','SalesOrder_Header','SalesOrder_Partners','SalesOrder_Items'};
    }
    public class OrderNumbers_element {
        public String PortalOrderNumber;
        private String[] PortalOrderNumber_type_info = new String[]{'PortalOrderNumber','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'PortalOrderNumber'};
    }
    public class Partner_Info_element {
        public String Z_Partner_type_H;
        public newellComOtcportalstatusdetail.Z_Partner_Address_H_element Z_Partner_Address_H;
        private String[] Z_Partner_type_H_type_info = new String[]{'Z_Partner_type_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Partner_Address_H_type_info = new String[]{'Z_Partner_Address_H','urn:newell.com:OTCPortalStatusDetail','Z_Partner_Address_H_element','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'Z_Partner_type_H','Z_Partner_Address_H'};
    }
    public class HTTPS_Port {
 //       public String endpoint_x = 'https://pxiud100.newellrubbermaid.com:52101/XISOAPAdapter/MessageServlet?senderParty=&senderService=ORDERCREATE_NR_PORTAL_D&receiverParty=&receiverService=&interface=Portal_OrderInfo_OB&interfaceNamespace=urn%3Anewell.com%3AOTCPortalStatusDetail';
        public String endpoint_x = 'https://pi-dev.newellrubbermaid.com/XISOAPAdapter/MessageServlet?senderParty=&senderService=ORDERCREATE_NR_PORTAL_D&receiverParty=&receiverService=&interface=Portal_OrderInfo_OB&interfaceNamespace=urn%3Anewell.com%3AOTCPortalStatusDetail';
 
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail', 'newellComOtcportalstatusdetail'};
        public newellComOtcportalstatusdetail.SalesOrder_element[] Order_REST(newellComOtcportalstatusdetail.Order_element[] Order) {
            newellComOtcportalstatusdetail.DT_Order_REST request_x = new newellComOtcportalstatusdetail.DT_Order_REST();
            newellComOtcportalstatusdetail.SalesOrder_DetailResponse_DT response_x;
            request_x.Order = Order;
            Map<String, newellComOtcportalstatusdetail.SalesOrder_DetailResponse_DT> response_map_x = new Map<String, newellComOtcportalstatusdetail.SalesOrder_DetailResponse_DT>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sap.com/xi/WebService/soap1.1',
              'urn:newell.com:OTCPortalStatusDetail',
              'MT_Order_REST',
              'urn:newell.com:OTCPortalStatusDetail',
              'SalesOrder_DetailResponse_MT',
              'newellComOtcportalstatusdetail.SalesOrder_DetailResponse_DT'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.SalesOrder;
        }
        public newellComOtcportalstatusdetail.SalesOrder_element[] Portal_OrderInfo_OB(newellComOtcportalstatusdetail.OrderNumbers_element[] OrderNumbers) {
            newellComOtcportalstatusdetail.OrderInfo_DT request_x = new newellComOtcportalstatusdetail.OrderInfo_DT();
            newellComOtcportalstatusdetail.SalesOrder_DetailResponse_DT response_x;
            request_x.OrderNumbers = OrderNumbers;
            Map<String, newellComOtcportalstatusdetail.SalesOrder_DetailResponse_DT> response_map_x = new Map<String, newellComOtcportalstatusdetail.SalesOrder_DetailResponse_DT>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sap.com/xi/WebService/soap1.1',
              'urn:newell.com:OTCPortalStatusDetail',
              'Portal_OrderInfo_MT',
              'urn:newell.com:OTCPortalStatusDetail',
              'SalesOrder_DetailResponse_MT',
              'newellComOtcportalstatusdetail.SalesOrder_DetailResponse_DT'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.SalesOrder;
        }
    }
    public class Z_Partner_Address_H_element {
        public String Z_Partner_Number_H;
        public String Z_Partner_Name_1_H;
        public String Z_Partner_Name_2_H;
        public String Z_Partner_Street_1_H;
        public String Z_Partner_Street_2_H;
        public String Z_Partner_City_H;
        public String Z_Partner_Region_H;
        public String Z_Partner_Postal_Code_H;
        private String[] Z_Partner_Number_H_type_info = new String[]{'Z_Partner_Number_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Partner_Name_1_H_type_info = new String[]{'Z_Partner_Name_1_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Partner_Name_2_H_type_info = new String[]{'Z_Partner_Name_2_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Partner_Street_1_H_type_info = new String[]{'Z_Partner_Street_1_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Partner_Street_2_H_type_info = new String[]{'Z_Partner_Street_2_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Partner_City_H_type_info = new String[]{'Z_Partner_City_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Partner_Region_H_type_info = new String[]{'Z_Partner_Region_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_Partner_Postal_Code_H_type_info = new String[]{'Z_Partner_Postal_Code_H','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'Z_Partner_Number_H','Z_Partner_Name_1_H','Z_Partner_Name_2_H','Z_Partner_Street_1_H','Z_Partner_Street_2_H','Z_Partner_City_H','Z_Partner_Region_H','Z_Partner_Postal_Code_H'};
    }
    public class Items_element {
        public String Item_Number;
        public newellComOtcportalstatusdetail.ItemOrderDetails_element ItemOrderDetails;
        public newellComOtcportalstatusdetail.Delivery_Shipment_Details_element[] Delivery_Shipment_Details;
        private String[] Item_Number_type_info = new String[]{'Item_Number','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ItemOrderDetails_type_info = new String[]{'ItemOrderDetails','urn:newell.com:OTCPortalStatusDetail','ItemOrderDetails_element','0','1','false'};
        private String[] Delivery_Shipment_Details_type_info = new String[]{'Delivery_Shipment_Details','urn:newell.com:OTCPortalStatusDetail','Delivery_Shipment_Details_element','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'Item_Number','ItemOrderDetails','Delivery_Shipment_Details'};
    }
    public class SalesOrder_Items_element {
        public newellComOtcportalstatusdetail.Items_element[] Items;
        private String[] Items_type_info = new String[]{'Items','urn:newell.com:OTCPortalStatusDetail','Items_element','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'Items'};
    }
    public class ItemOrderDetails_element {
        public String PO_Itm_No;
        public String Material;
        public String Short_Text;
        public String Material_External;
        public String Material_GUID;
        public String Material_Version;
        public String Req_Date;
        public String Req_Qty;
        public String CUM_CF_Qty;
        public String Sales_Unit;
        public String S_Unit_ISO;
        public String Ref_Qty;
        public String Net_Value;
        public String Currency_x;
        public String CURR_ISO;
        public String Net_Price;
        public String COND_P_Unit;
        public String COND_Unit;
        public String CD_UNT_ISO;
        public String Z_SUB_Total_I;
        public String DLV_STAT_I;
        public String Rea_For_Re_I;
        private String[] PO_Itm_No_type_info = new String[]{'PO_Itm_No','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Material_type_info = new String[]{'Material','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Short_Text_type_info = new String[]{'Short_Text','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Material_External_type_info = new String[]{'Material_External','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Material_GUID_type_info = new String[]{'Material_GUID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Material_Version_type_info = new String[]{'Material_Version','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Req_Date_type_info = new String[]{'Req_Date','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Req_Qty_type_info = new String[]{'Req_Qty','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] CUM_CF_Qty_type_info = new String[]{'CUM_CF_Qty','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Sales_Unit_type_info = new String[]{'Sales_Unit','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] S_Unit_ISO_type_info = new String[]{'S_Unit_ISO','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Ref_Qty_type_info = new String[]{'Ref_Qty','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Net_Value_type_info = new String[]{'Net_Value','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Currency_x_type_info = new String[]{'Currency','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] CURR_ISO_type_info = new String[]{'CURR_ISO','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Net_Price_type_info = new String[]{'Net_Price','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] COND_P_Unit_type_info = new String[]{'COND_P_Unit','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] COND_Unit_type_info = new String[]{'COND_Unit','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] CD_UNT_ISO_type_info = new String[]{'CD_UNT_ISO','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Z_SUB_Total_I_type_info = new String[]{'Z_SUB_Total_I','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DLV_STAT_I_type_info = new String[]{'DLV_STAT_I','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Rea_For_Re_I_type_info = new String[]{'Rea_For_Re_I','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'PO_Itm_No','Material','Short_Text','Material_External','Material_GUID','Material_Version','Req_Date','Req_Qty','CUM_CF_Qty','Sales_Unit','S_Unit_ISO','Ref_Qty','Net_Value','Currency_x','CURR_ISO','Net_Price','COND_P_Unit','COND_Unit','CD_UNT_ISO','Z_SUB_Total_I','DLV_STAT_I','Rea_For_Re_I'};
    }
    public class DT_Order_REST {
        public newellComOtcportalstatusdetail.Order_element[] Order;
        private String[] Order_type_info = new String[]{'Order','urn:newell.com:OTCPortalStatusDetail','Order_element','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'Order'};
    }
    public class SalesOrder_Partners_element {
        public newellComOtcportalstatusdetail.Partner_Info_element[] Partner_Info;
        private String[] Partner_Info_type_info = new String[]{'Partner_Info','urn:newell.com:OTCPortalStatusDetail','Partner_Info_element','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'Partner_Info'};
    }
    public class Return_element {
        public String Type_x;
        public String Code;
        public String Message;
        public String Log_No;
        public String Log_Msg_No;
        public String Message_V1;
        public String Message_V2;
        public String Message_V3;
        public String Message_V4;
        private String[] Type_x_type_info = new String[]{'Type','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Code_type_info = new String[]{'Code','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Message_type_info = new String[]{'Message','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Log_No_type_info = new String[]{'Log_No','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Log_Msg_No_type_info = new String[]{'Log_Msg_No','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Message_V1_type_info = new String[]{'Message_V1','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Message_V2_type_info = new String[]{'Message_V2','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Message_V3_type_info = new String[]{'Message_V3','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Message_V4_type_info = new String[]{'Message_V4','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:newell.com:OTCPortalStatusDetail','false','false'};
        private String[] field_order_type_info = new String[]{'Type_x','Code','Message','Log_No','Log_Msg_No','Message_V1','Message_V2','Message_V3','Message_V4'};
    }
}