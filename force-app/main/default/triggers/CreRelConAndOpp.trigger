trigger CreRelConAndOpp on Account (after insert, after update) {
    if(trigger.isAfter && trigger.isInsert){
        List<Contact> conToUpdate = new List<Contact>();
        List<Opportunity> oppToUpdate = new List<Opportunity>();
        
        for(Account acc: trigger.new){
            Contact con = new Contact();
            con.LastName = acc.Name;
            //con.aAmount = acc.AnnualRevenue;
            con.Phone = acc.Phone;
                con.AccountId = acc.Id;
                conToUpdate.add(con);
            
            Opportunity opps = new Opportunity();
            opps.Name = acc.Name;
            opps.stageName ='Closed Won';
            opps.CloseDate = Date.today();
            opps.Amount = acc.AnnualRevenue;
            opps.Phone__c = acc.Phone;
            opps.Max_Amount__c = 647;
            opps.AccountId = acc.Id;
            oppToUpdate.add(opps);
        }
        insert conToUpdate;
            insert oppToUpdate;
    }
    if(trigger.isAfter && trigger.isUpdate){
        set<id> accIds = new set<Id>();
        for(Account acc: trigger.new){
            Account oldCon = trigger.oldMap.get(acc.Id);
            Account oldRevenue = trigger.oldMap.get(acc.Id);
            if(acc.Phone != oldCon.Phone && acc.AnnualRevenue != oldRevenue.AnnualRevenue ){
                accIds.add(acc.Id);
            }
        }
        List<Contact> cons = [select AccountId, Phone from Contact where AccountId IN : accIds];
        Map<Id, Contact> consMap = new Map<Id, Contact>();
        for(Contact con: cons){
            if(!consMap.containsKey(con.AccountId)){
                consMap.put(con.AccountId, con);
            }
        }
        List<Opportunity> opps = [select AccountId, stageName, Name, Amount, Max_Amount__c, phone__C from Opportunity where 
                                 AccountId IN :accIds];
        
    }

}