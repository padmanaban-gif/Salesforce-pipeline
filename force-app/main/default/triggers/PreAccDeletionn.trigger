trigger PreAccDeletionn on Account (before delete) {
    set<Id> accIds = new set<Id>();
    for(Account acc: trigger.old){
        accIds.add(acc.Id);
    }
    List<Contact> conList = [select Id, AccountId from Contact where AccountId IN : accIds];
    Map<Id, Contact> oldCons = new Map<Id, Contact>();
    for(Contact con: conList){
        if(!oldCons.containsKey(con.AccountId)){
            oldCons.put(con.AccountId, con);
        }
    }
    for(Account acc: trigger.old){
        if(oldCons.containsKey(acc.Id)){
            acc.addError('Not allowed');
        }
    }

}