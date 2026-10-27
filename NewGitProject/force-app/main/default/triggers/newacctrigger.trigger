trigger newacctrigger on Account (before insert,before update, after update) {
    //trigger to get the newly updated record name and old record name 
    if(Trigger.isBefore && Trigger.isInsert){
        System.debug('this is newly created record');
    }
    if(Trigger.isUpdate)
    {
        if(Trigger.isBefore){
            for(Account acc: Trigger.new){
                 System.debug('New name :'+ acc.Name);
                 System.debug('Old name :'+ Trigger.oldMap.get(acc.Id).Name);
            }
            
        }
       
    }

}