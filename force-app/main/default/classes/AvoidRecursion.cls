public class AvoidRecursion {
    private static Boolean isTriggerExecuted = false;
    
    public void beforeInsert(List<Account> newAccounts){
        if(!isTriggerExecuted){
            isTriggerExecuted = true;
            updateDate(newAccounts);
            isTriggerExecuted = false;
        }
    }
    public void beforeUpdate(List<Account> newAccounts, Map<Id, Account> oldAccounts){
        if(!isTriggerExecuted){
            isTriggerExecuted = true;
            updateDate(newAccounts);
            isTriggerExecuted = false;
        }
    }
    private void updateDate(List<Account> accounts){
        for(Account acc: accounts){
            acc.LLast_Modeified_Date__c = Date.Today();
        }
    }
}