public class ScheduledReport implements schedulable {
    public void execute(SchedulableContext sc){
        List<Opportunity> opps = [select Id, Name, stageName, closeDate from Opportunity 
                                 where closeDate = Last_Month and stageName='Closed won'];
        Messaging.singleEmailMessage email = new Messaging.singleEmailMessage();
        email.setToAddresses(new String[]{'padmanabanpr865@gmail.com'});
        email.setSubject('Closed opportunites');
        email.setPlainTextBody('Number of closed opportunittes'+opps.size());
        Messaging.sendEmail(new Messaging.singleEmailMessage[]{email});
        
    }

}