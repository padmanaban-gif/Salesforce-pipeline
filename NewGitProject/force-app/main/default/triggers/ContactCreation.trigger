trigger ContactCreation on Account (after insert) {
    
    List<Contact> conList = new List<Contact>();
    
    for(Account acc: trigger.new){
        Contact con = new Contact();
        con.LastName = acc.Name;
        con.AccountId = acc.Id;
        conList.add(con);
    }
    insert conList;

}