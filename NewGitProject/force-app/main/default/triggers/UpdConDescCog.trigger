trigger UpdConDescCog on Account (after update) {
    set<id> accIds = new set<id>();
    for(Account acc: trigger.new){
        Account oldIndustry = trigger.oldMap.get(acc.Id);
        if(acc.Industry != Null && acc.Industry != oldIndustry.Industry){
            accIds.add(acc.id);
        }
    }
    List<contact> conList = [select Id, AccountId, Description from Contact where AccountId IN : accIds];
    for(Contact con : conList){
        con.Description = 'New industry value has been updated'+ trigger.newMap.get(con.AccountId).Industry;
        //conList.add(con);
    }
    update conList;

}