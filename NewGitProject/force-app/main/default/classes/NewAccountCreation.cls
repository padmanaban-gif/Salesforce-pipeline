public with sharing class NewAccountCreation{
    @AuraEnabled
    public static String newAccount(String accountName){
        try{
            Account newAccount = new Account(
                Name = accountName
            );
            insert newAccount;
            return 'Account created successfully';
        } catch (Exception error){
            throw new AuraHandledException(error.getMessage());
        }
    }

}