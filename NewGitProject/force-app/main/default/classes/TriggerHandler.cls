/*public class TriggerHandler {// writing the logics for accounttrigger
    public static void Handling(List<Account> newList){
        for(Account acc: newList){
            acc.Description ='test desc';
        }
    }
}*/

public class TriggerHandler{
    public static void showError(List<Account> accList){
        if(!accList.isEmpty()){
            for(Account acc: accList){
                if(acc.Active__c =='yes'){
                    acc.addError('we cannot delete actice account');
                }
            }

        }
    }
    
    public static void UpdateRelOpp(List<Account> accList, Map<ID,Account> oldMap){/*updating phon enumber to related 
        opportunities once phone record updated in account phone field*/
        
        Set<Id> accIds = new Set<Id>();
        List<Opportunity> OppToUpd = new List<Opportunity>();
        if(!accList.isEmpty()){
            for(Account acc : accList){
                accIds.add(acc.Id);
            }
        }
        List<Account> newaccList =[SELECT Id, Name, Phone,(SELECT Id,Phone__c FROM Opportunities) FROM Account  WHERE Id IN: accIds];
        if(!newaccList.isEmpty()){
            for(Account acc:newaccList ){
            for(Opportunity oppt : acc.Opportunities){
                Opportunity opt = new Opportunity();
                opt.Id = oppt.Id;
                opt.Phone__c=acc.Phone;
                OppToUpd.add(opt);
            }}
        }
        if(!OppToUpd.isEmpty()){
            update OppToUpd;
        }
    }
    public static void UpdateDes(List<Account> accList, Map<Id,Account> oldMap){/*updating description filed in account phone 
filed is update*/
        if(!accList.isEmpty()){
            for(Account acc: accList){
                if(acc.Phone != oldMap.get(acc.Id).Phone){
                   acc.Description='phone number updated';
                }
            }
        }
    }
    public static void UpdateAcc(List<Account> newList){/*updating rating field in account if the industry is enery*/
        if(!newList.isEmpty()){
            for(Account acc: newList){
                if(acc.Industry !=null && acc.Industry =='Energy'){
                    acc.Rating='Hot';
                }else{
                    acc.Rating ='Cold';
                }
            }
        }

    }
   /* public static void CreateRelOpp(List<Account> accList){creating related opp to account obj
        List<Opportunity> oppList = new List<Opportunity>();
        if(!accList.isEmpty()){
            for(Account bcc: accList){
               Opportunity opp = new Opportunity();
                opp.Name = bcc.Name;
                opp.CloseDate = system.today();
                opp.StageName ='priority';
                opp.AccountId=bcc.Id;
                oppList.add(opp);
            }
        }
    
        if(!oppList.isEmpty()){
            insert oppList;
        }*/
    }