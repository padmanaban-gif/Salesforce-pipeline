public class newFutureCallout {
    @future(callout=true)
    public static void initiateCallout(String accountId){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('');
        req.setMethod('GET');
        
        HttpResponse res = http.send(req);
        if(res.getStatusCode()==200){
            Account acc =[select Id from account where Id =: accountId];
            acc.Description = 'Synced with API';
            update acc;
        }
    }

}