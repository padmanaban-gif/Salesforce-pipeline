trigger CreateRelOpp on Account (after insert) {
    List<Opportunity> oppList = new List<Opportunity>();
    for(Account acc: trigger.new){
        for(Integer i=1; i<=5;i++){
            Opportunity opp = new opportunity();
            opp.AccountId = acc.Id;
            opp.StageName = 'Closed Won';
            opp.Max_Amount__c = 650;
            opp.Name = acc.Name;
            opp.CloseDate = Date.today();
            oppList.add(opp);
        }
    }
    insert oppList;

}