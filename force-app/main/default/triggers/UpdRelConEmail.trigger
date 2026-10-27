trigger UpdRelConEmail on Account (after update) {
    
    Map<Id, String> emailMap = new Map<Id, String>();
    for(Account acc: trigger.new){
        Account oldEmail = trigger.oldMap.get(acc.Id);
        if(acc.New_Email__c != Null && acc.New_Email__c != oldEmail.New_Email__c ){
            emailMap.put(acc.Id, acc.New_Email__c.toLowerCase());
        }
    }
    List<Contact> conList  = [select AccountId, Email from Contact where AccountId IN : emailMap.keyset()];
    for(Contact con: conList){
        con.Email = emailMap.get(con.AccountId);
    }
    update conList;

}