public class EmployeeTriggerHandler {
    public static void undeleteEmp(List<Employee__c> empList){/*updating employee field after undeleting the record from 
recycle bin*/
        Set<Id> accIds = new Set<Id>();
        List<Employee__c> updateEmp = new List<Employee__c>();
        if(!empList.isEmpty()){
            for(Employee__c emp:empList){
                if(emp.Active__c != null){
                    accIds.add(emp.Account__c);
                }
                Employee__c empl = new Employee__c();
                empl.Id = emp.Id;
                   empl.Active__c = true;
                updateEmp.add(empl);
            }
        }
        List<Account> accList = [Select Id,NumberOfEmployees,(SELECT ID from Employees__r) from Account where Id IN: accIds];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                acc.NumberOfEmployees = acc.Employees__r.size();
            }
        }
        if(!updateEmp.isEmpty()){
            update updateEmp;
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
    public static void ValidaingEmp(LIST<Employee__c> empList){//showing warnign message while deleting the active employee
        if(!empList.isEmpty()){
            for(Employee__c emp: empList){
                if(emp.Active__c == true){
                    emp.addError('you cant delete active employees' );
                }
            }
        }
    }
    public static void ValidaingEmpList(LIST<Employee__c> empList){/*updating the employer count  NumberOfEmployees field
based on adding and deleting*/
        Set<Id> accIds = new Set<Id>();
        if(!empList.isEmpty()){
            for(Employee__c emp: empList){
                if(emp.Account__c != null){
                    accIds.add(emp.Account__c);
                }
            }
           
        }
        List<Account> accList=[SELECT Id, NumberOfEmployees,(SELECT Id FROM Employees__r) FROM Account where Id IN: accIds];
        
        if(!accList.isEmpty()){
            for(Account acc: accList){
                acc.NumberOfEmployees = acc.Employees__r.size();          
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}