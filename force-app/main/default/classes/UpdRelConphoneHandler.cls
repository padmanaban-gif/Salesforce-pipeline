public class UpdRelConphoneHandler {
    public static void updateRelCon(List<Account> accounts, Map<id, Account> oldMap){
        set<Id> accIds = new set<Id>();
        Map<Id, Account> newAccMap = new Map<Id, Account>(accounts);
    for(Account acc: accounts){
        Account oldPhone = oldMap.get(acc.id);
        if(acc.phone != Null && acc.phone != oldPhone.phone){
            accIds.add(acc.Id);
        }
    }
    List<Contact> contoUpdate = new List<Contact>();
    for(Contact con : [select Id, AccountId, Phone from Contact where AccountId IN : accIds]){
        Account acc = newAccMap.get(con.AccountId);
        con.Phone =  acc.Phone;
        contoUpdate.add(con);
    }
    update contoUpdate;

    }

}