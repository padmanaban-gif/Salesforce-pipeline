trigger UpdateAccount on Account (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        UpdateAccountTriggerHandler.updateAccount(trigger.new, trigger.oldMap);
    }

}