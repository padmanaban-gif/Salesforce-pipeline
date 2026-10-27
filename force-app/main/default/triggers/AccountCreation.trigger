trigger AccountCreation on Account (after insert) {
    List<Create_Account__e> newAccs = new List<Create_Account__e>();
    
    for(Account acc: trigger.new){
        Create_Account__e cre = new Create_Account__e();
        cre.Record_Id__c = acc.Id;
        cre.Record_Name__c = acc.Name;
        newAccs.add(cre);
    }
    Database.saveResult[] results = EventBus.publish(newAccs);

}