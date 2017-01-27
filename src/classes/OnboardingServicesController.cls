public class OnboardingServicesController {

    private final Contact cntct;
    
    public OnboardingServicesController(ApexPages.StandardController stdCntrlr) {
        this.cntct = (Contact)stdCntrlr.getRecord();
    }
    
    @RemoteAction
    public static Integer getRemoteCredentialScore() {
        return 1;
    }
    
    @RemoteAction
    public static Boolean getRemoteContactSync() {
        return true;
    }
    
}