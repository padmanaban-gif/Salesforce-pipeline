//preventing account to be deleted if it has related contact
trigger PreAccDelBasedOnRelCon on Account (before delete) {
    Set<Id> accIds = new set<Id>();
    for(Account acc: trigger.old){
        if(acc.Id != NULL){
            accIds.add(acc.Id);
        }
    }
    List<Contact> conList = [select Id, AccountId from Contact where AccountId IN : accIds];
    Map<Id, Contact> accMap = new Map<Id, Contact>();
    for(Contact con : conList){
        if(!accMap.containsKey(con.AccountId)){
            accMap.put(con.AccountId, con);
        }
    }
    for(Account acc: trigger.old){
        if(accMap.containsKey(acc.Id)){
            acc.addError('you cannot delete this account because it has related contact');
        }
        
    }
}