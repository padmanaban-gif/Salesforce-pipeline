trigger UpdateRelatedContact on Account (after insert,after update) {
    Set<Id> accIds = new Set<Id>();
    
    for(Account acc: trigger.new){
        if(acc.Phone!= NULL){
            accIds.add(acc.Id);
        }}
    
    List<Contact> conList = new List<Contact>();
    
    //List<Contact> relatedCons = [select Id, Name from Contact where AccountId IN : accIds];
    
        for(Contact con: [select Id, Phone,AccountId from Contact where AccountId IN :accIds]){
            Account acc = trigger.newMap.get(con.AccountId);
            
            con.Phone = acc.Phone;
            conList.add(con);
            
            
        }
    update conList;

        }