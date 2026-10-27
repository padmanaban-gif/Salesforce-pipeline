//preventing account to be deleted if it has related open opportunity records
trigger PrAccDerelOpp on Account (before delete) {
    set<Id> accIds = new set<id>();
    for(Account acc: trigger.old){
        accIds.add(acc.Id);
    }
    
    List<Opportunity> oppList = [select Id, AccountId, stageName from Opportunity where AccountId IN : accIds and 
                                stageName !='Closed Won' and stageName !='Closed Lost'];
    Map<Id, Opportunity> existingOpps = new Map<Id, Opportunity>();
    for(Opportunity opp: oppList){
        if(!existingOpps.containsKey(opp.AccountId)){
            existingOpps.put(opp.AccountId, opp);
        }
    }
    for(Account acc: trigger.old){
        if(existingOpps.containsKey(acc.Id)){
            acc.addError('You cant delete this account first close the related opportunity');
        }
    }

}