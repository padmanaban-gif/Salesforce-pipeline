//Updating the number of contacts in account object
trigger UpdConCountOnAccount on Contact (after insert,after update, after delete, after undelete) {
  set<id> conIds = new set<Id>();
    
    if(trigger.isAfter && trigger.isInsert || trigger.isUndelete){
        for(Contact con: trigger.new){
            if(con.AccountId != NULL){
                conIds.add(con.AccountId);
            }
        }
    }
    if(trigger.isAfter && trigger.isUpdate){
        for(Contact con: trigger.new){
            Contact cons = trigger.oldMap.get(con.Id);
            if(con.AccountId != cons.AccountId){
                conIds.add(cons.AccountId);
            }
            if(con.AccountId!= NULL){
                conIds.add(con.AccountId);
            }
        }
    }
    if(trigger.isAfter && trigger.isDelete){
        for(Contact con : trigger.old){
            if(con.AccountId != Null){
                conIds.add(con.AccountId);
            }
        }
    }
    //List<Account> accList = [select Id, No_of_cons__c from Account where Id IN : conIds];
    List<Account> accToUpdate = new List<Account>();
    for(Id accIds: conIds){
        List<Contact> conList = [select Id, AccountId from Contact where AccountId IN: conIds];
        accToUpdate.add(new Account(Id = accIds, No_Of_Cons__c = conList.size()));
    }
    update accToUpdate;
}