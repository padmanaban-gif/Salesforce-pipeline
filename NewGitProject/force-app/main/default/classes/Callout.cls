public class Callout {
    public static void newCallout(){
        Http http = new Http();
HttpRequest request =  new HttpRequest();
request.setEndpoint('https://api.spoonacular.com/recipes/random?apiKey=75a5a90e71374578bb26c448605e0ba0');
request.setMethod('GET');

HttpResponse response = http.send(request);
System.debug('status code'+ response.getStatusCode());
if(response.getStatusCode() == 200){
    System.debug('successfully retrived'+ response.getBody());
}
    }

}