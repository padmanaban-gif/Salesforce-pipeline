//whenever opportunity amount is updated more than 25% of it's old value need to craete opportunity audit and
//store the old and new amount value
trigger UpdOppAuditAmount on Opportunity (after update) {
    List<Opportunity_Audit__C> oppToUpdate = new List<Opportunity_Audit__C>();
    for(Opportunity opps: trigger.new){
      Opportunity opp = trigger.oldMap.get(opps.Id);
        if(opp.Amount != Null && opps.Amount != Null){
            Decimal oldAmount = opp.Amount;
            Decimal newAmount = opps.Amount;
                Decimal difference = Math.abs(newAmount -oldAmount );
            
            if(oldAmount > 0 &&(difference/oldAmount)>0.25){
                Opportunity_Audit__C adds = new Opportunity_Audit__C();
                adds.Opportunity__c = opp.id;
                adds.Old_Amount__c = oldAmount;
                adds.New_Amount__c = newAmount;
                oppToUpdate.add(adds);
            }
        }
    }
    insert oppToUpdate;

}