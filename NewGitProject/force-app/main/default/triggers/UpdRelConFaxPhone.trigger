//syncing account phone and fax detaisl to related contact record
trigger UpdRelConFaxPhone on Account (after insert, after update) {
    
    Set<Id> accIds = new Set<id>();
    
    for(Account acc: trigger.new){
        Account oldAcc = trigger.oldMap.get(acc.Id);
        
        if(oldAcc != null  &&(acc.Phone != oldAcc.Phone || acc.Fax != oldAcc.Fax)){
            accIds.add(acc.Id);
        }
    }
    List<Contact> ConsToUpdate = new List<contact>();
    
    List<Contact> conList = [select Id, AccountId, Fax, Phone from Contact where AccountId IN : accIds];
    for(Contact con : conList){
        Account newAcc = trigger.newMap.get(con.AccountId);
        con.Phone = newAcc.Phone;
        con.Fax = newAcc.Fax;
        ConsToUpdate.add(con);
        
    }
    update ConsToUpdate;
}