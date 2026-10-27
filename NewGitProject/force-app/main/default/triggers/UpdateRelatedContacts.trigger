trigger UpdateRelatedContacts on Account (after update,after insert) {
    if(trigger.isAfter && trigger.isUpdate){
        Set<Id> accIds = new Set<Id>();
        for(Account acc: trigger.new){
            Account oldRec = trigger.oldMap.get(acc.id);
            if(acc.BillingStreet != oldRec.BillingStreet || acc.BillingState != oldRec.BillingState ||
               acc.BillingCountry != oldRec.BillingCountry){
                   accIds.add(acc.Id);
               }
        }
        if(!accIds.isEmpty()){
            List<Account> accList = [select Id, BillingStreet, BillingState, BillingCountry,
                                    (select Id, MailingStreet, MailingState,MailingCountry from Contacts)
                                    from Account where Id IN :accIds];
            
            List<Contact> conList = new List<Contact>();
            for(Account acc:accList ){
                for(Contact con: acc.Contacts){
                    con.MailingStreet = acc.BillingStreet;
                    con.MailingState = acc.BillingState;
                    con.MailingCountry = acc.BillingCountry;
                    conList.add(con);
                }
            }
            update conList;
            
        }
    }

}