trigger NoOfOpps on Account (after insert, after update) {
    
    List<Opportunity> oppList = new List<Opportunity>();
    
    for(Account acc: trigger.new){
        if(acc.Active_Opportunities__c != NULL){
            Integer newOpps = Integer.valueof(acc.Active_Opportunities__c);
            
            for(Integer i=0;i<newOpps;i++){
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name;
                opp.CloseDate = Date.Today();
                opp.StageName = 'Prospecting';
                opp.AccountId = acc.Id;
                opp.Max_Amount__c = 500;
                oppList.add(opp);
            }
        }
        insert oppList;
    }

}