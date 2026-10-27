trigger UpdConRelOpp on Contact (after insert,after update) {
    
    List<Opportunity> oppList = new List<Opportunity>();
    List<Opportunity> oppLists = new List<Opportunity>();
    Set<Id> oppIds = new Set<Id>();
      
        if(trigger.isAfter && trigger.isInsert){
            for(Contact con: trigger.new){
            Opportunity opp = new Opportunity();
            opp.Name = con.LastName;
            opp.CloseDate =Date.Today();
            opp.StageName ='Prospecting';
            opp.AccountId = con.Id;
            opp.Max_Amount__c = 500;
                oppLists.add(opp);}}
        
       
        if(trigger.isAfter && trigger.isUpdate){
            for(Contact con:trigger.new){
        if(con.AccountId != NULL){
            oppIds.add(con.AccountId);
        }
    }
    List<Opportunity> newOppList = [select Id, Amount from Opportunity where AccountId IN : oppIds];
    for(Opportunity opps: newOppList){
        opps.Description = 'Related opp to contact';
        oppList.add(opps);
    }
    insert oppLists;
    update oppList;
        }
}