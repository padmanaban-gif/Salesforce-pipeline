trigger DuplicateEmail on Lead (before insert) {
    Set<Id> ids = new Set<Id>();
    for(Lead l: trigger.new){
        if(l.Email != null){
            ids.add(l.email);
        }
    }
    Map<String, Lead> existing = new Map<String, Lead>();
    for(Lead l: [select Id, Email from Lead where Id IN: ids]){
        existing.put(l.Email,l);
    }
    for(Lead l: trigger.new){
        if(l.Email != null && existing.containsKey(l.Email)){
            l.Email.addError('Cannot create lead with same email Id');
        }
    }

}