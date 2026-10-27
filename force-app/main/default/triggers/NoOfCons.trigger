trigger NoOfCons on Account (after insert,after update) {
List<Contact> conList = new List<Contact>();
    
    for(Account acc: trigger.new){
        if(acc.No_of_cons__c != NULL){
            Integer newContacts = Integer.valueof(acc.No_of_cons__c);
            if(trigger.isInsert || trigger.isUpdate && acc.No_of_cons__c != trigger.oldMap.get(acc.Id).No_of_cons__c){
        for(Integer i=0;i<newContacts; i++){
            Contact con = new Contact();
            con.LastName = acc.Name+i;
            con.AccountId = acc.Id;
            conList.add(con);
        }
    }
    
        }}
insert conList;
}