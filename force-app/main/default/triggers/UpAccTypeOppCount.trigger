//Update account type if it has more than 3 closed won related opportunity records
trigger UpAccTypeOppCount on Opportunity (after insert) {
    set<id> accIds = new set<Id>();
    for(Opportunity opp : trigger.new){
        if(opp.AccountId != NULL && opp.stageName =='Closed Won'){
            accIds.add(opp.AccountId);
        }
    }
    List<Opportunity> oppList = [select Id,AccountId, stageName from Opportunity where AccountId IN : accIds];
    Map<Id, Integer> exisitingOppRecords = new Map<Id, Integer>();
    for(Opportunity opp: oppList){
        if(!exisitingOppRecords.containsKey(opp.AccountId)){
            exisitingOppRecords.put(opp.AccountId,0);
        }
        exisitingOppRecords.put(opp.AccountId, exisitingOppRecords.get(opp.AccountId)+1);
    }
    List<Account> accList = new List<Account>();
    for(Id ids: exisitingOppRecords.keySet()){
        Integer values = exisitingOppRecords.get(ids);
        if(values >= 3){
            accList.add(new Account(Id = ids, Type ='Installation Partner'));
        }
    }
    update accList;

}