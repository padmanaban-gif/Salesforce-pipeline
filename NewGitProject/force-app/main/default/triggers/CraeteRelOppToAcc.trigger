//create related opps to account based on the active opps field value
trigger CraeteRelOppToAcc on Account (after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    
    for(Account acc: trigger.new){
        
        
        
        Account oldAcc = trigger.oldMap.get(acc.Id);
        if(acc.Active_Opportunities__c != Null && acc.Active_Opportunities__c != oldAcc.Active_Opportunities__c ){
            Integer createOpps = Integer.valueOf(acc.Active_Opportunities__c);
        
        for(Integer i =0;i<createOpps; i++){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.StageName = 'Closed Won';
            opp.CloseDate = Date.Today();
            opp.Max_Amount__c = 600;
            opp.AccountId = acc.Id;
            oppList.add(opp);
        }}
        }
    insert oppList;

}