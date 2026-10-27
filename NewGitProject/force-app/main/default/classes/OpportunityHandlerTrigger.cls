public class OpportunityHandlerTrigger {
    
   /* public static void onAfterInsert(List<Opportunity> newList){
        Set<Id> accIds =  new Set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
        
        for(Opportunity opp: newList){
            if(opp.AccountId != null){
                accIds.add(opp.AccountId);
            }
        }
        accToBeUpdated = calculateAnnualRevenue(accIds);
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }
        }
    public static void onAfterUpdate(List<Opportunity> newList, Map<Id,Opportunity> oldMap){
        Set<Id> accIds = new Set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
        
        for(Opportunity opp: newList){
            if(opp.AccountId != null && opp.Amount != oldMap.get(opp.Id).Amount){
                accIds.add(opp.AccountId);
            }
        }
        accToBeUpdated = calculateAnnualRevenue(accIds);
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }
    }
    public static void onAfterDelete(List<Opportunity> oldList){
        Set<Id> accIds =  new Set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
        
        for(Opportunity opp: oldList){
            if(opp.AccountId != null){
                accIds.add(opp.AccountId);
            }
        }
        accToBeUpdated = calculateAnnualRevenue(accIds);
        if(accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }
    }
    public static List<Account> calculateAnnualRevenue(Set<Id> accIds){
        List<Account> accToBeUpdated =  new List<Account>();
        Map<Id,Decimal> mapToBeUpdated = new Map<Id,Decimal>();
        
        for(Opportunity opp: [select id, Amount, Accountid from Opportunity where AccountId IN : accIds]){
            Decimal total =0;
            if(mapToBeUpdated.containsKey(opp.AccountId)){
                total = mapToBeUpdated.get(opp.AccountId);
            }
            if(opp.Amount != null){
                total = total + opp.Amount;
            }
            mapToBeUpdated.put(opp.AccountId, total);
        }
        if(!mapToBeUpdated.isEmpty()){
            for(Id i: mapToBeUpdated.keySet()){
                Account acc = new Account();
                acc.Id = i;
                acc.AnnualRevenue = mapToBeUpdated.get(i);
                accToBeUpdated.add(acc);
            }
        }
        return accToBeUpdated;
}*/}