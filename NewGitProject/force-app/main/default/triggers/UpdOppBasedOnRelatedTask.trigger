trigger UpdOppBasedOnRelatedTask on Task (after insert) {
    set<Id> accIds = new set<id>();
    for(Task ts : trigger.new){
        if(ts.whatId != Null && ts.status =='Completed'){
            accIds.add(ts.whatId);
        }
    }
    Map<Id, Integer> taskCount = new Map<Id, Integer>();
    List<task> oppList =[select WhatId, status from task where WhatId IN : accIds and status='Completed'];
    for(task opps: oppList){
        if(!taskCount.containsKey(opps.WhatId)){
            taskCount.put(opps.WhatId, 0);
        }
        taskCount.put(opps.whatId,taskCount.get(opps.whatId)+1 );
    }
    List<Opportunity> oppss = new List<opportunity>();
    for(Id ids :taskCount.keySet() ){
        Integer count = taskCount.get(ids);
        if(count >=3){
            oppss.add(new Opportunity(Id = ids, Approval_Status__c ='Approved'));
        }
        
    }
    update oppss;
    
}