public class newDemo {
    
    public String printHelloWorld;
    private static final String default_string = 'hello galaxy';
    
   /* static{
        default_string = 'hello galaxy';
    }*/
    public newDemo(){
        this(default_string);
    }
    public newDemo(String printNewString){
        this.printHelloWorld = printNewString;
    }
    
    public void printOutput(){
        system.debug('Display text ='+printHelloWorld);
    }
    /*public static void printOutputs(){
        system.debug('Display static method text text ='+ default_string);
    }*/

}