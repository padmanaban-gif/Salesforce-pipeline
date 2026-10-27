trigger PrCloOppRelPenTask on Opportunity (before update) {
    set<Id> oppIds = new set<id>();
    for(Opportunity opp: trigger.new){
        Opportunity oldStage = trigger.oldMap.get(opp.Id);
        if(opp.stageName != oldStage.StageName &&( opp.stageName != 'Closed Won' || opp.stageName!='Closed Lost')){
            oppIds.add(opp.Id);
        }
    }
    List<Task> pendingTaskList =[select Id, whatId, status from task where whatId IN : oppIds and status!='Completed'];
    Map<Id, Task> taskList = new Map<Id, Task>();
    for(Task ts:pendingTaskList ){
        if(!taskList.containsKey(ts.whatId)){
            taskList.put(ts.whatId, ts);
        }
    }
    for(Opportunity opp:trigger.new){
        if(taskList.containsKey(opp.Id)){
            opp.StageName.addError('Please close pending task before closing this opportunity');
        }
    }
    

}