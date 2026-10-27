trigger AssignLeadToUser on Lead (before insert) {
    
    User assigneeUser =[select Id from User where profile.Name = 'Web Lead' limit 1];
    
    for(Lead ld : trigger.new){
        if(ld.LeadSource =='Web'){
            ld.OwnerId = assigneeUser.Id;
        }
    }
}