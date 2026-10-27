//checking the lead email and throw an error if email is already present in another contact
trigger CheckLeadEmail on Lead (before insert, before update) {
    
    Set<String> leadEmails = new Set<String>();
    for(Lead le : trigger.new){
        if(le.Email != NULL){
            leadEmails.add(le.Email.toLowerCase());
        }
    }
    List<Contact> exisitingEmails =[select Id, AccountId, Email from Contact where Email IN : leadEmails];
    Map<String,Contact> accToUpdate = new Map< String,Contact>();
    for(Contact con:exisitingEmails ){
        //if(!accToUpdate.containsKey(con.Email)){
            accToUpdate.put(con.Email.toLowerCase(),con);
        
    }
    for(Lead ld : trigger.new){
        if(accToUpdate.containsKey(ld.Email)){
            ld.addError('Email is already there in another contact please check contact records');
        }
    }

}