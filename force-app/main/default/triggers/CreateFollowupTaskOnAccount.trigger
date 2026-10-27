trigger CreateFollowupTaskOnAccount on Opportunity (after update) {
    List<Task> taskList = new List<Task>();
    for(Opportunity opp : trigger.new){
        Opportunity opps = trigger.oldMap.get(opp.Id);
        if(opp.AccountId != Null && opp.StageName =='Closed Won' && opp.StageName != opps.StageName){
            Task tsk = new Task();
            tsk.whatId = opp.AccountId;
            tsk.activityDate = Date.today().addDays(7);
            tsk.priority = 'Medium';
            tsk.status ='Not Started';
            taskList.add(tsk);
        }
    }
    insert taskList;
}