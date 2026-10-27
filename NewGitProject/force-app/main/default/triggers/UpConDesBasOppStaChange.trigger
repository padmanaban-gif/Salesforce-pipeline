trigger UpConDesBasOppStaChange on Opportunity (after update) {
    
    set<Id> oppIds = new set<Id>();
    for(Opportunity opp : trigger.new){
        Opportunity opps = trigger.oldMap.get(opp.Id);
        if(opp.AccountId != Null && opp.stageName != opps.stageName){
            oppIds.add(opp.AccountId);
        }
    }
    List<Contact> conList = [select Id,AccountId, Description from Contact where AccountId IN : oppIds];
    
    List<Contact> conToUpdate = new List<Contact>();
    for(Contact con: conList){
        con.Description = 'Realted opp stagename changed';
        conToUpdate.add(con);
    }
    update conToUpdate;
    

}