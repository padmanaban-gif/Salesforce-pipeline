trigger CraeTaskBasedOnOppAmount on Opportunity (after insert) {
    
    List<Task> taskToCreate=  new List<Task>();
    for(Opportunity opp: trigger.new){
        if(opp.Amount > 10000){
            taskToCreate.add(new Task(WhatId = opp.Id, subject ='Priority task', status = 'Inprogress',
                                        priority='High'));
        }
    }
    Insert taskToCreate;

}