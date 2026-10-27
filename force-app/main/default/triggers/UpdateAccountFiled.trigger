trigger UpdateAccountFiled on Opportunity (after insert) {
    set<Id> oppIds = new set<Id>();
    for(Opportunity opp: trigger.new){
        //Opportunity opps = trigger.oldMap.get(opp.Id);
        if(opp.AccountId != NULL && opp.Amount != NULL ){
            oppIds.add(opp.AccountId);
        }
    }
    List<AggregateResult > ar = [select AccountId accId, MAX(Amount) maxAmt from Opportunity where AccountId IN : oppIds
                                GROUP BY AccountId];
    Map<Id, Decimal> oppMap = new Map<Id, Decimal>();
    for(AggregateResult arrs: ar){
        oppMap.put((Id) arrs.get('accId'), (Decimal) arrs.get('maxAmt'));
    }
    
    List<Account> accList = new List<Account>();
    
    for(Id accIds : oppMap.keySet()){
        accList.add(new Account (Id = accIds,Highest_Opp_Amount__c =oppMap.get(accIds)  ));
    }
    update accList;
    

}