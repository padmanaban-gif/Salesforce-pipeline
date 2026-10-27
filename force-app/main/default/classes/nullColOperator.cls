public class nullColOperator {
    public static void updOppDes(){
        List<Opportunity> opps = [select Id, Name, Description, Account.website from Opportunity];
        for(Opportunity opp: opps){
            opp.description = opp.Account.website?? 'no website';
        }
        update opps;
    }
}