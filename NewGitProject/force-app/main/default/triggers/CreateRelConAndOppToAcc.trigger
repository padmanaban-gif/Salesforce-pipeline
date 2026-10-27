//A Contact and Opportunity Records should be created whenever an account is created. The Contact Phone should be 
//same as Account Phone and Opportunity Amount should be same as Account AnnualRevenue.
////* If phone or AnnualRevenue in account is updated the same should get reflected in the contact phone and 
//opportunity amount.
trigger CreateRelConAndOppToAcc on Account (after insert, after update) {
    if(trigger.isAfter && trigger.isInsert){
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        
       
            for(Account acc: trigger.new){
                Contact con = new Contact();
                con.LastName = acc.Name;
                con.Phone = acc.Phone;
                con.AccountId = acc.Id;
                conList.add(con);
            
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.CloseDate = Date.Today();
            opp.Max_Amount__c = 600;
                opp.StageName='Prospecting';
            opp.Amount = acc.AnnualRevenue;
            opp.AccountId = acc.Id;
            oppList.add(opp);
            }
        insert conList;
        insert oppList;
    }
    if(trigger.isAfter && trigger.isUpdate){
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        Set<Id> accIds = new set<id>();
        for(Account acc: trigger.new){
            Account oldAcc = trigger.oldMap.get(acc.Id);
            if(acc.Phone != oldAcc.Phone && acc.AnnualRevenue != oldAcc.AnnualRevenue){
                accIds.add(acc.Id);
            }
        }
        Map<Id, Contact> existingCons =New Map<Id, Contact>([select Id,LastName, AccountId, Phone from Contact where
                                                            AccountId IN : accIds]);
        Map<Id,Opportunity> existingOpps = new Map<Id, Opportunity>([select Id, AccountId,Name,closeDate,
                                                                     Max_Amount__c,Amount from Opportunity where 
                                                                     AccountId IN : accIds]);
        for(Account acc: trigger.new){
            Account oldAcc = trigger.oldMap.get(acc.Id);
            if(acc.Phone != oldAcc.Phone && existingCons.containsKey(acc.Id)){
                Contact con = existingCons.get(acc.Id);
                //con.LastName = acc.Name;
                con.Phone = acc.Phone;
                conList.add(con);
            }
            if(acc.AnnualRevenue != oldAcc.AnnualRevenue && existingOpps.containsKey(acc.Id)){
                Opportunity opp = existingOpps.get(acc.Id);
                Opp.Amount = acc.AnnualRevenue;
                oppList.add(opp);
            }
        }
        update conList;
        update oppList;
    }

}