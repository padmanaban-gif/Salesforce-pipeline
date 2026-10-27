//Updating contact level if that contact has more than 5 related opp records
trigger UpdConLevelBasedOnOppCount on Opportunity (after insert,after update) {
    set<Id> oppIds = new set<Id>();
    for(Opportunity opp: trigger.new){
        if(opp.AccountId != Null){
            oppIds.add(opp.AccountId);
        }
    }
    List<Opportunity> oppList =[select Id, AccountId, stageName from Opportunity where AccountId IN : oppIds 
                               and stageName='Closed Won'];
    Map<Id, Integer> oppsCount = new Map<Id, Integer>();
    for(Opportunity opp: oppList){
        if(!oppsCount.containsKey(opp.AccountId)){
            oppsCount.put(opp.AccountId,1);
        }
    }
    List<Contact> conToUpdate = new List<Contact>();
    for(Id conIds :oppsCount.keySet() ){
        Integer counts = oppsCount.get(conIds);
        if(counts > 5){
            conToUpdate.add(new Contact(Id = conIds, Level__c ='Primary'));
        }
    }
    update conToUpdate;
    

}