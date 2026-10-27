public class insertDML {
    
    public static void newDML(){
        /*Opportunity opp  = new Opportunity();
        opp.Name = 'TCS Limited';
        opp.CloseDate = Date.Today();
        opp.StageName = 'Propecting';
        opp.AccountId = '001dM00002HYLAWQA5';
        insert opp;
        Opportunity opp = [select Id from Opportunity where Name = 'TCS Limited'];
        //opp.Amount = 200;
        delete opp;*/
        Opportunity opp1  = new Opportunity();
        opp1.Name = 'TCS Limited';
        opp1.CloseDate = Date.Today();
        opp1.StageName = 'Propecting';
        
        Opportunity opp2  = new Opportunity();
        opp2.Name = 'TCS Limited';
        //opp2.CloseDate = Date.Today();
        opp2.StageName = 'Propecting';
        
        List<Opportunity> oppList = new List<Opportunity>{opp1, opp2};
        //insert oppList;
        Database.SaveResult[] sr = Database.insert(oppList,false);
        
        for(Database.SaveResult var: sr){
            System.debug(var.isSuccess());
        }
        
        
    }
         
}