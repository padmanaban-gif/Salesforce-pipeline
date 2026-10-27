public class DeleteConsBatch implements Database.Batchable<sObject> {
    public database.QueryLocator start(Database.BatchableContext bc){
        return database.getQueryLocator ('select Id from Contact');
    }
    public void execute(Database.BatchableContext bc, List<Contact> scopee){
        delete scopee;
    }
   public void finish(Database.BatchableContext bc){
        System.debug('All contacts deleted');
    }

}