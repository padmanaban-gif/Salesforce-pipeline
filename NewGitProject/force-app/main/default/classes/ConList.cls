public with sharing class ConList{
    @AuraEnabled(cacheable = true)
    public static List<Contact> conListDetails(){
        return [select Id, FirstName, Phone
                from Contact
                limit 4];
    }

}