trigger PreventRecursiveOpp on Opportunity (after update) {
    Set<Id> updatedOpps= new Set<Id>();
        for(Opportunity opp:trigger.new){
            if(opp.Phone__c != trigger.oldMap.get(opp.Id).Phone__c){
                updatedOpps.add(opp.Id);
            }
        }
    
    if(!PreventRecusriveOppHandler.isExecuted){
        
        PreventRecusriveOppHandler.isExecuted = true;
       List<Opportunity> opp = [select Id, StageName from Opportunity where AccountId IN: updatedOpps ];
        for(Opportunity opps: opp){
        opps.stageName = 'Clsoed Won';
        opps.Description='Updated';
        
        }
        update opp;
    }
}