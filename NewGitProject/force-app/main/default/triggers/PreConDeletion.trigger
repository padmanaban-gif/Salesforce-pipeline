//preventing the active contact to be deleted
trigger PreConDeletion on Contact (before delete) {
    
    //List<Contact> activeCons = [select Id, Active__c from Contact where Active__c=true];
    for(Contact con: trigger.old){
        if(con.Active__C){
        
            con.addError('You cant delete active contact');
        
    }
    }
}