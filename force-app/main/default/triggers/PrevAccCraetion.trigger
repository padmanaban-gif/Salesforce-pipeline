trigger PrevAccCraetion on Account (before update) {
    set<String> accNames = new set<String>();
    set<String> accEmails = new set<String>();
    for(Account acc: trigger.new){
        Account accs = trigger.oldMap.get(acc.Id);
        if(acc.Name != accs.Name && acc.new_email__c != accs.new_email__c){
            accNames.add(acc.Name);
            accEmails.add(acc.New_Email__c);
        }
    }
    Map<String, Account> nameMap = new Map<String, Account>();
    Map<String, Account> accEmailss = new Map<String, Account>();
    for(Account accss: [select Id, Name, new_email__c from account where Name IN :accNames ]){
        nameMap.put( accss.Name, accss);
        
    }
    for(Account accss: [select Id, Name, new_email__c from account where new_email__c =:accEmails ]){
        accEmailss.put(accss.New_Email__c, accss);
    }
        
    for(Account acc: trigger.new){
        if(nameMap.containskey(acc.Name) && accEmailss.containskey(acc.New_Email__c)){
            acc.addError('same account name with same email already exists');
        }
    }

}