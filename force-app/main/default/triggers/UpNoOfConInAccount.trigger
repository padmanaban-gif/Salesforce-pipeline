//Update No of Cons field on account object once related contact is created updated deleted or undeleted
trigger UpNoOfConInAccount on Contact (after insert, after update, after delete,after undelete) {
    set<Id> conIds = new set<Id>();
    
    if(trigger.isAfter &&( trigger.isInsert || trigger.isUndelete)){
        for(Contact con: trigger.new){
            if(con.AccountId != Null){
                conIds.add(con.AccountId);
            }
        }
    }
    
    if(trigger.isAfter && trigger.isUpdate){
        
        for(Contact con: trigger.new){
            Contact oldConValue = trigger.oldMap.get(con.Id);
            if(con.AccountId !=  oldConValue.AccountId){
                if(oldConValue.AccountId != Null){
                    conIds.add(oldConValue.AccountId);
                }if(con.AccountId != Null){
                    conIds.add(con.AccountId);
                }
            }
            if(con.AccountId != Null){
                conIds.add(con.AccountId);
            }
        }
    }
    if(trigger.isAfter && trigger.isDelete){
        for(contact con: trigger.old){
            if(con.AccountId != Null){
                conIds.add(con.AccountId);
            }
        }
    }
   Map<Id, Integer> conList = new Map<Id, Integer>();
    for(AggregateResult ar :[select AccountId, Count(id) totalContacts from Contact where 
                             AccountId IN : conIds Group By AccountId]){
                              conList.put((Id) ar.get('AccountId'),(INTEGER) ar.get('totalContacts'));
                             }
    List<Account> accToBeUpdated = new List<Account>();
    for(Id ids : conIds){
        accToBeUpdated.add(new Account(Id = ids, 
                                       No_Of_Cons__c = conList.containsKey(ids)? conList.get(ids):0));
    }
    update accToBeUpdated;
}