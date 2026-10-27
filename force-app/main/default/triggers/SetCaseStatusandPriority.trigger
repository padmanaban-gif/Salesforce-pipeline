trigger SetCaseStatusandPriority on Case (before insert) {
    
    for(Case css: trigger.new){
        if(css.Origin =='Email'){
            css.status = 'New';
            css.Priority = 'Medium';
        }
    }

}