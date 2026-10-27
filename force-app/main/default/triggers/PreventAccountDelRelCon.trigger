//Preventig account to be deleted if it has related contacts
trigger PreventAccountDelRelCon on Account (before delete) {
    
    set<Id> accIds = new set<id>();
    for(Account acc: trigger.old){
        accIds.add(acc.Id);
    }
    
    set<Id> conIds = new set<Id>();
    for(Contact con : [select AccountId, LastName from Contact where AccountId IN : accIds]){
        conIds.add(con.AccountId);
    }
    for(Account acc: trigger.old){
        if(conIds.contains(acc.Id)){
            acc.adderror('you cant delete this account');
        }
    }

}