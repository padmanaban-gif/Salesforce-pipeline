//whenever opportunity stage is marked as qualification update the related accounts active field to Yes
trigger UpRelAccOfOpp on Opportunity (after update) {
    
    set<Id> oppIds = new Set<Id>();
    for(Opportunity opp: trigger.new){
        if(opp.AccountId != NULL){
        Opportunity oldStage = trigger.oldMap.get(opp.AccountId);
        if(opp.Type =='New Customer ' && opp.Type != oldStage.Type){
            oppIds.add(opp.AccountId);
        }
        }}
    if(!oppIds.isEmpty()){
    List<Account> accList =[select Id, Name,Rating, Active__c from Account where Id IN : oppIds];
        for(Account acc: accList){
            acc.Rating = 'Hot';
        }
        update accList;
    }

}