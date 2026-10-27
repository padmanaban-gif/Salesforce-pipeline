trigger PreOppDel on Opportunity (before delete) {
    
    for(Opportunity opp: trigger.old){
        if(opp.StageName =='Closed Won'){
            opp.addError('Cannot delete this opps');
        }
    }

}