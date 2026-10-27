public with sharing class RandomUserCallout{
    @AuraEnabled
    public static String getRandomUser(){
        Http http = new http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://randomuser.me/api/');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        return res.getBody();
    }

}