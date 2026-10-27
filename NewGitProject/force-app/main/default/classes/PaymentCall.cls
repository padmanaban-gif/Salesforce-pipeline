public class PaymentCall {
    public static void initiatePayment(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://');
        req.setMethod('POST');
        req.setHeader('application/json','Content-Type');
        
        HttpResponse res = http.send(req);
        if(res.getStatusCode() == 200){
             PaymentResponse resp =(PaymentResponse)JSON.deserialize(res.getBody(),PaymentResponse.class);
            system.debug(resp.status);
        }
    }

}