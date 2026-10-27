trigger OpprtunityTrigger on Opportunity (after insert,after update,after delete) {
    
   /* if(Trigger.isAfter){
        if(Trigger.isInsert){
            OpportunityHandlerTrigger.onAfterInsert(Trigger.new);
        }
        if(Trigger.isUpdate){
            OpportunityHandlerTrigger.onAfterupdate(Trigger.new,Trigger.oldMap);
        }
        if(Trigger.isDelete){
            OpportunityHandlerTrigger.onAfterDelete(Trigger.old);
        }
    }*/

}