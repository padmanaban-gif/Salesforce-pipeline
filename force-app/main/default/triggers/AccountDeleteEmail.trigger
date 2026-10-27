trigger AccountDeleteEmail on Account (after delete,after undelete) {
    if(trigger.isAfter && trigger.isDelete){
        List<Messaging.SingleEmailMessage> sendMails = new List<Messaging.SingleEmailMessage>();
        
        for(Account acc: trigger.old){
            Messaging.SingleEmailMessage newEmail = new Messaging.SingleEmailMessage();
            
            List<String> emailAddresses = new List<String>();
            emailAddresses.add(UserInfo.getUserEmail());
            newEmail.setToaddresses(emailAddresses);
            newEmail.setSubject('Account deleted successfully');
            newEmail.setPlainTextBody('Hello'+acc.Name+'\n\n'+'Account has been deleted successfully');
            sendMails.add(newEmail);
        }
        if(!sendMails.isEmpty()){
            Messaging.sendEmail(sendMails);
        }
    }
    if(trigger.isAfter && trigger.isUndelete){
        List<Messaging.SingleEmailMessage> sendMails = new List<Messaging.SingleEmailMessage>();
        
        for(Account acc: trigger.new){
            Messaging.SingleEmailMessage newEmail = new Messaging.SingleEmailMessage();
            
            List<String> emailAddresses = new List<String>();
            emailAddresses.add(UserInfo.getUserEmail());
            newEmail.setToaddresses(emailAddresses);
            newEmail.setSubject('Account retrived successfully');
            newEmail.setPlainTextBody('Hello'+acc.Name+'\n\n'+'Account has been retrived successfully');
            sendMails.add(newEmail);
        }
        if(!sendMails.isEmpty()){
            Messaging.sendEmail(sendMails);
        }
    }

}