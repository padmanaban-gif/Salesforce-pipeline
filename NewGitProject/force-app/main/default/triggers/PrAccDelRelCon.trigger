trigger PrAccDelRelCon on Account (before delete) {
    set<Id> accIds = new set<Id>();
    for(Account acc: trigger.old){
        if(acc.Id != null){
            accIds.add(acc.Id);
        }
    }
    List<Contact> conList=[select Id, AccountId from Contact where AccountId IN : accIds];
    Map<Id, Contact> conMap = new Map<Id, Contact>();
    for(Contact con: conList){
        if(!conMap.containsKey(con.AccountId)){
            conMap.put(con.AccountId, con);
        }
    }
    for(Account acc: trigger.old){
        if(conMap.containsKey(acc.Id)){
            acc.addError('Cannot delete this record');
        }
    }

}