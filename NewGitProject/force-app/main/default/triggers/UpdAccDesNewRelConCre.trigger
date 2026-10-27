//Update account description field once related contact is created
trigger UpdAccDesNewRelConCre on Contact (after insert) {
    
    //List<Contact> conList = new List<Contact>();
    set<id> conList = new set<id>();
    for(Contact con: trigger.new){
        if(con.AccountId != NUll){
            conList.add(con.AccountId);
        }
    }
    List<Account> accList = [select Id, Description from Account where Id IN : ConList];
    List<Account> accToUpdate = new List<Account>();
    for(Account acc: accList){
        acc.Description ='New related contact is created';
        accToUpdate.add(acc);
    }
    update accToUpdate;

}