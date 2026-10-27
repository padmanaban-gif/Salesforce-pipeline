trigger UpdateAccType on Opportunity (after insert) {
    set<Id> oppIds = new set<Id>();
    for(Opportunity opp: trigger.new){
        if(opp.AccountId != Null && opp.stageName =='Closed Won'){
            oppIds.add(opp.AccountId);
        }
    }
    List<Opportunity> oppList = [select Id, AccountId, stageName from Opportunity where AccountId IN : oppIds];
    Map< Id,Integer> oppCount = new Map< Id,Integer>();
    for(Opportunity opps: oppList){
        if(!oppCount.containsKey(opps.AccountId)){
            oppCount.put( opps.AccountId,0);
        }
        oppCount.put(opps.AccountId, oppCount.get(opps.AccountId)+1);
    }
    List<Account> acc = new List<Account>();
    for(Id ids : oppCount.keyset()){
        Integer count = oppCount.get(ids);
        if(count > 3){
            acc.add(new Account(Id = ids, Type = 'Prospect'));
        }
        
    }
    update acc;

}