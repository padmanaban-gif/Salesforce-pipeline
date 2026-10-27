trigger SynAccphoneToCon on Account (after update) {
      set<Id> accIds = new set<Id>();
    for(Account acc: trigger.new){
        Account oldPhone = trigger.oldMap.get(acc.Id);
        if(acc.Phone != Null && acc.Phone != oldPhone.phone){
            accIds.add(acc.Id);
        }
    }
    List<Contact> conList = [select Id, AccountId, Phone from Contact where AccountId IN : accIds];
    Map<Id, Contact> existingRecords = new Map<Id, contact>();
    for(Contact cons : conList){
        if(!existingRecords.containskey(cons.AccountId)){
            existingRecords.put(cons.AccountId, cons);
        }
    }
    List<Contact> conListToUpdate = new List<Contact>();
    for(Account acc: trigger.new){
        if(existingRecords.containsKey(acc.Id)){
            conListToUpdate.add(new Contact(Id = acc.Id, Phone = acc.Phone));
        }
    }
    update conListToUpdate;
}