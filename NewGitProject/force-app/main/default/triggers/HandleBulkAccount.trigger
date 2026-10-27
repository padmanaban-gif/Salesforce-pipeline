trigger HandleBulkAccount on Account (after insert) {
    List<Contact> conlist = new List<Contact>();
    for(Account acc: trigger.new){
        for(Integer i = 1; i<=200; i++){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name + i;
            conlist.add(con);
        }
    }
    insert conList;

}