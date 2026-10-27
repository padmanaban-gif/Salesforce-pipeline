//Scenario: Whenever a case is created on any account put the latest case number on the
//account in the latest case number field.
trigger UpdateAccCaseField on Case (after insert) {
    Set<Id> conIds = new Set<Id>();
    
    for(Case css : trigger.new){
        if(css.AccountId != null){
            conIds.add(css.AccountId);
        }
        
    }
    List<Case> relatedCases = [select Id, CaseNumber,AccountId, createdDate from Case where AccountId IN :conIds ORDER BY createdDate Desc];
    
    Map<Id, case> toUpdate = new Map<Id, case>();
    
    for(Case cs: relatedCases){
        if(!toUpdate.containsKey(cs.AccountId)){
            toUpdate.put(cs.AccountId,cs);
        }
    }
    List<Account> accToUpdate = new List<Account>();
    for(Id accId :toUpdate.keySet() ){
        Case latestCase = toUpdate.get(accId);
        accToUpdate.add(new Account(
        Id = accId,
        New_Case__c =Decimal.valueOf(latestCase.CaseNumber )));
    }
    update accToUpdate;

}