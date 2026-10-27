public class UpdAccRec implements Queueable {
    private List<Account> accList;
    Private Id parentAccId;
    
    public UpdAccRec(List<Account> accRecords, Id id){
        this.accList = accRecords;
        this.parentAccId = Id;
    }
    
    public void execute(QueueableContext con){
        for(Account acc: accList){
            acc.ParentId = parentAccId;
        }
        update accList;
    }

}