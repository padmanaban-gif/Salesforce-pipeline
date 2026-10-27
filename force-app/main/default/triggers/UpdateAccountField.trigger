trigger UpdateAccountField on Case (after insert) {
    Set<Id> conIds = new Set<Id>();
    for(Case c : trigger.new){
        if(c.AccountId != null){
            conIds.add(c.AccountId);
        }
    }
    List<Account> updateAccount = new List<Account>();
    List<Account> updatedAccounts =[select Id, Rating from account where Id IN: conIds];
    for(Account acc: updatedAccounts){
        acc.Rating = 'High';
        updateAccount.add(acc);
    }
    update updateAccount;

}