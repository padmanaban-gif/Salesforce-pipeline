trigger AutoCaseUpdate on Case (before insert,before update) {
    
    for(Case cs :trigger.new){
        if(cs.Status =='Escalated'){
            cs.Priority = 'High';
        }
    }

}