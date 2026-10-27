trigger UpdateAcc on Opportunity (after update) {
    set<Id> oppIds = new set<Id>();
    for(Opportunity opp: trigger.new){
        Opportunity oldStage = trigger.oldMap.get(opp.Id);
        if(opp.AccountId != NULL && (opp.stageName != oldStage.stageName)){
            oppIds.add(opp.AccountId);
        }
    }
    List<Account> accList = new List<Account>();
    for(Id accIds : oppIds){
        accList.add(new Account(Id = accIds, Description = 'Related opp stagename has been updated'));
    }
    update accList;
}