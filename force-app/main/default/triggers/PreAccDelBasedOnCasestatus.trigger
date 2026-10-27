//Preventing delete the account record if it's having working status case
trigger PreAccDelBasedOnCasestatus on Account (before delete) {
    set<Id> accIds = new set<id>();
    for(Account acc: trigger.old){
        accIds.add(acc.Id);
    }
    List<Case> existingCase = [select accountId, status from case where AccountId IN : accIds and status='Working'];
    Map<Id, Case> oldCase= new Map<id, Case>();
    for(Case css:existingCase ){
        if(!oldCase.containsKey(css.AccountId)){
            oldCase.put(css.AccountId, css);
        }
    }
    for(Account acc: trigger.old){
        if(oldCase.containsKey(acc.Id)){
            acc.addError('This account cannot be closed as its having working case');
        }
    }
    
}