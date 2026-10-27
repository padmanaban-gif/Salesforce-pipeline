public with sharing class DynamicPicklist{
    @AuraEnabled(cacheable = true)
    public static List<String> dynamicPicklistValues(){
        List<String> friends = new List<String>();
        friends.add('Karthi');
        friends.add('jaya');
        friends.add('mani');
        return friends;
    }

}