public with sharing class CreateClass{
    @AuraEnabled
    public static void createNewClass(Case newCase){
        try{
            insert newCase;
        } catch (Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }

}