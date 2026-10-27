trigger UpdAccTypeRelOpps on Opportunity (after insert,after update) {
    set<Id> oppIds = new set<Id>();
    for(Opportunity opp: trigger.new){
        if(opp.AccountId != NULL){
            oppIds.add(opp.AccountId);
        }
    }
    List<Opportunity> oppList = [select Id, AccountId, stageName from Opportunity where AccountId IN : oppIds
                                and stageName = 'Closed Won'];
    Map<Id,Integer> newValues = new Map<Id, Integer>();
    for(Opportunity opp: oppList){
        if(!newValues.containsKey(opp.AccountId)){
            newValues.put(opp.AccountId,0);
        }
        newValues.put(opp.AccountId,newValues.get(opp.AccountId)+1);
    }
    List<Account> updateAccount = new List<Account>();
    for(Id accIds : newValues.keySet()){
        Integer oppCounts = newValues.get(accIds);
        if(oppCounts>5){
            updateAccount.add(new Account(Id = accIds, type='Technology Partner'));
        }
    }
    update updateAccount;


}