public class BulkRecordSchedulable implements schedulable {
    public void execute(SchedulableContext sc){
        system.enqueueJob(new BulkRecordQueueable());
    }

}