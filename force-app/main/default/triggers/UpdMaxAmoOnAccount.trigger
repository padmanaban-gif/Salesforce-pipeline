trigger UpdMaxAmoOnAccount on Opportunity (after insert) {
    set<id> accIds = new set<id>();
    for(Opportunity opp: trigger.new){
        if(opp.AccountId != Null && opp.Amount != Null){
            accIds.add(opp.AccountId);
        }
    }
    List<AggregateResult> arrs = [select AccountId accId, MAX(Amount) maxAmt from Opportunity where AccountId IN : accIds
                                  Group By AccountId];
    Map<Id, Decimal> maxOpp = new Map<id, Decimal>();
    for(AggregateResult ar: arrs){
        maxOpp.put((Id) ar.get('accId'), (Decimal) ar.get('maxAmt'));
    }
    List<Account> acc = new List<Account>();
    for(Id ids : maxOpp.keySet()){
        acc.add(new Account(Id = ids, Highest_Opp_Amount__c= maxOpp.get(ids)));
    }
    update acc;

}