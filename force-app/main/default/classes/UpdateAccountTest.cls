@isTest
private class UpdateAccountTest {
@isTest
    private static void updateAccountTes(){
        Account acc1 = new Account();
        acc1.Name = 'tes account';
        acc1.Rating ='Hot';
        insert acc1;
        
        Contact con1 = new Contact();
        con1.FirstName ='TEST';
        con1.LastName ='TEST';
        con1.AccountId = acc1.Id;
        insert con1;
        
        UpdateAccount obj1 = new UpdateAccount();
        obj1.updateAccRec();
        
        List<Account> accList = [SELECT Id, Rating FROM Account where Id =: acc1.id];
        System.assertEquals('Cold',accList[0].Rating);
    }
}