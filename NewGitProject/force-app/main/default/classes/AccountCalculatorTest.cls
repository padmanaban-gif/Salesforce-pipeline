@isTest
public class AccountCalculatorTest {
    @isTest
    public static void countAcc(){
        List<Account> accList = new List<Account>();
        for(Integer i =0;i<250;i++){
            Account acc = new Account(Name ='Test'+i);
            accList.add(acc);
        }
        insert accList;
        
        List<Contact> conList = new List<Contact>();
        List<Id> accIds =  new List<id>();
        for(Account acc: accList){
            Contact con =  new Contact(FirstName ='Test',LastName = acc.Name, AccountId = acc.Id);
            conList.add(con);
            accIds.add(acc.Id);
        }
        insert conList;
        
        Test.startTest();
        AccountCalculator.countCon(accIds);
        Test.stopTest();
        
        List<Account> accc = [select Id,No_of_cons__c from Account];
        System.assertEquals(1, accc[0].No_of_cons__c,'records are not counted');
    }

}