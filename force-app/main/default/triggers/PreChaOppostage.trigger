trigger PreChaOppostage on Opportunity (before update) {
    
    for(Opportunity opp: trigger.new){
        Opportunity oldOpp = trigger.oldMap.get(opp.id);
        if(oldOpp.StageName=='Closed Won' || oldOpp.StageName=='Closed Lost'){
            opp.stageName.addError('cant modify the closed records');
        }
    }

}