public class UpdateAccount {
    public  void updateAccRec(){
        List<Account> accList = new List<Account>();
        Set<Id> accIdSet = new Set<Id>();
        List<Contact> accLisst = [SELECT Id, Account.Id FROM Contact WHERE Name LIKE '%TEST%' and Account.Id != null];
        for(Contact con:accLisst){
            if(!accIdSet.contains(con.account.Id)){
                Account acc = new Account();
                acc.Id =con.account.Id;
                acc.Active__c='yes';
                acc.Rating = 'cold';
                accList.add(acc);
                accIdSet.add(con.account.Id);
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}