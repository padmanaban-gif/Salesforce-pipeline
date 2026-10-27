trigger CreateNoOfRelOpps on Account (after insert, after update) {
    if(trigger.isAfter && trigger.isInsert){
    List<Opportunity> oppList = new List<Opportunity>();
    
    for(Account acc: trigger.new){
        Integer noOf = Integer.valueOf(acc.Active_Opportunities__c);
        
        for(Integer i=0; i<= noOf; i++ ){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name+i;
            opp.StageName = 'Closed Won';
            opp.CloseDate = Date.today();
            opp.Max_Amount__c =450;
            opp.AccountId = acc.id;
            oppList.add(opp);
        }
    }
    insert oppList;
    }
    if(trigger.isAfter && trigger.isUpdate){
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Account acc: trigger.new){
            Account oldAcc = trigger.oldMap.get(acc.Id);
            if(acc.Active_Opportunities__c != oldAcc.Active_Opportunities__c){
                Integer noOf = Integer.valueOf(acc.Active_Opportunities__c);
                
                for(Integer i=5; i<= noOf;i++){
                     Opportunity opp = new Opportunity();
            opp.Name = acc.Name+i;
            opp.StageName = 'Closed Won';
            opp.CloseDate = Date.today();
            opp.Max_Amount__c =450;
            opp.AccountId = acc.id;
            oppList.add(opp);
                }
            }
        }
        insert oppList;
    }
}