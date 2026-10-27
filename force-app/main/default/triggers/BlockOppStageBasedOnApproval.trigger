trigger BlockOppStageBasedOnApproval on Opportunity (before update) {
    
    for(Opportunity opp: trigger.new){
        Opportunity oldOpp = trigger.oldMap.get(opp.Id);
        if(opp.Approval_Status__c != oldOpp.Approval_Status__c && opp.Approval_Status__c =='Pending' ){
            opp.stageName.addError('You cant change the stagename when its not approved');
        }
    }

}