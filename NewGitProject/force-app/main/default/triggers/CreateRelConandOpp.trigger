trigger CreateRelConandOpp on Account (after insert, after update) {
    
    if(trigger.isAfter && trigger.isInsert){
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Account acc: trigger.new){
            Contact con = new Contact();
            con.Phone = acc.Phone;
            con.LastName = acc.Name;
            con.AccountId = acc.id;
            conList.add(con);
            
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.StageName = 'Closed Won';
            opp.Max_Amount__c = 756;
            opp.CloseDate = Date.today();
            opp.Amount = acc.AnnualRevenue;
            opp.AccountId = acc.id;
            oppList.add(opp);
        }
        insert conList;
        insert oppList;
    }
    if(trigger.isAfter && trigger.isUpdate){
        
        set<Id> accIds = new set<id>();
        for(Account acc: trigger.new){
            Account oldAcc = trigger.oldMap.get(acc.Id);
            if(acc.Phone != oldAcc.Phone && acc.AnnualRevenue != oldAcc.AnnualRevenue){
                accIds.add(acc.id);
            }
        }
        List<Contact> conList = [select id, AccountId, Phone from Contact where AccountId IN : accIds];
        List<Opportunity> oppList = [select Id, AccountId, Amount from Opportunity where AccountId IN : accIds];
        Map<Id, Contact> existingCons = new Map<Id, Contact>();
        Map<Id, Opportunity> existingOpps = new Map<Id, Opportunity>();
        for(Contact con: conList){
            if(!existingCons.containsKey(con.AccountId)){
                existingCons.put(con.AccountId, con);
            }
        }
        for(Opportunity opp: oppList){
            if(!existingOpps.containsKey(opp.AccountId)){
                existingOpps.put(opp.AccountId, opp);
            }
        }
        List<Contact> conLists = new List<Contact>();
        List<Opportunity> oppLists = new List<Opportunity>();
        for(Account acc: trigger.new){
            if(existingCons.containsKey(acc.id)){
                Contact con = existingCons.get(acc.Id);
                conLists.add(new Contact (Id = con.Id, phone = acc.Phone));
            }
            if(existingOpps.containsKey(acc.Id)){
                Opportunity opp = existingOpps.get(acc.Id);
                oppLists.add(new Opportunity(Id=opp.id, Amount = acc.AnnualRevenue));
            }
        }
        update conLists;
        update oppLists;
        }
    }