trigger PrevDupConemailOnAcc on Contact (before insert) {
  set<String> conEmails = new set<String>();
    set<Id> accIds = new set<Id>();
    for(Contact con: trigger.new){
        if(con.AccountId != Null && con.Email != Null){
            conEmails.add(con.Email.toLowerCase());
            accIds.add(con.AccountId);
        }
    }
    List<Contact> conList = [select Id,Accountid, Email from Contact where Email IN : conEmails and AccountId IN : accIds];
    set<String> oldEmails = new set<String>();
    for(Contact con:conList ){
        oldEmails.add(con.Email.toLowerCase());
    }
    for(Contact con : trigger.new){
        if(oldEmails.contains(con.Email.toLowerCase())){
            con.Email.addError('Enter new email address');
        }
    }
}