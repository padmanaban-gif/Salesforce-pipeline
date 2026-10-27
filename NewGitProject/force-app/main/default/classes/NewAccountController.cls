public with sharing class NewAccountController{
    @AuraEnabled(cacheable = true)
    public static List<Account> getAccount(){
        return [Select Id, Name, Industry, Phone
                from Account
                Limit 10];
    }

}