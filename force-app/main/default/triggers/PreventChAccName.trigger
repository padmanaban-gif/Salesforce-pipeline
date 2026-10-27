trigger PreventChAccName on Account (after update) {
    for(Account acc : trigger.new){
        Account oldName = trigger.oldMap.get(acc.Id);
        
        if(oldName.Name != acc.Name && acc.Type =='Customer-Direct'){
            acc.addError('we cannot change the account name');
        }
    }

}