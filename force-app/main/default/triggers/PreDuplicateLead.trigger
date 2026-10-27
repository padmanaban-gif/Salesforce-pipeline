trigger PreDuplicateLead on Lead (before insert) {

    set<String> leadEmails = new set<String>();
    for(Lead ld : trigger.new){
        if(ld.email != Null){
            leadEmails.add(ld.email.toLowerCase());
        }
    }
    set<String> existingEmails = new set<String>();
    for(Lead ld: [select Id, Email from Lead where Email IN :leadEmails]){
        existingEmails.add(ld.Email.toLowerCase());
    }
    for(Lead ld: trigger.new){
        if(existingEmails.contains(ld.Email.toLowerCase())){
            ld.Email.addError('Email has been used in another lead');
        }
    }
}