trigger CrRelConAndOpp on Account (after insert,after update) {
    if(trigger.isAfter && trigger.isInsert){
       List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc: trigger.new){
            Contact con = new Contact();
            con.LastName = acc.Name;
            con.Phone = acc.Phone;
            con.AccountId= acc.Id;
            conList.add(con);
            
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.StageName ='Prospecting';
            opp.CloseDate = Date.Today();
            opp.Amount= acc.AnnualRevenue;
            opp.Max_Amount__c = 700;
            opp.Name= acc.Name;
            oppList.add(opp);
        }
        insert conList;
        insert oppList;
    }
    if(trigger.isAfter && trigger.isUpdate){
        List<Contact> conList = new List<contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        set<Id> accIds = new set<id>();
        for(Account acc: trigger.new){
            Account oldPhone = trigger.oldMap.get(acc.Id);
            Account oldAnnualRevenue = trigger.oldMap.get(acc.Id);
            if(acc.Phone != oldPhone.Phone && acc.AnnualRevenue !=oldAnnualRevenue.AnnualRevenue){
                 accIds.add(acc.Id);
            }
        }
        List<Opportunity> oppLists = [select Id, Amount, AccountId from Opportunity where AccountId IN : accIds];
        List<Contact> conLists = [select Id, AccountId, Phone from Contact where AccountId IN : accIds];
        Map<Id, Contact> conMap = new Map<Id, Contact>();
        for(Contact con: conLists){
            if(!conMap.containsKey(con.AccountId)){
                conMap.put(con.AccountId, con);
            }
        }
        Map<Id, Opportunity> oppMap = new Map<Id,Opportunity>();
        for(Opportunity opp: oppLists){
            oppMap.put(opp.AccountId,opp);
        }
         for(Account acc: trigger.new){
        if(conMap.containsKey(acc.Id)){
            Contact con= conMap.get(acc.Id);
            conList.add(new Contact(Id = con.Id, Phone = acc.Phone));
        }
             if(oppMap.containsKey(acc.id)){
                 Opportunity opp = oppMap.get(acc.id);
                 oppList.add(new Opportunity(Id=opp.Id, Amount = acc.AnnualRevenue));
             }
    }
        update conList;
        update oppList;
    }
    
   

}