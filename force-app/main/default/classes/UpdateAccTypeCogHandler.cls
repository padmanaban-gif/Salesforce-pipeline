public class UpdateAccTypeCogHandler {
    public static void updateAccType(List<Opportunity> opps, Map<Id, Opportunity> oldMap){
        set<Id> accIds = new set<Id>();
        for(Opportunity opp: opps){
            Opportunity oldStage = oldMap.get(opp.Id);
            if(opp.AccountId != Null && opp.stageName != oldStage.StageName && opp.stageName =='Closed Won' ){
                accIds.add(opp.AccountId);
            }
        }
        List<Account> accList = [select Id, Type from Account where Id IN : accIds];
        for(Account acc: accList){
            acc.Type = 'Customer - Direct';
        }
        update accList;
    }

}