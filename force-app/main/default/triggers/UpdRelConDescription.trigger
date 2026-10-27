trigger UpdRelConDescription on Account (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        UpdRelConDescriptionHandler.updateRelCon(trigger.new, trigger.oldMap);
    }
}