trigger PreConCreation on Contact (before insert) {
    set<String> conEmails = new set<String>();
    for(Contact con: trigger.new){
        if(con.Email != Null){
            conEmails.add(con.Email.toLowerCase());
        }
    }
    //List<Contact> oldEmails = [select Id, Email from Contact where Email IN : conEmails];
    set<String> duplicateEmails = new set<String>();
    for(Contact con : [select Id, Email from Contact where Email IN : conEmails]){
        if(!duplicateEmails.contains(con.Email.toLowerCase())){
            duplicateEmails.add(con.Email.toLowerCase());
        }
    }
   
    for(Contact con: trigger.new){
        if(duplicateEmails.contains(con.Email.toLowerCase())){
            con.Email.addError('duplicate email found');
        }
    }

}