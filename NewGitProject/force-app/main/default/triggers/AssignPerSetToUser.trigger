trigger AssignPerSetToUser on User (after insert) {
    
    Permissionset ps =[select Id, Name from Permissionset where Name ='Sales_User'];
    
    List<PermissionSetAssignment> assignee = new List<PermissionSetAssignment>();
    for(User us: trigger.new){
        if(us.Department =='Sales'){
            assignee.add(new PermissionSetAssignment(AssigneeId = us.Id, permissionsetId = ps.Id));
        }
    }
    insert assignee;
    

}