public class LeadBatch implements Database.Batchable <SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select Id, Leadsource from Lead');
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        for(Lead le : scope){
            le.leadsource = 'old';
        }
        update scope;
    }
    /*
     * LeadBatch instance = new LeadBatch();
Database.executeBatch(instance);*/
    
    public void finish(Database.BatchableContext bc){
        System.debug('Hello');
    }

}