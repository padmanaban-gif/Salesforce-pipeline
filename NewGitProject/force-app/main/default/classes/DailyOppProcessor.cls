public class DailyOppProcessor implements Schedulable{
    public void execute(SchedulableContext ctx){
        List<Opportunity> oppList = [select Id, LeadSource from Opportunity where LeadSource = null limit 200];
        
        for(Opportunity opp: oppList){
        opp.LeadSource = 'Web';
        }
        if(!oppList.isEmpty()){
            update oppList;
        }
    }

}