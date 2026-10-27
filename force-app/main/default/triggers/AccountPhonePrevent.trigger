trigger AccountPhonePrevent on Account (before update) {
    if(trigger.isBefore && trigger.isUpdate){
        for(Account acc: trigger.new){
            if(acc.Phone != trigger.oldMap.get(acc.id).Phone){
                acc.addError('Phone number cannpt be modified');
            }
        }
    }

}