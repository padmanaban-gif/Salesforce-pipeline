public class AccountCalculator {
@future
    public static void countCon(List<Id> accIds){
        List<Account> accList = [SELECT Id, (select Id from Contacts) from Account where Id IN: accIds];
        
        for(Account acc : accList){
            acc.No_of_cons__c = acc.Contacts.size();
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}