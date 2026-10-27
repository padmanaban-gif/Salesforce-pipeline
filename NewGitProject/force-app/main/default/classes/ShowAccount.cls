public with sharing class ShowAccount{
    @AuraEnabled(cacheable = true)
    public static List<Account> showAccountRecord(String searchTerm){
        String stringSearch = '%' + searchTerm + '%';
        return [Select Id, Name
                from Account
                where Name LIKE:stringSearch
                Limit 10];
    }

}