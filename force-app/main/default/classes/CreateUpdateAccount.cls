public with sharing class CreateUpdateAccount{
    @AuraEnabled(cacheable = true)
    public static List<Account> getAccount(){
        return [select Id, Name, Phone, Industry
                from Account
                limit 10];
    }

    @AuraEnabled
    public static void updateAccount(Account acc){
        update acc;
    }

}