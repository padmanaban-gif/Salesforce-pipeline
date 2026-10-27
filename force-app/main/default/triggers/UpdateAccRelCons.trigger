trigger UpdateAccRelCons on Account (after update) {
    List<Contact> consToUpdate = new List<Contact>();
    
    Set<Id> accIds = new Set<Id>();
    
    for(Account acc: trigger.new){
        Account oldName = trigger.oldMap.get(acc.Id);
        if(acc.Name != null && acc.Name != oldName.Name){
            accIds.add(acc.Id);
        }
    }
    List<Contact> conList = [select Id, AccountId, Description from Contact where AccountId IN : accIds];
    for(Contact con: conList){
        con.Description = 'Account name changed';
        consToUpdate.add(con);
    }
    update consToUpdate;

}