public class OpProc implements Database.Batchable<sObject>, Database.stateful {
     public Integer recordCount = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id,Name from Opportunity]);
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> opp){
        for(Opportunity op: opp){
            op.LeadSource = 'Web';
        }
        update opp;
        recordCount = recordCount + opp.size();
    }
    public  void finish(Database.BatchableContext bc){
        System.debug('all records are processed' + recordCount);
    }
}