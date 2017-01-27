public with sharing class AccountCreateStreamingCon{

    ApexPages.StandardController stdCon;
    Account acct;
    public String displayMode { get; set; }
    
    public AccountCreateStreamingCon(ApexPages.StandardController stdCon){
        this.stdCon = stdCon;
        this.acct = (Account)stdCon.getRecord();
        
        this.displayMode = 'Edit';
    }
    
    public PageReference saveAccount(){
        
        upsert acct;
        
        proxyFutureMethod(acct.Id, UserInfo.getSessionId());
           
        this.displayMode = 'Detail';
        
        return null;
    }
    
    public static void proxyFutureMethod(Id acctId, String sessionId){
        AccountCreateStreamingCon.calloutRemote(acctId, sessionId);
    }

    @future(callout=true)
    public static void calloutRemote(Id acctId, String sessionId){
        System.debug(acctId + ' **** ' + sessionId);
        serviceHerokuCom.AccountServicePort herokuService = new serviceHerokuCom.AccountServicePort();
        herokuService.createAccount(acctId, sessionId);
    }
    
}