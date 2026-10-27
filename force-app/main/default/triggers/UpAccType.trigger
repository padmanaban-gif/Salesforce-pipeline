//update the account type if that accout has more than 5 related opportunity with closed won status
trigger UpAccType on Opportunity (after insert,after update) {
    Set<Id> oppIds = new Set<Id>();
    for(Opportunity opp: trigger.new){
        if(opp.AccountId != null){
            oppIds.add(opp.AccountId);
        }
    }
    Map<Id, Integer> oppCount = new Map<Id, Integer>();
    List<Opportunity> oppList = [select Id, stageName, AccountId from Opportunity where AccountId IN : oppIds and
                                stageName ='Closed Won'];
    for(Opportunity opp: oppList){
        if(!oppCount.containsKey(opp.AccountId)){
            oppCount.put(opp.AccountId, 0);  
        }
        oppCount.put(opp.AccountId, oppCount.get(opp.AccountId)+1);
    }
    List<Account> accToUpdate = new List<Account>();
    for(Id accIds: oppCount.keySet()){
        Integer count = oppCount.get(accIds);
        if(count>5){
            accToUpdate.add(new Account(Id = accIds, Type='Technology Partner'));
        }
    }
    update accToUpdate;

}