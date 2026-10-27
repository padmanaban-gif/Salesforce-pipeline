trigger AccountTriggerr on Account (before insert, before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountTRiggerrHandler.copyBillingToShipping(Trigger.new);
        }else if(Trigger.isUpdate){
            AccountTRiggerrHandler.copyBillingToShipping(Trigger.new);
        }
    }
}