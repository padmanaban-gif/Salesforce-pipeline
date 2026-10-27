trigger UpdRelConAccOfcase on Case (after insert,after update) {
    if(trigger.isAfter && trigger.isInsert){
        //List<Contact> conList = new List<Contact>();
        //List<Account> accList = new List<Account>();
        
        set<Id> caseIds = new set<Id>();
        for(Case cs: trigger.new){
            if(cs.AccountId != NULL){
            if(cs.Origin =='Email'){
                caseIds.add(cs.AccountId);
            }
            }}
        List<Contact> newConList = [select Id, LeadSource from Contact where ID IN : caseIds];
        for(Contact css: newConList){
            css.LeadSource = 'Web';
        }
        update newConList;
        List<Account> newAccList = [select Id, Active__c from Account where Id IN : caseIds];
        for(Account acc: newAccList){
            acc.Active__c = 'Yes';
        }
        update newAccList;
    }
    if(trigger.isAfter && trigger.isUpdate){
        set<Id> caseIds = new Set<Id>();
        for(Case cs : trigger.new){
            Case oldOrigin = trigger.oldMap.get(cs.AccountId);
            if(cs.Origin =='Email' && cs.Origin != oldOrigin.Origin){
                caseIds.add(cs.AccountId);
            }
        }
        List<Contact> consToUpdate = [select Id, AccountId, LeadSource from Contact where Id IN : caseIds];
        Map<Id, Contact> existingCons = new Map<Id, Contact>();
        for(Contact con: consToUpdate){
            if(!existingCons.containsKey(con.Id)){
                existingCons.put(con.id, con);
            }
            
            }
        List<Contact> conList = new List<Contact>();
        for(Case css: trigger.new){
            Contact con = existingCons.get(css.Id);
            if(existingCons.containsKey(con.Id)){
                conList.add(new Contact (LeadSource ='Web'));
            }
            update conList;
            
    }
    
    

    }}