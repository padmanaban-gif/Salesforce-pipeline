trigger NewAccOpp on Opportunity (after insert, after update) {
    Map<Id, Decimal> newList = new Map<Id, Decimal>();
    
    for(Opportunity opp: trigger.new){
        if(opp.AccountId != null && opp.IsDeleted == false ){
            newList.put(opp.AccountId,opp.Amount);
        }
    }

}