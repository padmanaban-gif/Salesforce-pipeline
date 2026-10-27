//updating account type is it has more than 5 closed won opportunities
trigger UpdAccTypeBasedOnRelOppCount on Opportunity (after insert,after update) {
    Set<Id> oppIds = new Set<Id>();
    for(Opportunity opp: trigger.new){
        if(opp.AccountId != NULL){
            oppIds.add(opp.AccountId);
        }
    }
    List<Opportunity> oppList = [select Id, AccountId, stageName from Opportunity where AccountId IN : oppIds
                                and stageName = 'Closed Won'];
    Map<Id, Integer> oppCount = new Map<Id, Integer>();
    for(Opportunity opp: oppList){
        if(!oppCount.containsKey(opp.AccountId)){
            oppCount.put(opp.AccountId,0);
        }
        oppCount.put(opp.AccountId, oppCount.get(opp.AccountId)+1);
    }
    List<Account> accList = new List<Account>();
    for(Id ids : oppCount.keySet()){
        Integer accIds = oppCount.get(ids);
        if(accIds > 5){
            accList.add(new Account(Id = ids, Type ='Technology Partner'));
        }
        
    }
    update accList;

}