public class DML {
    public static void records(){
        /*Account acc = new Account (Name ='mani',Phone='6369019532');
        insert acc;
        Contact con = new Contact(FirstName ='giri',LastName='Karthick',AccountId =acc.Id);//related record for the above account
        insert con;*/
        //we can minimize the dml governer limit by using list and we can create many records bu using loop.
        /*List<Account> accList = new List<Account>();
        for(Integer i =1;i<=3;i++){//creating 3 records by loop
            Account acc = new Account(Name ='mani'+i);
            accList.add(acc);
        }
        
        insert accList;*/
        /*updating the records on exisiting account with upsert
        Account acc1 = [SELECT Id, Name, Phone FROM Account WHERE Name ='mani3'];
        acc1.Phone='56575755';
        upsert acc1;
        List<Account> acc = new List<Account>();
        Account acc3 = new Account(Name ='karthi');
        Account acc4 = [SELECT Id, Name, Phone FROM Account WHERE Name ='mani2'];
        acc4.Phone='56575755';
        acc.add(acc3);
        acc.add(acc4);
        upsert acc;*/
        //delete and undeleting the records
        /*List<Account> acco = [SELECT Id, Name, Phone FROM Account WHERE Phone ='56575755'];//delete
        delete acco;*/
         List<Account> acco = [SELECT Id, Name, Phone FROM Account WHERE Phone ='56575755' ALL ROWS];//UNdelete
        undelete acco;
        
    }

}