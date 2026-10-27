trigger PrDupLeadBaesOnEmail on Lead (before insert) {
  set<String> emails = new set<String>();
    for(Lead le : trigger.new){
        if(le.Email != Null){
            emails.add(le.Email.toLowerCase());
        }
    }
    List<Contact> conEmails = [select Id, AccountId, Email from Contact where Email IN : emails];
    Map<String,Contact> existingEmails = new Map<string,contact>();
    for(Contact con: conEmails){
        if(!existingEmails.containsKey(con.Email)){
            existingEmails.put(con.Email.toLowerCase(),con);
        }
    }
    for(Lead ldS : trigger.new){
        if(existingEmails.containsKey(lds.Email.toLowerCase())){
            ldS.Email.addError('Pleasr create lead with new email this email has been used already in a different Contact');
        }
    }
}