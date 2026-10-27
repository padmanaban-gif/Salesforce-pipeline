trigger PreventOppToDel on Opportunity (before delete) {
    
    for(Opportunity opp: trigger.new){
        if(opp.stageName =='Closed Won' || opp.stageName=='Closed Lost'){
            opp.addError('We cannot close the opportunity');
        }
    }

}