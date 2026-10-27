trigger RelatedAccountContact on Account (after insert) {
    if(trigger.isAfter && trigger.isInsert){
    List<Contact> consList = new List<Contact>();
    for(Account acc: trigger.new){
        Contact con = new Contact();
        con.LastName = acc.Name;
        con.Phone = acc.Phone;
        con.AccountId = acc.Id;
        consList.add(con);
    }
    insert consList;
    }

}