@isTest
private class AccountTriggerHandlerTest {
@isTest
    private static void AccountTriggerHandlerInsertTesting(){
        List<Account> accList = new List<Account>();
        accList = TestUtility.AccRecUpd('Test',2,false);
        for(Integer i =0;i<2;i++){
            
            accList[i].BillingCity = 'TestCity';
            accList[i].BillingCountry ='TestCountry';
            accList[i].BillingState ='TestState';
            accList[i].BillingStreet ='TestStreet';
            accList[i].BillingPostalCode='TestpostalCode';
            accList[i].CopyBillingToShipping__c=true;
            
        }
        test.startTest();//to avoid governer limits
        insert accList;
        test.stopTest();
        
        List<Account> upAccList = [SELECT Id, ShippingCountry from Account where Id =:accList[0].Id];
        System.assertEquals('TestCountry',upAccList[0].ShippingCountry);
    }
    @isTest
    private static void AccountTriggerHandlerUpdateTesting(){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<2;i++){
            Account acc =  new Account();
            acc.Name = 'TEST'+i;
            
            acc.BillingCity = 'TestCity';
            acc.BillingCountry ='TestCountry';
            acc.BillingState ='TestState';
            acc.BillingStreet ='TestStreet';
            acc.BillingPostalCode='TestpostalCode';
            accList.add(acc);
        }
        test.startTest();
        insert accList;
        for(Integer i =0;i<2;i++){
            accList[i].CopyBillingToShipping__c =true;
        }
        update accList;
        test.stopTest();
        List<Account> updatedAccList =[SELECT Id, ShippingCountry from Account where Id =: accList[0].Id];
        System.assertEquals('TestCountry',updatedAccList[0].ShippingCountry);
    }
}