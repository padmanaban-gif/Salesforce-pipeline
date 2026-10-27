public class Demo5 {//pass by value and pass by reference to use pass the variables as input parameters to methods
    
    public void valueMethod(){
        String website = 'apex.salesforce.com';
        
        System.debug('Url is ='+ website);
        passByValue(website);
        System.debug('URL IS ='+ website);
    }
    private void passByValue(String newWebsite){
        newWebsite = 'salesforce.apex.com';
    }
    
    /*public void refMethod(){
        Account a = new Account();
        a.Name = 'jaya';
        a.Website = 'Jaya.prakash.com';
        System.debug('the url is '+ a);
        passRefValue(a);
        System.debug('the url is' +a);

    }
    private void passRefValue(Account a){
        a.Website = 'mani.kandan.com';
    }*/

}