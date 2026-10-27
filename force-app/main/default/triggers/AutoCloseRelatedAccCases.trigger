trigger AutoCloseRelatedAccCases on Account (after update) {
    //List<Case> casesToClose = new List<Case>();
    set<Id> accIds = new Set<Id>();
    for(Account acc: trigger.new){
        Account oldAcc = trigger.oldMap.get(acc.Id);
        if(acc.Active__c != oldAcc.Active__c && acc.Active__c =='No'){
            accIds.add(acc.Id);
        }
    }
    //Map<Id,Case> caseList = new Map<Id, Case>();
    List<Case> existingCases = [select Id, AccountId, closedDate from Case where AccountId IN : accIds];
    for(Case cs :existingCases ){
        cs.status = 'Escalated';
    }
    update existingCases;

}