public class CustomAccountException extends Exception {
    public static void industryEcxeption(Account acc){
        if(acc.Industry == NULL){
            throw new CustomAccountException('Industry field cannot be empty');
        }
    }}