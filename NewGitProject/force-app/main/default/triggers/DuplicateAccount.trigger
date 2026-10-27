trigger DuplicateAccount on Account (before insert) {
Set<Decimal> accIds = new Set<Decimal>();
    for(Account acc: trigger.new){
        if(acc.New_Amount__c != null){
            accIds.add(acc.New_Amount__c);
        }
    }
    Map<Decimal, Account> existing = new Map<Decimal, Account>();
    for(Account acc: [select id, New_Amount__c from Account where New_Amount__c IN :accIds]){
        existing.put(acc.New_Amount__c,acc);
    }
    for(Account acc:trigger.new){
        if(existing.containsKey(acc.New_Amount__c)){
            acc.addError('Account cannot be created with same amount value');
        }
    }
}