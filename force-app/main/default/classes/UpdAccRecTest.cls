@isTest
public class UpdAccRecTest {
    @testSetup
    static void  setup(){
        List<Account> accList = new List<Account>();
        accList.add(new Account(Name ='Parent'));
        
        for(Integer i=0; i<100;i++){
            accList.add(new Account(Name = 'Test Account'+i));
        }
        insert accList;
    }
    @isTest
    public static void testQueueable(){
        Id parentId = [select Id from Account where Name ='Parent'][0].id;
        
        List<Account> accList = [select Id, Name from Account where Name LIKE 'Test Account%'];
        
        UpdAccRec up = new UpdAccRec(accList,parentId);
        test.startTest();
        System.enqueueJob(up);
        test.stopTest();
        
        System.assertEquals(100, [select count() from Account where parentId =: parentId]);
        
        
    }

}