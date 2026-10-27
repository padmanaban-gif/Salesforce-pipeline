//Need to throw error when try to close the account record if it has closed won or closed lost opp record
trigger PreAccDelBasedOnOpenOpp on Account (before delete) {
    set<Id> accIds = new set<Id>();
    for(Account acc: trigger.old){
        accIds.add(acc.Id);
    }
    List<Opportunity> oppList = [select Id, stageName, AccountId from Opportunity where AccountId IN : accIds
                                and stageName NOT IN ('Closed Won','Closed Lost')];
    Map<Id, Opportunity> existingOpps = new Map<Id, Opportunity>();
    for(Opportunity opp : oppList){
        if(!existingOpps.containsKey(opp.AccountId)){
            existingOpps.put(opp.AccountId, opp);
        }
    }
    for(Account acc: trigger.old){
        if(existingOpps.containsKey(acc.Id)){
            acc.addError('You cant close this account as its having open opportunity ');
        }
    }

}