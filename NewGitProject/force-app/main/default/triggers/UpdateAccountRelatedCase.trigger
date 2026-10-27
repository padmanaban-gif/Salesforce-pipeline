trigger UpdateAccountRelatedCase on Case (after insert) {
    set<Id> caseIds = new set<Id>();
    
    for(Case css: trigger.new){
        if(css.AccountId != NULL){
            caseIds.add(css.AccountId);
        }
    }
    List<Account> accToUpdate = new List<Account>();
    for(Account acc:[select Id, Rating from Account where Id IN : caseIds]){
        acc.Rating ='Hot';
        accToUpdate.add(acc);
    }
    update accToUpdate;

}