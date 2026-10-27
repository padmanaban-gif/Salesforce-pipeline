trigger PrDuEmailofLeadandCon on Lead (before insert,before update) {
    Set<String> emails = new Set<String>();
    
    for(Lead le : trigger.new){
        if(le.Email != null){
            emails.add(le.Email.toLowerCase());
        }
    }
    
    Map<String, Contact> ConsToUpdate = new Map<String, contact>();
    List<Contact> existingCons = [select Id, Email from Contact where Email IN : emails];
    for(Contact cons : existingCons){
        ConsToUpdate.put(cons.Email.toLowerCase(), cons);
    }
    
    for(Lead les: trigger.new){
        if(les.Email != null && ConsToUpdate.containsKey(les.Email.toLowerCase())){
            les.addError('Email is already there');
        }
    }

}