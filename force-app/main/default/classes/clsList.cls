public class clsList {
    public static void newList(){
        //List<Account> accList = [select Id, name,(select id, Name from Opportunities) from Account ORDER BY NAME asc LIMIT 5];
        for(Account acc:[select Id, name,(select id, Name from Opportunities) from Account ORDER BY NAME asc LIMIT 5] ){
            System.debug('account is '+ acc.Name);
        
        for(Opportunity opp: acc.Opportunities){
            System.debug(opp.Name);
        }
        }
        
    }
}