trigger SyncAccPhoneToCon on Account (after update) {
    
    List<Contact> conList = new List<Contact>();
    for(Account acc: trigger.new){
        Account oldPhone = trigger.oldMap.get(acc.Id);
        if(acc.Phone != Null && acc.Phone != oldPhone.Phone){
            for(Contact con :[select AccountId, Id, Phone from Contact where AccountId  =: acc.Id]){
                if(con.Phone != acc.Phone){
                    con.Phone = acc.Phone;
                    conList.add(con);
                }
            }
        }
    }
    update conList;

}