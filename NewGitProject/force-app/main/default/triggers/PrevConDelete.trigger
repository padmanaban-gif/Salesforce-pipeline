trigger PrevConDelete on Contact (before delete) {
    set<id> conIds = new set<Id>();
    for(Contact cons: trigger.old){
       
            conIds.add(cons.Id);
        
    }
    Map<Id, case> existingCase = new Map<Id, Case>();
    for(Case css: [select ContactId from case where contactId IN : conIds]){
        if(!existingCase.containsKey(css.contactId)){
            existingCase.put(css.contactId, css);
        }
    }
    for(Contact con : trigger.old){
        if(existingCase.containsKey(con.Id)){
            con.addError('Cannot delete the contact with related cases');
        }
    }
    
    
    
    }