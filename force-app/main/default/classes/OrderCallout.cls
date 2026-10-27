public class OrderCallout implements Queueable, Database.AllowsCallouts {
    Private Id orderId;
    public OrderCallout(Id ordId){
        this.orderId = ordId;
    }
    public void execute(QueueableContext qc){
        Order ord = [select Id, orderNumber, AccountId from Order where Id =: orderId];
        String jspayload = JSON.serialize(ord);
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('');
        req.setMethod('POST');
        req.setHeader('Content-Type','json/application');
        req.setEndpoint(jspayload);
        
        HttpResponse res = http.send(req);
        if(res.getStatusCode() == 200){
            system.debug('data send');
        }else{
            System.debug('failed'+res.getStatusCode());
        }
    }

}