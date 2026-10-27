trigger PreOppDelVRelTask on Opportunity (before update) {
    set<Id> accIds = new set<Id>();
    for(Opportunity opp: trigger.new){
        if(opp.stageName !='Closed Won' || opp.stageName =='Closed Lost'){
            accIds.add(opp.id);
}
    }
    List<Task> openTask =[select Id, whatId, status from Task where whatId IN : accIds and status !='Completed'];
     Map<Id, Task> existingTask = new Map<Id, Task>();
    for(Task ts: openTask){
        if(!existingTask.containsKey(ts.whatId)){
            existingTask.put(ts.whatId, ts);
        }
    }
    for(Opportunity opp: trigger.new){
        if(existingTask.containsKey(opp.Id)){
            opp.StageName.addError('This record cannot be closed first close the pending task');
        }
    }
}