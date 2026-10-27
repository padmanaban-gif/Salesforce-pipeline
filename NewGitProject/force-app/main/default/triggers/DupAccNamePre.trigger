trigger DupAccNamePre on Account (before insert) {
       set<string> accList = new set<string>();
    for(Account acc:trigger.new){
        if(acc.Name != Null){
            accList.add(acc.Name);
        }
        
    }
    List<Account> accLists = [select Id, Name from Account where Name IN :accList];
    set<String> accSet = new set<String>();
    for(Account acc: accLists){
        
            accSet.add(acc.Name);
        
    }
    for(Account acc: trigger.new){
        if(accSet.contains(acc.Name)){
            acc.addError('Account name should be unique');
        }
    }

}