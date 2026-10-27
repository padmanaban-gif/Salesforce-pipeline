public class updateRelatedContacts implements Queueable{
    private List<Id> accIds;
    public updateRelatedContacts(List<Id> Ids){
        this.accIds = Ids;
    }
    public void execute(QueueableContext qc){
        List<Contact> cons =[Select Id, Description from Contact where AccountId IN :accIds];
        for(Contact con: cons){
            con.Description = 'Hnadled by VIP';
        }
        update cons;
    }

}