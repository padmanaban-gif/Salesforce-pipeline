trigger RelatedContract on Opportunity (after update) {
   List<Contract> contractList = new List<Contract>();
    
    for(Opportunity opp: trigger.new){
        Opportunity oldOpp = trigger.oldMap.get(opp.Id);
        
        if(opp.StageName == 'Closed Won' && oldOpp.StageName != 'Closed Won'){
            Contract con  =new Contract();
            con.AccountId = opp.Id;
            con.StartDate = Date.today();
            con.Status = 'Draft';
            con.Opportunity__c = opp.Id;
            contractList.add(con);
            
        }
        insert contractList;
    }
}