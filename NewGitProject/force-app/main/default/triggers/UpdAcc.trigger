trigger UpdAcc on Account (after update) {
    List<Id> listIds = new List<Id>();
    for(Account acc: trigger.new){
        if(acc.Type == 'VIP' && trigger.oldMap.get(acc.Id).Type !='VIP'){
            listIds.add(acc.Id);
        }
        if(!listIds.isEmpty()){
            system.enqueueJob(new updateRelatedContacts(listIds));
        }
    }

}