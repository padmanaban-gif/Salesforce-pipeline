public class RetriveJsonUsers {
    public static void getUsers(){
        Http http = new Http();
        httpRequest req = new HttpRequest();
        req.setEndpoint('https://jsonplaceholder.typicode.com/users');
        req.setMethod('GET');
        
        HttpResponse res = Http.send(req);
        System.debug('Users retrived successfully');
        system.debug('Status :'+ res.getStatusCode());
        system.debug('Users :'+ res.getBody());
    }

}