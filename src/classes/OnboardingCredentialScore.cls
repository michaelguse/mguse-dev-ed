//Generated by wsdl2apex

public class OnboardingCredentialScore {
    public class CredentialsPort {
        public String endpoint_x = 'http://onboarding-services.herokuapp.com/services/credentialScore';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://onboarding.salesforce.com/', 'OnboardingCredentialScore'};
        public Integer getCredentials(String arg0,String arg1,String arg2) {
            OnboardingCredentialScore.getCredentials request_x = new OnboardingCredentialScore.getCredentials();
            OnboardingCredentialScore.getCredentialsResponse response_x;
            request_x.arg0 = arg0;
            request_x.arg1 = arg1;
            request_x.arg2 = arg2;
            Map<String, OnboardingCredentialScore.getCredentialsResponse> response_map_x = new Map<String, OnboardingCredentialScore.getCredentialsResponse>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://onboarding.salesforce.com/',
              'getCredentials',
              'http://onboarding.salesforce.com/',
              'getCredentialsResponse',
              'OnboardingCredentialScore.getCredentialsResponse'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.return_x;
        }
    }
    public class getCredentials {
        public String arg0;
        public String arg1;
        public String arg2;
        private String[] arg0_type_info = new String[]{'arg0','http://onboarding.salesforce.com/',null,'0','1','false'};
        private String[] arg1_type_info = new String[]{'arg1','http://onboarding.salesforce.com/',null,'0','1','false'};
        private String[] arg2_type_info = new String[]{'arg2','http://onboarding.salesforce.com/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://onboarding.salesforce.com/','false','false'};
        private String[] field_order_type_info = new String[]{'arg0','arg1','arg2'};
    }
    public class getCredentialsResponse {
        public Integer return_x;
        private String[] return_x_type_info = new String[]{'return','http://onboarding.salesforce.com/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://onboarding.salesforce.com/','false','false'};
        private String[] field_order_type_info = new String[]{'return_x'};
    }
}