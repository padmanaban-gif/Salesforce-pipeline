//update contact description when account industry changed
trigger UpdConDesBasOnAccIndustr on Account (after update) {
    //List<Contact> conList = new List<Contact>();
    set<Id> accList = new set<Id>();
    for(Account acc: trigger.new){
        Account accs = trigger.oldMap.get(acc.Id);
        if(acc.Industry != accs.Industry){
            accList.add(acc.Id);
        }
    }
    List<Contact> conLists = [select Id, AccountId, Description from Contact where AccountId IN: accList];
    for(Contact con : conLists){
        con.Description = 'Account Industry value changed';
        //conLists.add(con);
    }
    update conLists;
}