public class NewAccRec {
    
    public static void craeteNewAccRec(){
        List<Account> accList = new List<Account>();
        
        for(Account acc:accList){
            acc.Name = 'jaya123';

            accList.add(acc);
        }
        update accList;
    }

}