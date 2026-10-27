//preventing crearing th lead record with duplicate email
trigger PrDuLeadEmail on Lead (before insert) {
    Set<String> emails = new Set<String>();
    for(Lead le : trigger.new){
        if(le.Email != null){
            emails.add(le.Email.toLowerCase());
        }
    }
    List<Lead> existingEmails = [select Id, Email from Lead where Email IN : emails];
    set<String> newEmails = new Set<String>();
    for(Lead ls : existingEmails){
        if(!newEmails.contains(ls.Email)){
        newEmails.add(ls.Email.toLowerCase());
        }}
    for(Lead ld : trigger.new){
        if(newEmails.contains(ld.Email.toLowerCase())){
            ld.addError('Email is already there in another lead');
        }
    }

}