public with sharing class WireClass{
    @AuraEnabled(cacheable = true)
    public static String sayHello(){
        return ('Welcome to my new component');
    }

    @AuraEnabled(cacheable = true)
    public static List<Contact> conList(String accId){
        return [select id, name, email
                from contact];
    }

    @AuraEnabled
    public static List<Opportunity> oppList(){
        return [select id, name
                from Opportunity];
    }

}