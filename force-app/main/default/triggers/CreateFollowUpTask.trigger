trigger CreateFollowUpTask on Opportunity (after insert, after update) {
    //set<Id> oppIds = new set<Id>();
    if(trigger.isAfter && trigger.isInsert){
    List<Task> followUpTask = new List<Task>();
    for(Opportunity opp: trigger.new){
        if(opp.stageName =='Closed Won'){
            Task ts = new Task();
            ts.whatId =opp.Id;
            ts.OwnerId =opp.OwnerId;
            ts.ActivityDate = Date.today().addDays(7);
            ts.status ='Not Started';
            ts.Priority= 'Medium';
            followUpTask.add(ts);
        }
    }
    insert followUpTask;
    }
    if(trigger.isAfter && trigger.isUpdate){
        List<Task> followUpTask = new List<Task>();
        for(Opportunity opp: trigger.new){
            opportunity oldStage = trigger.oldMap.get(opp.id);
            if(opp.stageName =='Closed Won' && opp.StageName != oldStage.StageName){
                Task ts = new Task();
            ts.whatId =opp.Id;
            ts.OwnerId =opp.OwnerId;
            ts.ActivityDate = Date.today().addDays(3);
            ts.status ='Not Started';
            ts.Priority= 'Low';
            followUpTask.add(ts);
            }
        }
        insert followUpTask;
    }
}