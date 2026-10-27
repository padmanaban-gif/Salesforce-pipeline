public with sharing class WiringAccountDetails{
    @AuraEnabled(cacheable = true)
    public static List<Account> getAccount(){
        return [select Id, Name, Industry, Rating
                from Account];
    }

    @AuraEnabled
    public static Account insertAccount(){
        try{
            Account a = new Account();
            a.Name = 'New Account';
            a.Industry = 'Development';
            a.Rating = 'Cold';

            insert a;

            return a;
        } catch (Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }

}