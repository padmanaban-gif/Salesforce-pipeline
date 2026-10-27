trigger UpdAccDesBasedOnConemail on Contact (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        UpdAccDesBasedOnConemailHandler.updateAccountDes(trigger.new, trigger.oldMap);
    }

}