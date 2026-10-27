trigger CrateRelCaseToAccount on Account (after update) {
    List<case> craeteFollowUpCase = new List<Case>();
    for(Account acc: trigger.new){
        Account oldRevenue = trigger.oldMap.get(acc.id);
        if(acc.AnnualRevenue <= 50000 && acc.AnnualRevenue != oldRevenue.AnnualRevenue){
            Case cs = new Case();
            cs.subject = 'Review annual revenue';
            cs.Priority ='High';
            cs.Status = 'New';
            cs.AccountId = acc.Id;
            craeteFollowUpCase.add(cs);
        }
    }
    insert craeteFollowUpCase;

}