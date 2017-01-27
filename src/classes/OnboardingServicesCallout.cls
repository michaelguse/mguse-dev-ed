public class OnboardingServicesCallout {
    
    // Pass in the parameters required for the getCredentials web service
    public static Integer getCredentialScore(String param1, String param2, String param3) {
      
        OnboardingCredentialScore.CredentialsPort credStub = new OnboardingCredentialScore.CredentialsPort();
        
        // This invokes the getCredentials method in the generated class
        Integer output = credStub.getCredentials(param1, param2, param3);
        
        return output;
    }

    // Pass in the parameters required for the syncContacts web service
    public static Boolean syncContact(String firstName, String lastName, String EMail, Integer credentialScore, String accountName) {
      
        OnboardingSyncContact.SyncContactDetailsPort syncStub = new OnboardingSyncContact.SyncContactDetailsPort();
        
        // This invokes the syncContact method in the generated class
        Boolean output = syncStub.sync(firstName, lastName, EMail, credentialScore, accountName);
        
        return output;
    }
    
}