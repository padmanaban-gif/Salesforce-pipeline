//Throwing an error when same case type is getting craeted for the account
trigger CaseCheckOnAccount on Case (before insert) {
    
    set<Id> accIds = new set<Id>();
    for(Case cs : trigger.new){
        if(cs.AccountId != Null && cs.Type == 'Mechanical'){
            accIds.add(cs.AccountId);
        }
    }
    Map<Id, Case> caseTypes= new Map<Id, Case>();
    for(Case cs: [select AccountId, Type from case where AccountId IN : accIds and Type ='Mechanical']){
        caseTypes.put(cs.AccountId, cs);
    }
    for(Case css: trigger.new){
        if(caseTypes.containsKey(css.AccountId)){
            css.Type.AddError('Same type of case is already exists for the account');
        }
    }

}