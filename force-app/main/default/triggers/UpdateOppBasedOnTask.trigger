//prevent opportunity closure if there is related task in pending state and update the opportunities if all the related
//tasks are completed
trigger UpdateOppBasedOnTask on Opportunity (before update) {
    Set<Id> oppIds = new Set<Id>();
    
    for(Opportunity opp: trigger.new){
        Opportunity oldOpp = trigger.oldMap.get(opp.Id);
        if(opp.StageName != oldOpp.stageName &&(opp.stageName =='Closed Won' || opp.stageName=='Closed Lost')){
            oppIds.add(opp.Id);
        }
    }
    Map<Id, List<Task>> taskList = new Map<Id, List<Task>>();
    List<Task> existingTask = [select Id, whatId, status from Task where whatId IN : oppIds and status != 'Completed'];
    for(Task opps: existingTask){
        if(!taskList.containsKey(opps.whatId)){
            taskList.put(opps.whatId, new List<Task>());
        }
        taskList.get(opps.whatId).add(opps);
    }
    for(Opportunity opp: trigger.new){
        if(oppIds.contains(opp.Id)){
            if(taskList.containsKey(opp.Id)){
                opp.addError('Cannot close the opportunity check the related pending task');
            }else{
                opp.StageName = 'Closed  Won';
            }
        }
    }

}