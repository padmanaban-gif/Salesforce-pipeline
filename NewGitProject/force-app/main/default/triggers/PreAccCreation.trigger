//Preventing account craetion if old account names containing abc in their account name
trigger PreAccCreation on Account (before insert) {
    
    set<String> accNames = new set<String>();
    for(Account acc: trigger.new){
        if(acc.Name != Null){
            accNames.add(acc.Name.toLowerCase());
        }
    }
    List<Account> accNamess = [select Name from Account where Name IN : accNames];
    set<String> existingNames = new set<String>();
    for(Account acc: accNamess ){
        existingNames.add(acc.Name.toLowerCase());
    }
    for(Account acc: trigger.new){
        if(acc.Name.toLowerCase().contains('abc') && existingNames.contains(acc.Name.toLowerCase())){
            acc.addError('use different account name');
        }
    }

}