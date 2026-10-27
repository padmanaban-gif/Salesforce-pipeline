public class UpdRelConDescriptionHandler {
    public static void updateRelCon(List<Account> accounts, Map<Id, Account> oldMap){
         set<Id> accIds = new set<id>();
        Map<Id, Account> newAccountMap = new Map<Id, Account>(accounts );
    for(Account acc : accounts){
        Account oldacc = oldMap.get(acc.Id);
        if(acc.Industry != oldacc.Industry){
            accIds.add(acc.Id);
        }
    }
    List<Contact> conToUpdate = new List<Contact>();
    for(Contact con : [select Id, AccountId, Description from Contact where AccountId IN : accIds]){
        Account acc = newAccountMap.get(con.AccountId);
        con.Description = 'Realted Industry is changed'+ acc.Industry;
        conToUpdate.add(con);
    }
    if(!conToUpdate.isEmpty()){
    update conToUpdate;
    }

    }}