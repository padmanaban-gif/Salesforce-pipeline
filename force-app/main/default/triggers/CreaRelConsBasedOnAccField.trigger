//creating related opp records based on the number entered in account field
trigger CreaRelConsBasedOnAccField on Account (after insert, after update) {
    
    if(trigger.isAfter && trigger.isInsert){
        List<Opportunity> oppList = new List<Opportunity>();
        //set<Id> accIds = new Set<Id>();
        for(Account acc: trigger.new){
            if(acc.No_of_cons__c != Null){
                Integer noOfCons = Integer.valueOf(acc.No_of_cons__c);
                for(Integer i=1;i<noOfCons;i++){
                Opportunity opp = new Opportunity();
                opp.StageName ='Prospecting';
                opp.Name = acc.Name;
                    opp.Max_Amount__c = 800;
                    opp.CloseDate = Date.Today();
                    opp.AccountId = acc.Id;
                    oppList.add(opp);
            }
            }
            
            
        }
        insert oppList;
    }
    if(trigger.isAfter && trigger.isUpdate){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc: trigger.new){
            Account oldNumber = trigger.oldMap.get(acc.Id);
            if(acc.No_of_cons__c!= Null && acc.No_of_cons__c != oldNumber.No_of_cons__c){
                Integer noOfCons = Integer.valueOf(acc.No_of_cons__c);
                for(Integer i=1;i<noOfCons;i++){
                Opportunity opp = new Opportunity();
                opp.StageName ='Prospecting';
                opp.Name = acc.Name;
                    opp.Max_Amount__c = 800;
                    opp.CloseDate = Date.Today();
                    opp.AccountId = acc.Id;
                    oppList.add(opp);
            }
            }
        }
        insert oppList;
    }

}