//Preventing Duplicate email on Lead if contact already has the same email
trigger PreDupLeadBasedOnConEmail on Lead (before insert, before update) {
    set<String> leadEmails = new set<String>();
    for(Lead le : trigger.new){
        if(le.Email != Null){
            leadEmails.add(le.Email.toLowerCase());
        }
    }
    List<Contact> conList = [select Id, Name, Email from Contact where Email IN : leadEmails ];
    Map<String, Contact> existingCons = new Map<String, Contact>();
    for(Contact con: conList)
    {
        if(!existingCons.containsKey(con.Email)){
            existingCons.put(con.Email.toLowerCase(),con);
        }
    }
    for(Lead le : trigger.new){
        if(existingCons.containsKey(le.Email)){
            le.Email.addError('This email has been already registered with another contact');
        }
    }

}