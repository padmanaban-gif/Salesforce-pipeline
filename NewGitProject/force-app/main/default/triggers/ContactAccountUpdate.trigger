trigger ContactAccountUpdate on Contact (after insert, after update, after delete, after undelete) {
    if(TriggerHelper.isTriggerRan) return;
    TriggerHelper.isTriggerRan = true;
    Set<Id> accIds = new Set<Id>();
    
    if(trigger.isAfter && (trigger.isInsert || trigger.isUndelete)){
        for(Contact con: trigger.new){
            if(con.AccountId != NULL){
                accIds.add(con.AccountId);
            }
        }    }
    if(trigger.isAfter && trigger.isUpdate){
        for(Contact con: trigger.new){
            if(con.AccountId != NULL && trigger.oldMap.get(con.Id).AccountId != NULL){
                accIds.add(trigger.oldMap.get(con.Id).AccountId);
            }if(con.AccountId != NULL){
                accIds.add(con.AccountId);
            }
        }
    }
    if(trigger.isAfter && trigger.isDelete){
        for(Contact con: trigger.old){
            accIds.add(con.AccountId);
        }
    }
    List<Account> accList = [select Id, Name, No_of_cons__c,(select Id from Contacts) from Account where Id  =:accIds];
    List<Account> accToUpdate = new List<Account>();
    
    for(Account acc: accList){
        acc.No_of_Cons__c = acc.Contacts.size();
        accToUpdate.add(acc);
    }
    update accToUpdate;

}