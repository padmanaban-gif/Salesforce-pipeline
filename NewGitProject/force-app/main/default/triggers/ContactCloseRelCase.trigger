trigger ContactCloseRelCase on Contact (after update) {
    //Whenever Contact active field is checked need to change the related case status to escalated
    set<id> conIds = new set<Id>();
    for(Contact con : trigger.new){
        Contact oldValue = trigger.oldMap.get(con.ID);
        if(con.Active__C && con.Active__c != oldValue.Active__c){
            conIds.add(con.Id);
        }
    }
    List<Case> caseList = [select Id, ContactId, ClosedDate from Case where ContactId IN :conIds];
    Map<Id,Case> relCase = new Map<Id,Case>();
    for(Case newCase: caseList){
        if(!relCase.containsKey(newCase.ContactId)){
            relCase.put(newCase.ContactId, newCase);
        }
    }
    List<Case> caseListToUpdate = new List<Case>();
    for(Contact con: trigger.new){
        if(relCase.containsKey(con.Id)){
            Case c = relCase.get(con.Id);
            caseListToUpdate.add(new Case(Id = c.Id, Status = 'Escalated'));
        }
    }
    
    update caseListToUpdate;
    

}