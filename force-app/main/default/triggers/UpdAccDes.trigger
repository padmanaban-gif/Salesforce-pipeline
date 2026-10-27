trigger UpdAccDes on Account (before insert,before update) {
    
    for(Account acc: trigger.new){
        if(trigger.isBefore && trigger.isInsert){
            if(acc.Phone != NULL){
                acc.Description ='Phone number is added';
            }
        }
        if(trigger.isBefore && trigger.isUpdate){
        Account oldAcc = trigger.oldMap.get(acc.id);
        if(acc.Phone != NULL && acc.Phone != oldAcc.Phone){
            acc.Description = 'Phone Number is updated';
        }
        }}

}