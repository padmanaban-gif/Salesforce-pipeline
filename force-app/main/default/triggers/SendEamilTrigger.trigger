trigger SendEamilTrigger on Contact (after insert,after update) {
    //if(Trigger.isBefore && Trigger.isUpdate){
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        //List<Contact> conList = [select id, Name, Email from Contact];
        for(Contact con : Trigger.new){
            if(con.Email != null){
                Messaging.SingleEmailMessage singleMail = new Messaging.SingleEmailMessage();
                singleMail.setTargetObjectId(con.Id);
                singleMail.setHTMLBody('Hello'+ con.Name);
                singleMail.setTreatTargetObjectAsRecipient(True);
                
                List<String> emailList = new List<String>();
                emailList.add(con.Email);
                singleMail.setToAddresses(emailList);
                emails.add(singleMail);
                
            }}
        }