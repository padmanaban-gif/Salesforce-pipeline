trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) {
    Set<Id> accIds = new Set<Id>();
    if(Trigger.isAfter && (Trigger.isInsert ||trigger.isUpdate && Trigger.isUndelete)){
        
         for(Contact con: Trigger.New){
                if(con.AccountId != null){
                    accIds.add(con.AccountId);
                }
            }
        }
    }