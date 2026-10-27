trigger PrCreDupLeadEmail on Lead (before insert) {
    set<String> leadEmails = new set<String>();
    for(Lead le: trigger.new){
        if(le.email != null){
            leadEmails.add(le.Email.toLowerCase());
        }
    }
    List<Contact> conList = [select Id, AccountId, Email from Contact where email IN : leadEmails];
    Map<String, Contact> newValues = new Map<String, Contact>();
    for(Contact con: conList){
        if(!newValues.containsKey(con.Email)){
            newValues.put(con.Email.toLowerCase(),con);
        }
        
    }
    for(Lead le : trigger.new){
        if(newValues.containsKey(le.Email)){
            le.Email.addError('this email has been used in another contact');
        }
    }

}