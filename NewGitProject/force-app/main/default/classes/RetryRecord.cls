public class RetryRecord implements Queueable{
    List<Id> failedRecords;
    public RetryRecord(List<Id> ids){
        this.failedRecords=ids;
    }
    public void execute(QueueableContext qc){
        for(Id id : failedRecords){
        try{
            Account acc = [select Id from Account where Id =: id];
            acc.Description='Retried records';
            update acc;
        }catch(Exception e){
            
        }
        }}

}