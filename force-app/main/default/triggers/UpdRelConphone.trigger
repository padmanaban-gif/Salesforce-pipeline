trigger UpdRelConphone on Account (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        UpdRelConphoneHandler.updateRelCon(trigger.new, trigger.oldMap);
    }
}