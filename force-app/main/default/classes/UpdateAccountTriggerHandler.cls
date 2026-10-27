public class UpdateAccountTriggerHandler {
    public static void updateAccount(List<Account> newList, Map<Id, Account> oldMap){
        Set<Id> accIds = new Set<Id>();
        for(Account acc: newList){
            if(acc.Phone != oldMap.get(acc.Id).Phone){
                accIds.add(acc.id);
            }
        }
        List<Contact> relatedList = [select Id, AccountId, Description from Contact where AccountId IN : accIds];
        for(Contact con: relatedList){
            con.Description ='Account name chnaged';
        }
        update relatedList;
    }

}