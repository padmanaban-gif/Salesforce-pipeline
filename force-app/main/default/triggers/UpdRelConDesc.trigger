trigger UpdRelConDesc on Account (after update) {
     set<Id> accIds = new set<Id>();
    for(Account acc: trigger.new){
        Account oldIndustry = trigger.oldMap.get(acc.Id);
        if(acc.Industry != Null && acc.Industry != oldIndustry.Industry){
            accIds.add(acc.Id);
        }
    }
    List<Contact> conList = [select Id, AccountId, Description from Contact where AccountId IN :accIds];
    for(Contact con: conList){
        con.Description = 'Related Account Industry changed';
    }
    update conList;

}