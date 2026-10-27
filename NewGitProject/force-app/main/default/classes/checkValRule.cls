public class checkValRule {
    public static void toCheckValRule(){
        Account acc = New Account(Name = 'john');
        insert acc;
        Account accList = [select Id, Name from Account where Name ='John'];
        System.debug(accList);
        
        System.Savepoint spt = Database.setSavePoint();
        
        try{
            Contact con =  new Contact(LastName = 'padhu');
            insert con;
            //insert con;
        }
        catch(Exception ex){
           Database.rollback(spt);
        }
        
    }

}