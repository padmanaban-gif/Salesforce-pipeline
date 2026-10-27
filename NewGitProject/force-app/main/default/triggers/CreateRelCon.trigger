trigger CreateRelCon on Account (after insert) {
    
    List<Contact> conList = new List<contact>();
    for(Account acc: trigger.new){
        Contact con = new contact();
        con.LastName = acc.Name;
        con.AccountId = acc.Id;
        conList.add(con);
    }
    insert conList;

}