@isTest
public class OpProcTest {
@isTest
    private static void testBatchClass(){
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i =0;i<200;i++){
            oppList.add(new Opportunity(Name = 'Tets'+i, StageName='Prospecting',CloseDate = System.today()));
        }
        insert oppList;
        
        Test.startTest();
        OpProc op = new OpProc();
        Id batchId = Database.executeBatch(op,200);
        Test.stopTest();
        
        List<Opportunity> opp = [select Id from Opportunity where LeadSource ='Web'];
        System.assertEquals(200,opp.size());
    }
}