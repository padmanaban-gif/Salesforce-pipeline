trigger CreateRelTaskToOppo on Opportunity (before update,after insert) {
    List<Task> taskList = new List<Task>();
    
    for(Opportunity opp: trigger.new){
        Task ts = new Task();
        ts.subject = 'New Task';
        ts.Status = 'Not started';
        ts.Priority = 'Normal';
        ts.WhatId = opp.Id;
        taskList.add(ts);
    }
    insert taskList;
    
    if(trigger.isBefore &&trigger.isUpdate ){
        Set<Id> oppIds = new Set<Id>();
        for(Opportunity opp: trigger.new){
            Opportunity oldStage = trigger.oldMap.get(opp.Id);
            if(opp.StageName != oldStage.StageName){
                oppIds.add(opp.Id);
            }
        }
        Map<Id, Boolean> oppHasTask = new Map<Id, Boolean>();
        List<Task> nonClosedTask = [select Id, whatId, status from Task where whatId IN : oppIds and status !='Completed'];
        for(Task ts: nonClosedTask){
            oppHasTask.put(ts.whatId, true);
        }
        for(Opportunity opp: trigger.new){
            if(oppHasTask.containsKey(opp.Id)){
                opp.StageName.addError('you cant change the stagename');
            }
        }
        
    }
    


}