trigger PlatformEventTrigger on Account (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        for(Account acc: trigger.new){
            Create_Account__e accs = new Create_Account__e();
            accs.Record_Id__c = acc.Id;
            accs.Record_Name__c = acc.Name;
            Eventbus.publish(accs);
        }
        
    }

}