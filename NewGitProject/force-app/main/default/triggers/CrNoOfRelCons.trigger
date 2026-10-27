trigger CrNoOfRelCons on Account (after insert, after update) {
    if(trigger.isAfter && trigger.isInsert){
        List<Contact> conList = new List<Contact>();
        for(Account acc: trigger.new){
            if(acc.No_Of_Cons__c != null){
                Integer consCount = Integer.valueOf(acc.No_Of_Cons__c);
            
            for(Integer i=1; i< consCount; i++){
                Contact con = new Contact();
                con.LastName = acc.Name+i;
                con.AccountId = acc.Id;
                conList.add(con);
                
            }}
        }
        insert conList;
    }
    if(trigger.isAfter && trigger.isUpdate){
        List<Contact> conList = new List<Contact>();
        for(Account acc: trigger.new){
            Account oldCount = trigger.oldMap.get(acc.Id);
            if(acc.No_of_cons__c != NULL && acc.No_of_cons__c != oldCount.No_of_cons__c){
                Integer newCounts = Integer.valueOf(acc.No_of_cons__c);
                 for(Integer i=1; i< newCounts; i++){
                Contact con = new Contact();
                con.LastName = acc.Name+i;
                con.AccountId = acc.Id;
                conList.add(con);
                
            }
            }
        }
        insert conList;
    }

}