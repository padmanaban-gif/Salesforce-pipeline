//preventing changing the opp stage if it has already closed won or closed lost
trigger PreChaOppStage on Opportunity (before update) {
    
    for(Opportunity opp: trigger.new){
        Opportunity oldStage = trigger.oldMap.get(opp.id);
        if(opp.stageName != oldStage.stageName && (opp.stageName =='Closed Won' || opp.stageName =='Closed Lost')){
            opp.stageName.addError('You cannot change the stage');
        }
    }

}