trigger PreventRelConAccount on Account (before delete) {
    
    Set<Id> accIds = new Set<Id>();
    
    for(Account acc: trigger.old){
        if(acc.Id != NULL){
            accIds.add(acc.Id);
        }
            
}
    Map<Id, List<Contact>> existingList = new Map<Id, List<Contact>>();
    for(Contact con:[select Id, AccountId from Contact where AccountId IN : accIds]){
        if(!existingList.containsKey(con.AccountId)){
            existingList.put(con.AccountId, new List<Contact>());
        }
        existingList.get(con.AccountId).add(con);
    }
    for(Account acc: trigger.old){
        if(existingList.containsKey(acc.Id)){
            acc.addError('Cannot delete the account which is having related contacts');
        }
    }

}