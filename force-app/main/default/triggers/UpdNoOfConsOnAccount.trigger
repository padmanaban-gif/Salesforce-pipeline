trigger UpdNoOfConsOnAccount on Contact (after insert, after update, after delete, after undelete) {
   set<Id> accIds = new set<Id>();
    
    if(trigger.isAfter && (trigger.isInsert || trigger.isUndelete)){
        for(Contact con: trigger.new){
            if(con.AccountId != Null){
                accIds.add(con.AccountId);
            }
        }
    }
    if(trigger.isAfter && trigger.isUpdate){
        for(Contact con: trigger.new){
            contact oldCon = trigger.oldMap.get(con.Id);
            if(con.AccountId != oldCon.AccountId){
                accIds.add(con.AccountId);
            }if(con.AccountId != Null){
                accIds.add(con.AccountId);
            }
        }
    }
    if(trigger.isAfter && trigger.isDelete){
        for(Contact con: trigger.old){
            if(con.AccountId != Null){
                accIds.add(con.AccountId);
            }
        }
    }
    List<Account> accToUpdate = new List<Account>();
    List<contact> conList = [select Id, AccountId from Contact where AccountId IN : accIds];
    for(Id ids : accIds){
        
        accToUpdate.add(new Account(Id = ids, No_Of_Cons__c = conList.size()));
    }
    update accToUpdate;
}