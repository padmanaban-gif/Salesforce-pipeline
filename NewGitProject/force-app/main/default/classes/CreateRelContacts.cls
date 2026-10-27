public class CreateRelContacts {
    public static void toCreateRelContacts(){
        Account acc = new Account(Name = 'mosh');
        insert acc;
        
        for(integer i=0;i<=5;i++){
            Contact con = new Contact();
            con.FirstName  = 'contact';
            con.LastName = 'new'+i;
            con.AccountId = acc.Id;
            insert con;
            
        }
    }

}