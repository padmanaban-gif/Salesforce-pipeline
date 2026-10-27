//A Contact and Opportunity Records should be created whenever an account is created. The Contact Phone should be same as
// Account Phone and Opportunity Amount should be same as Account AnnualRevenue.
//If phone or AnnualRevenue in account is updated the same should get reflected in the contact phone and 
//opportunity amount.

trigger CreateRelOppContoAccount on Account (after insert,after update) {
    
    if(trigger.isAfter && trigger.isInsert){
        List<Opportunity> oppList = new List<Opportunity>();
        List<Contact> conList = new List<Contact>();
        
        for(Account acc: trigger.new){
            Opportunity opp =  new Opportunity();
            opp.StageName= 'Prospecting';
            opp.Name = acc.Name;
            opp.Amount = acc.AnnualRevenue;
            opp.Max_Amount__c = 300;
            opp.CloseDate = Date.Today();
            opp.AccountId = acc.Id;
            oppList.add(opp);
            
            Contact con = new Contact();
            con.LastName = acc.Name;
            con.Phone = acc.Phone;
            con.AccountId  = acc.Id;
            conList.add(con);
            
        }
        insert oppList;
        insert conList;
    }
    if(trigger.isAfter && trigger.isUpdate){
       
        set<Id> accIds = new set<Id>();
        for(Account acc: trigger.new){
            Account oldPhone = trigger.oldMap.get(acc.Id);
            Account oldRevenue = trigger.oldMap.get(acc.Id);
            if(acc.Phone != oldPhone.Phone && acc.AnnualRevenue != oldRevenue.AnnualRevenue){
                accIds.add(acc.Id);
            }
        }
        List<Contact> newConList = [select Id, AccountId, Phone from Contact where AccountId IN : accIds];
        List<Opportunity> newOppList = [select Id, AccountId, Amount from Opportunity where AccountId IN : accIds];
        Map<Id, Contact> consMap = new Map<Id, Contact>();
        Map<Id, Opportunity> oppsMap = new Map<Id, Opportunity>();
        for(Contact con: newConList){
            if(!consMap.containsKey(con.AccountId)){
                consMap.put(con.AccountId,con);
            }
        }
        for(Opportunity opp: newOppList){
            if(!oppsMap.containsKey(opp.AccountId)){
                oppsMap.put(opp.AccountId, opp);
            }
        }
        List<Opportunity> oppList = new List<Opportunity>();
        List<Contact> conList = new List<Contact>();
    for(Account acc : trigger.new){
        if(oppsMap.containsKey(acc.id)){
            Opportunity exOpp = oppsMap.get(acc.id);
            oppList.add(new Opportunity (Id=exOpp.Id, Amount=acc.AnnualRevenue));
        }
        if(consMap.containsKey(acc.id)){
            Contact ecCon = consMap.get(acc.Id);
            conList.add(new Contact(Id = ecCon.Id, Phone = acc.Phone));
        }
        
    }
        update oppList;
        update conList;
    }
     

}