//Scenario: Write an Apex trigger that updates the Description field of contacts associated with accounts when 
//the Industry field of the account is changed,appending the old and new industry values in the contact's Description.
trigger UpdRelConDes on Account ( after update) {
    
    List<Contact> consToUpdate = new List<Contact>();
    
    Set<Id> accIds = new Set<Id>();
    for(Account acc: trigger.new){
        Account oldIndustry = trigger.oldMap.get(acc.Id);
        
        if( acc.Industry != oldIndustry.Industry){
            accIds.add(acc.Id);
        }
    }
    List<Contact> conList = [select Id, Description,AccountId from Contact where AccountId IN :accIds];
    for(Contact con : conList){
        Account newAcc = trigger.newMap.get(con.AccountId);
        Account oldAcc = trigger.oldMap.get(con.AccountId);
        con.Description = 'New Industry'+newAcc.Industry+'Old Industry'+ oldAcc.Industry;
        consToUpdate.add(con);
    }
    update consToUpdate;

}