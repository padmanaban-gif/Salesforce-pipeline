public class Implement {
    //implementing sObject, loop, collection and DML
    //creating opportunity to accouts those are craeted this week.
    public static void createOpp(){
        /*List<Account> accList = [SELECT Id,  Name FROM Account WHERE CreatedDate = This_Week];
        List<Opportunity> Opp = new List<Opportunity>();//LIST AND sObjest
        if(!accList.isEmpty()){
            for(Account acc:accList){//loop
                Opportunity oppt = new Opportunity();
                oppt.Name = acc.Name;
                oppt.CloseDate = System.today();
                oppt.StageName = 'corresponding';
                oppt.AccountId = acc.Id;
                Opp.add(oppt);
            }
        }
        if(!Opp.isEmpty()){
            insert Opp;//dml
        }*/
        List<Account> accList1 = [SELECT Id,  Name FROM Account WHERE CreatedDate = This_Week];
        List<Opportunity> Oppt2 = new List<Opportunity>();
        if(!accList1.isEmpty()){
            for(Account acc:accList1){
                Opportunity opp2 = new Opportunity();
                opp2.Name = acc.Name;
                opp2.CloseDate=System.today();
                opp2.StageName = 'main';
                opp2.AccountId = acc.Id;
                Oppt2.add(opp2);
            }
        }
        if(!Oppt2.isEmpty())
            insert Oppt2;
    }

}