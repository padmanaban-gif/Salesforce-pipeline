trigger NewCasee on Case (after insert) {
    Map<Id, String> caseList =  new Map<Id, String>();
    
    for(case c : trigger.new){
        if(c.AccountId != null){
            caseList.put(c.AccountId,c.CaseNumber);
        }
    }
    List<Account> accList =[select Id, New_Case_Number__c from account where Id IN : caseList.keyset()];
    for(Account acc: accList){
        acc.New_Case_Number__c = Decimal.valueof(caseList.get(acc.id));
    }
    update accList;
}