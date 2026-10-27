trigger UpCaseFieldOnAccount on Case (after insert) {
  set<Id> accIds = new set<Id>();
    for(Case css: trigger.new){
        if(css.AccountId!= Null){
            accIds.add(css.AccountId);
        }
    }
    List<Case> caseList = [select Id, CaseNumber, CreatedDate from Case where Id IN : accIds Order By createdDate DESC];
    Map<Id, Case> existingCase = new Map<Id, Case>();
    for(Case cs: caseList){
        if(!existingCase.containsKey(cs.AccountId)){
            existingCase.put(cs.AccountId, cs);
        }
    }
    List<Account> accToupdate = new List<Account>();
    for(Id ids : existingCase.keySet()){
        Case value = existingCase.get(ids);
        accToUpdate.add(new Account(Id = ids, New_Case_Number__c = Decimal.valueOf(value.CaseNumber)));
    }
    update accToUpdate;
}