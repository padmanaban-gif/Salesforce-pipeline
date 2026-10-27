public with sharing class CurrentUser{
    @AuraEnabled
    public static user getcurrentUser(){
        return [select Id, Name, Email
                from user
                where Id = :userInfo.getUserId()];
    }

}