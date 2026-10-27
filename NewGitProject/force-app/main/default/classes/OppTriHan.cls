public class OppTriHan {
    /*public static void updateAnu(List<Opportunity> oppList){
        Set<Id> accIds = new Set<Id>();
        if(!oppList.isEmpty()){
            for(Opportunity opp: oppList){
                if(opp.AccountId != null){
                    accIds.add(opp.AccountId);
                }
            }
        }
        List<Account> accList =[SELECT Id, AnnualRevenue,(SELECT Id, Amount from Opportunities) from Account where Id IN: accIds];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                Decimal total = 0;
                for(Opportunity opp:acc.Opportunities)
                {
                    total = total + opp.Amount;
                }
                acc.AnnualRevenue = total;
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }*/
        public static void updateAnu(List<Opportunity> oppList, Map<Id, Opportunity> oldMap){
        Set<Id> accIds = new Set<Id>();
        if(!oppList.isEmpty()){
            for(Opportunity opp: oppList){
                if((oldMap != null && opp.AccountId != null) || (oldMap != null && opp.AccountId != null &&
                                                                opp.Amount != oldMap.get(opp.Id).Amount)){
                    accIds.add(opp.AccountId);
                }
            }
        }
        List<Account> accList =[SELECT Id, AnnualRevenue,(SELECT Id, Amount from Opportunities) from Account where Id IN: accIds];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                Decimal total = 0;
                for(Opportunity opp:acc.Opportunities)
                {
                    total = total + opp.Amount;
                }
                acc.AnnualRevenue = total;
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    
    }

}