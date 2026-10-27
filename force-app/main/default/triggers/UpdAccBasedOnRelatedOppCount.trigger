trigger UpdAccBasedOnRelatedOppCount on Opportunity (after insert,after update) {

    Set<Id> oppIds = new set<Id>();
    for(Opportunity opp: trigger.new){
        if(opp.AccountId != NULL){
            oppIds.add(opp.AccountId);
        }
}
    List<Opportunity> newList = [select Id, StageName from Opportunity where stageName ='Closed won ' and AccountId IN : oppIds];
    
    Map<Id, Integer> accToUpdate = new Map<Id, Integer>();
    for(Opportunity opp: newList){
        if(!accToUpdate.containsKey(opp.AccountId)){
            accToUpdate.put(opp.AccountId,1);
        }
    }
    List<Account> accList = new List<Account>();
    for(Id Ids : accToUpdate.keySet()){
        Integer accs = accToUpdate.get(Ids);
        if(accs>5){
            accList.add(new Account(Id = Ids,Type='Technology Partner'));
        }
    }
    update accList;
}