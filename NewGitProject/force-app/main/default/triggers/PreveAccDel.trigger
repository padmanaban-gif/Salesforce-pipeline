trigger PreveAccDel on Account (before delete) {
    set<Id> accIds = new set<Id>();
    for(Account acc: trigger.old){
        accIds.add(acc.Id);
    }
    List<Contact> conList = [Select Id, AccountId from Contact where AccountId IN : accIds];
    Map<Id, Contact> existingCons = new Map<Id, Contact>();
    for(Contact con: conList){
        if(!existingCons.containsKey(con.AccountId)){
            existingCons.put(con.AccountId, con);
        }
    }
    for(Account acc: trigger.old){
        if(existingCons.containsKey(acc.Id)){
            acc.addError('better luck next time');
        }
    }

}