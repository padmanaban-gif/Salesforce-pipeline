trigger UpdLevelOnConOppCount on Opportunity (after insert, after update) {
    
    Set<Id> oppIds = new Set<Id>();
    for(Opportunity opp: trigger.new){
        if(opp.AccountId != NULL){
            oppIds.add(opp.AccountId);
        }
    }
    List<Opportunity> oppList = [select Id, StageName from Opportunity where AccountId IN: oppIds 
                                and StageName ='Closed Won'];
    Map<Id, Integer> existingOpps = new Map<Id, Integer>();
    for(Opportunity opp: oppList){
        if(!existingOpps.containsKey(opp.AccountId)){
            existingOpps.put(opp.AccountId, 1);
        }
    }
    List<Contact> consToUpdate = new List<Contact>();
    for(Id accIds :existingOpps.keySet() ){
        Integer availCons = existingOpps.get(accIds);
        if(availCons> 5){
           consToUpdate.add(new Contact(Id =accIds, Level__c ='Primary'));
        }
        
    }
    update consToUpdate;

}