public class MathCalculator {
     private Integer num1;
    private Integer num2;
    
    private MathCalculator(Integer num1, Integer num2){
        this.num1 = num1;
        this.num2 = num2;
       
    }
    public void doMath(String operation){
        if(operation =='add'){
            printOutput(add(num1,num2));
        }else if(operation == 'multiply'){
            printOutput(multiply(num1,num2));
        }else{
            System.debug('invalid');
        }
    }
    private static Integer add(Integer num1, Integer num2){
        return num1 + num2;
    }
    private static Integer multiply(Integer num1, Integer num2){
        return num1 + num2;
    }
    private static void printOutput(Integer result){
        System.debug('the result is '+result);
    }
}