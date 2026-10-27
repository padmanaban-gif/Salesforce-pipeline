trigger CreateRelOppToCon on Contact (after insert,after update) {
    
    List<Opportunity> oppList = new List<Opportunity>();
    for(Contact con : trigger.new){
        if(trigger.isAfter && trigger.isInsert){
            if(con.Total_Contacts__c != NULL && con.Total_Contacts__c >0){
                Opportunity opp = new Opportunity();
                opp.Name = con.LastName;
            opp.CloseDate = Date.Today();
            opp.StageName='Closed Won';
            opp.Max_Amount__c = 600;
            opp.AccountId = con.AccountId;
            oppList.add(opp);
            }
        }
        if(trigger.isAfter && trigger.isUpdate){
        Contact oldCon  = trigger.oldMap.get(con.id);
        if(con.Total_Contacts__c !=  NULL &&con.Total_Contacts__c != oldCon.Total_Contacts__c){
            Integer existingCons = Integer.valueof(con.Total_Contacts__c);
        
        for(Integer i=0;i<existingCons;i++){
            Opportunity opp = new Opportunity();
            opp.Name = con.LastName;
            opp.CloseDate = Date.Today();
            opp.StageName='Closed Won';
            opp.Max_Amount__c = 600;
            opp.AccountId = con.AccountId;
            oppList.add(opp);
        }
        }}}
    insert oppList;

}