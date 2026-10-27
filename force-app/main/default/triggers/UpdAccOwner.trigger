trigger UpdAccOwner on Contact (after insert, after update) {
    /*set<Id> conIds = new set<Id>();
    for(Contact con: trigger.new){
        if(con.AccountId != Null && con.Active__c){
            conIds.add(con.AccountId);
        }
    }
    List<Contact> conList = [select Id, ACCOUNTid, Active__C from Contact where AccountId IN : conIds];
    Map<Id, Contact> oldCons = new Map<Id, Contact>();
    for(Contact con: conList){
        if(!oldCons.containsKey(con.AccountId)){
            oldCons.put(con.AccountId, con);
        }
}
    List<Account> accToUpdate = new List<Account>();
    for(Contact con: trigger.new){
        if(oldCons.containsKey(con.AccountId)){
            Account acc = new Account();
            acc.Ownership = 'Private';
            acc.Id =con.AccountId;
            accToUpdate.add(acc);
        }
    }
    update accToUpdate;*/
    if(trigger.isAfter && trigger.isInsert){
    set<Id> conIds = new set<Id>();
    for(Contact con : trigger.new){
        if(con.AccountId != Null && con.Active__c == true){
            conIds.add(con.AccountId);
        }
    }
    List<Account> accToUpdate = new List<Account>();
    for(Id ids : conIds){
        accToUpdate.add(new Account(Id = ids, Ownership ='Public'));
        
    }
    update accToUpdate;

    }
    if(trigger.isAfter && trigger.isUpdate){
        set<Id> conIds = new set<Id>();
        for(Contact con: trigger.new){
        Contact oldCon = trigger.oldMap.get(con.Id);
            if(con.AccountId != Null && con.Active__c != oldCon.Active__c && con.Active__c == true){
                conIds.add(con.AccountId);
            }
            } 
        if(!conIds.isEmpty()){
            List<Account> accToUpdate = new list<Account>();
            for(Id ids :conIds){
                accToUpdate.add(new Account(Id =ids, ownership ='Other'));
            }
            update accToUpdate;
        }
        
    
    }
    
}