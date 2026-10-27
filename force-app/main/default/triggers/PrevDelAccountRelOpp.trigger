trigger PrevDelAccountRelOpp on Opportunity (before delete) {
   set<Id> oppIds = new set<Id>();
    
    for(Opportunity opp: trigger.new){
        if(opp.AccountId != NULL && opp.stageName != 'Closed Won' || opp.stageName != 'Closed Lost'){
            oppIds.add(opp.AccountId);
        }
    }
    List<Opportunity> accList = [select Id, AccountId from Opportunity where AccountId IN : oppIds];
    Map<Id, Opportunity> existingOpp = new Map<Id, Opportunity>();
    for(Opportunity opps: accList){
        if(!existingOpp.containsKey(opps.AccountId)){
            existingOpp.put(opps.AccountId, opps);
        }
    }
    //Wrong code
}