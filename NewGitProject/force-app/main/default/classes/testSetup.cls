@isTest
public class testSetup {//using one method values in diff method
    @testSetup
    static void setup(){//this setup method values will be available for another methods as well
        List<Account> accList =  new List<Account>();
        for(Integer i=0;i<2;i++){
            accList.add(new Account(Name='Test'+i));
        }
        insert accList;
    }
    @isTest
    static void testMethodd()
    {
        List<Account> accList =  [SELECT Id, Phone from Account where Name = 'Test0'Limit 1];
        accList[0].Phone = '23746847';
        update accList[0];
        
        List<Account> acc = [SELECT Id, Phone from account where Name ='Test1' Limit 1];
        delete acc[0];
    }
    @isTest
    static void method2(){
        List<Account> accList = [SELECT Id, Phone from Account where Name ='Test0' Limit 1];
        System.assertEquals('23746847',accList[0].Phone);
        List<Account> acc =[SELECT Id, Phone from Account where Name='Test1' Limit 1];
        System.assertEquals(null,acc[0].Phone);
    }
    

}