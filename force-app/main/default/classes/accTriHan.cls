public class accTriHan {
    /*public static void showErr(List<Account> accList){
        /*for(Account acc: accList){
            if(acc.Active__c == 'yes'){
                acc.addError('you cant delete active account');
            }
        }
    }
    public static void showError(List<Account> accList){
        for(Account acc: accList){
            if(acc.Active__c == null){
                acc.addError('please populate active field');
            }
        }
    }
    public static void createRelOpp(List<Account> accList) {
        List<Opportunity> oppList = new List<Opportunity>();
        if(!accList.isEmpty()){
            for(Account acc: accList){
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name;
                opp.StageName = 'priority';
                //opp.CloseDate = system.today();
                opp.AccountId = acc.Id;
                oppList.add(opp);
            }
            Database.SaveResult[] srList = Database.insert(oppList,false);//using db method to show the particular error in ui
            for(Integer i=0;i<srList.size();i++){
                if(!srList[i].isSuccess()){
                    String errors ='';
                    for(Database.Error err:srList[i].getErrors()){
                        errors = errors+err.getMessage();
                    }
                    accList[i].addError(errors);
                }
            }
            /*try{using DML method to handle the error and creating the account record without
                 creating related opp record and withoit showing error in ui
             
            if(!oppList.isEmpty()){
            insert oppList;
            }}
            catch (DMLException e){
                system.debug(e.getMessage());
            }*/
    public static void updAcc(List<Account> accList, Map<Id, Account> oldMap){//prevent recursion
        List<Account> newUpdAcc = new List<Account>();
        for(Account acc : accList){
            Account a = new Account();
            a.Id = acc.Id;
            a.Description ='test';
            newUpdAcc.add(a);
        }
        if(!newUpdAcc.isEmpty()){
            update newUpdAcc;
        }
    }
    }