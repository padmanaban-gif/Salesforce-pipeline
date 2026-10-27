public class CognizantPractice {
    public static void getRealCons(List<Opportunity> opps){
        set<Id> accIds = new set<Id>();
        for(Opportunity opp : opps){
            if(opp.AccountId != Null){
                accIds.add(opp.AccountId);
            }
        }
        Map<Id,Account> accList =new Map<Id, Account>([select Id, Name from Account where ID IN : accIds]);
    }

}