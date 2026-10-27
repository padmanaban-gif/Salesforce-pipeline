trigger CreateRelTaskToOpp on Opportunity (after insert) {
    
    List<Task> taIds = new List<Task>();
    
    for(Opportunity opp: trigger.new){
        Task newTask = new Task();
        newTask.WhatId = opp.Id;
        newTask.OwnerId = opp.OwnerId;
        newTask.ActivityDate = Date.Today().addDays(3);
        newTask.Subject = 'Email';
        newTask.Status = 'In Progress';
        taIds.add(newTask);
    }
    if(!taIds.isEmpty()){
        insert taIds;
    
    }}