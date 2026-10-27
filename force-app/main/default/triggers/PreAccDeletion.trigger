//prevent the deletion of account record if there is an related contact record
trigger PreAccDeletion on Account (before delete) {
    Set<Id> accIds = new Set<Id>();
    for(Account acc: trigger.old){
        accIds.add(acc.Id);
    }
    List<Contact> exisCons = [select Id,AccountId, LastName from Contact where AccountId IN : accIds ];
    Map<Id, List<Contact>> exisitingCons = new Map<Id, List<Contact>>();
    for(Contact con  : exisCons){
        if(!exisitingCons.containsKey(con.AccountId)){
            exisitingCons.put(con.AccountId, new List<Contact>());
        }
        exisitingCons.get(con.AccountId).add(con);
    }
    for(Account acc: trigger.old){
        if(exisitingCons.containsKey(acc.id)){
            acc.addError('you cannot delete this account');
        }
    }
        
    

}