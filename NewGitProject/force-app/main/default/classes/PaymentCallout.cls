public class PaymentCallout {
    //@future(callout = true)
    public static String initiateRequest(String trxId){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('');
        req.setMethod('GET');
        req.setHeader('Authorization','Bearer token');
        
        HttpResponse response = Http.send(req);
        
        if(response.getStatusCode() == 200){
            Map<String, Object> res = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            return (String)res.get('status');
        }else{
            throw new calloutException('Failed to verify payment');
        }
        
    }

}