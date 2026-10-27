trigger PreDupLeadEmai on Lead (before insert) {
    
    Set<string> existingEmails = new Set<String>();
    
    for(Lead le : trigger.new){
        if(le.Email != null){
            existingEmails.add(le.Email.toLowerCase());
        }
    }
    Map<String, Contact> existingConsWithSameEmail = new Map<String, Contact>();
    List<Contact> newConList = [select Id, AccountId, Email from Contact where Email LIKE :existingEmails];
    for(Contact con:newConList ){
        //if(!existingConsWithSameEmail.containsKey(con.Email)){
            existingConsWithSameEmail.put(con.Email.toLowerCase(), con);
       // }
    }
    for(Lead le :trigger.new){
        if(existingConsWithSameEmail.containsKey(le.Email)){
            le.addError('Email is already present in another contact');
        }
    }

}