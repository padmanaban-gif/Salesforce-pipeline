public class LeadQueueable implements Queueable {
    
    public void execute(QueueableContext qc){
        List<Lead> records = [select Id, leadsource from lead];
        
        for(Lead le: records){
            le.leadsource = 'among';
        }
        update records;
    }
    /*LeadQueueable qu = new LeadQueueable();
id job = system.enqueueJob(qu);*/

}