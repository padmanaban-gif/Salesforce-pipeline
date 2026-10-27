@RestResource(UrlMapping = '/AccountContactAPI')
global class AccountContactAPI {
    @HttpPost
    global static void createConOrAccount(){
        RestRequest req = RestContext.Request;
        RestResponse res = RestContext.Response;
        
        String body = req.requestBody.toString();
        MyjsonCls mycls = (MyjsonCls) JSON.deserialize(body, MyjsonCls.class);
        
        //system.debug('')
        if(mycls.isAccount == true){
            Account acc = new Account();
            acc.Name = mycls.customerName;
            insert acc;
        }
        else if(mycls.isAccount == false){
            Contact con = new Contact();
            con.lastName = mycls.customerName;
            insert con;
        }
    }

}