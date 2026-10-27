//updating contact level to primary if it has more than 5 closed won opp records
trigger UpConLevel on Opportunity (after insert,after update) {
    Set<Id> oppIds = new set<Id>();
    for(Opportunity opp: trigger.new){
        if(opp.AccountId != NULL){
        oppIds.add(opp.AccountId);
        }}
    //List<Contact> conList = [select Id, AccountId, Level__c from Contact where AccountId IN : oppIds];
    List<Opportunity> oppList = [select Id, AccountId, stageName from Opportunity where AccountId IN : oppIds
                                and stageName ='Closed Won'];
    Map<Id, Integer> oppCount = new Map<Id, Integer>();
    
    for(Opportunity opp: oppList){
        if(!oppCount.containsKey(opp.AccountId)){
            oppCount.put(opp.AccountId,1);
        }
    }
    List<Contact> conToUpdate = new List<Contact>();
    for(Id conIds :oppCount.keySet()){
        Integer count = oppCount.get(conIds);
        if(count>2){
            conToUpdate.add(new Contact(Id=conIds, Level__c ='Primary'));
        }
    }
    update conToUpdate;

}