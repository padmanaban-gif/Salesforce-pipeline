//Need to throw an error when try to close the opp if it has related pending task
trigger PreCloOppIfThereRelPendingTask on Opportunity (before update) {
    Set<Id> oppIds = new Set<Id>();
    for(Opportunity opp: trigger.new){
        Opportunity oldStage = trigger.oldMap.get(opp.Id);
        if(opp.stageName != oldStage.stageName && (opp.stageName =='Closed Won' || opp.stageName=='Closed Lost')){
            oppIds.add(opp.Id);
        }
    }
    List<Task> taskList = [select Id,whatId, status from Task where whatId IN : oppIds and status !='Completed'];
    Map<Id, List<Task>> tasksToCheck = new Map<Id, List<Task>>();
    for(Task ts: taskList){
        if(!tasksTocheck.containsKey(ts.whatId)){
            tasksTocheck.put(ts.whatId, new List<Task>());
        }
    }
    for(Opportunity opp: trigger.new){
        if(tasksTocheck.containsKey(opp.Id)){
            opp.StageName.addError('Please close the pending task before closing this opportuntiy');
        }
        opp.StageName = 'Closed Won';
    }

}