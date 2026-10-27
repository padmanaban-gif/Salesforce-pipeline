//when account is inserted or updated if the account type is technology partner creating related opportunity
trigger AuCrOppIfAccTypeCustomer on Account (after insert, after update) {
    
    List<Opportunity> oppList = new List<Opportunity>();
    for(Account acc : trigger.new){
        
        if(trigger.isAfter && trigger.isInsert){
            if(acc.Type =='Technology Partner'){
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name;
                opp.StageName = 'Prospecting';
                opp.CloseDate = Date.Today();
                opp.Max_Amount__c = 600;
                opp.AccountId = acc.Id;
                oppList.add(opp);
            }
        }
        if(trigger.isAfter && trigger.isUpdate){
            Account oldType = trigger.oldMap.get(acc.Id);
            if(acc.Type =='Technology Partner' && acc.Type != oldType.Type){
                 Opportunity opp = new Opportunity();
                opp.Name = acc.Name;
                opp.StageName = 'Prospecting';
                opp.CloseDate = Date.Today();
                opp.Max_Amount__c = 600;
                opp.AccountId = acc.Id;
                oppList.add(opp);
            }
            }
        }
    insert oppList;
    }