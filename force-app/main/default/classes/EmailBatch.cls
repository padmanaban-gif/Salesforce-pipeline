public class EmailBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start (Database.BatchableContext bc){
        String query ='select Id, Email from Contact where Id IN =: conId';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<Contact> conList){
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.singleEmailMessage>();
        
        for(Contact con: conList){
            Messaging.SingleEmailMessage newEmails = new Messaging.SingleEmailMessage();
            newEmails.setToAddresses(new String[]{con.Email});
            newEmails.setSubject('Email from Salesforce');
            newEmails.setPlainTextBody('Hello '+con.LastName+'Conatct is closed');
            emails.add(newEmails);
            
        }
        Messaging.sendEmail(emails);
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Email has been sent to all closed contacts');
    }

}