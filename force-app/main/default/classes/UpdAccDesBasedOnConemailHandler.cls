//trigger handler of UpdAccDesBasedOnConemail
//updatign related account description field when contact email is getting changed
public class UpdAccDesBasedOnConemailHandler {
    public static void updateAccountDes(List<Contact> newCons,Map<id, contact> oldMap ){
        set<Id> conIds = new set<id>();
    for(Contact con : newCons){
        Contact oldEmail = oldMap.get(con.Id);
        if(con.AccountId != Null && con.Email != oldEmail.Email ){
            conIds.add(con.AccountId);
        }
    }
    //List<Account> accList = [select Id, Description from Account where Id IN : conIds]; 
    List<Account> accToUpdate = new List<Account>();
    for(Account acc: [select Id, Description from Account where Id IN : conIds]){
        //if(conIds.contains(acc.Id))
            acc.Description = 'Related Contact email has been updated';
            accToUpdate.add(acc);
        //}
        
    }
    update accToUpdate;
    }

}