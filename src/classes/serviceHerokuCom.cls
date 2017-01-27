public class serviceHerokuCom {
    public class createAccount {
        public String arg0;
        public String arg1;
        private String[] arg0_type_info = new String[]{'arg0','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] arg1_type_info = new String[]{'arg1','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://service.heroku.com/','false','false'};
        private String[] field_order_type_info = new String[]{'arg0','arg1'};
    }
    public class createAccountResponse {
        private String[] apex_schema_type_info = new String[]{'http://service.heroku.com/','false','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class AccountServicePort {
        public String endpoint_x = 'http://notificationservice.herokuapp.com/services/AccountServicePort';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://service.heroku.com/', 'serviceHerokuCom'};
        public void createAccount(String arg0,String arg1) {
            serviceHerokuCom.createAccount request_x = new serviceHerokuCom.createAccount();
            serviceHerokuCom.createAccountResponse response_x;
            request_x.arg0 = arg0;
            request_x.arg1 = arg1;
            Map<String, serviceHerokuCom.createAccountResponse> response_map_x = new Map<String, serviceHerokuCom.createAccountResponse>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'urn:CreateAccount',
              'http://service.heroku.com/',
              'createAccount',
              'http://service.heroku.com/',
              'createAccountResponse',
              'serviceHerokuCom.createAccountResponse'}
            );
            response_x = response_map_x.get('response_x');
        }
    }
}