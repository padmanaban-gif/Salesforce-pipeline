trigger PreventOppDelete on Opportunity (before insert,before update) {
    
    for(Opportunity opp :trigger.new){
        Opportunity oldOpp = trigger.oldMap.get(opp.Id);
        
        if(opp.StageName =='Closed Won' && oldOpp.StageName !='Closed Won'){
            if(opp.Amount != NULL && opp.Amount <1000){
                opp.addError('You cant close the opportunity');
            }
        }
    }

}