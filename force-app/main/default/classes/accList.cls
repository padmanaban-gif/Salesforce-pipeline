/*public with sharing class accList{
 @AuraEnabled(cacheable = true)
 public static List<Account> newAccList(){
 return [SELECT Id, Name, Phone
 from Account
 Limit 10];
 }

 }*/
public with sharing class accList{
    @AuraEnabled
    public static List<Account> newAccList(Integer NoOfRecords){
        return [SELECT Id, Name, Phone
                from Account
                Limit :NoOfRecords];
    }

}