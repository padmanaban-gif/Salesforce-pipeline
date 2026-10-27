public class LeadScgedulable implements Schedulable{
    
    public void execute(SchedulableContext sc){
        List<Lead> acc = [select id, leadsource from Lead];
        for(lead l : acc){
            l.leadsource = 'back';
        }
        update acc;
    }

}