trigger UpCaseFieldOnAccounts on Case (after insert) {
    
    set<Id> accIds = new set<Id>();
    for(Case css: trigger.new){
        if(css.AccountId != Null){
            accIds.add(css.AccountId);
        }
    }
    List<Account> accList = [select Id, New_Case_Number__c from Account where Id IN : accIds];

}