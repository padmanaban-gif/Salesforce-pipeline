public class sObj {
    public static void method(){
        List<Account> accList = [SELECT Id, Name, Phone FROM Account Limit 5];
        Set<Id> accIds = new Set<Id>();
        Map<Id,Account> accIdToAccountMap = new Map<Id, Account>();
        if(!accList.isEmpty()){
        for(Account acc: accList){//for each loop
            accIds.add(acc.Id);
        }}
        if(!accList.isEmpty()){
            for(Account acc: accList){
               accIdToAccountMap.put(acc.Id,acc);
            }
        }
        System.debug('List values'+accList);
       System.debug('Set values'+accIds);
        System.debug('Map values'+accIdToAccountMap);
    }
}