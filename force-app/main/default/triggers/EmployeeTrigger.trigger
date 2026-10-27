trigger EmployeeTrigger on Employee__c (before delete, after delete, after undelete) {
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            EmployeeTriggerHandler.ValidaingEmp(Trigger.Old);
        }else if(Trigger.isAfter){
            EmployeeTriggerHandler.ValidaingEmpList(Trigger.Old);
        }
    }
    if(Trigger.isUndelete){
        EmployeeTriggerHandler.undeleteEmp(Trigger.new);
    }
       
}