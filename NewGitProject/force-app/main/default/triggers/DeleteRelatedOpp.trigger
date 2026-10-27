//when account status is modified No to Yes delete all the related opportunities
trigger DeleteRelatedOpp on Account (after update) {
    Set<Id> oldIds = new Set<Id>();
    for(Account acc : trigger.new){
        if(acc.Active__c == 'No' && trigger.oldMap.get(acc.Id).Active__c =='Yes'){
            List<Opportunity> opps = [select Id, Name from Opportunity where AccountId  =: acc.Id];
            for(Opportunity opp: opps){
                oldIds.add(opp.Id);
            }
            delete opps;
        }
       
    }

}