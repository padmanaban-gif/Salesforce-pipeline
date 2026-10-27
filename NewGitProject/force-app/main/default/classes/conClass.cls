public class conClass {
    
    public static void updClass(){
        Account acc1 =[select Id, Industry, Rating, AnnualRevenue from Account limit 1];
        //for(Account acc1 : acc){
        if(acc1.Industry =='Banking'){
            acc1.Rating = 'hot';
        }else{
            acc1.Rating = 'warm';
                acc1.AnnualRevenue = 50000;
        }
        update acc1;
    }

}