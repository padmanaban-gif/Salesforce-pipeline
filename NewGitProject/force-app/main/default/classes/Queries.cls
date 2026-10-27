public class Queries {
    public static void example(){
        /*//SELECT Id,FirstName, LastName, Account.name FROM Contact WHERE Phone != null//child to parent query
        //SELECT Id,Name ,(SELECT Id, FirstName FROM Contacts) FROM Account LIMIT 10//parent to child query
        List<Account> accList = [SELECT Id,Name FROM Account];
        List<Opportunity> oppList =[SELECT Id, Name, CloseDate FROM Opportunity];
        //null check
        if(accList.size() > 0){
            System.debug('list is not empty');
        }
        if(!oppList.isEmpty()){
            System.debug('opp is not empty');
        }
        //checking account count
        Integer count = [SELECT count() FROM Account];
        System.debug('account count is'+count);
        List<Account> acList = [SELECT Id,Name ,(SELECT Id, FirstName FROM Contacts) FROM Account LIMIT 10];
        /*for(Account ac:acList){
        System.debug(ac);
        }
        //alternate way
        for(Account bcc:[SELECT Id, Name FROM Account Limit 10]){
            System.debug(bcc);
        }*/
        //-------------------------------------End of SOQL Query---------------------------------
        //-------------------------------------SOSL Query----------------------------------------
        
        /*List< Contact> conList = [SELECT ID, FirstName, Phone, Account.Phone FROM Contact where AccountId != null];//standard object
        if(!conList.isEmpty()){
            for(Contact con: conList){
                con.Phone = con.Account.Phone;
            }
            
        }
        if(!conList.isEmpty()){
            update conList;
        }
    }*/
       List<Employee__c> empList = [SELECT ID, Name__c, Phone__c, Account__r.Phone FROM Employee__c Where Account__c != null];//custom field and custom object
        if(!empList.isEmpty()){
            for(Employee__c emp: empList){
                emp.Phone__c = emp.Account__r.Phone;
            }
        }
        if(!empList.isEmpty())
            update empList;
        System.debug(empList);
    }}