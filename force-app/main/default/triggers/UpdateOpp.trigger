trigger UpdateOpp on Opportunity (after update) {
    for(Opportunity opp: trigger.new){
        if(opp.Amount > 5000 && opp.Probability> 70){
            opp.stageName = 'Negotiation/Review';
        }
    }

}