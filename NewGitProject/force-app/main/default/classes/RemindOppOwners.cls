global class RemindOppOwners implements Schedulable  {
    global void execute(SchedulableContext ctx){
        List<Opportunity> oppList =[select Id, Name, OwnerId,CloseDate from Opportunity where isClosed =False and CloseDate< Today];
        
        TaskUtils.RemindOwners();
    }
}