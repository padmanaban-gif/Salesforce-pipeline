public class billChallange {
    public static void calBill(){
        Integer slices =4;
        //Integer rosSlices =  3;
        //Integer chanSlices = 1;
        //Integer joeySlices = 4;
        Integer oneSlice = 8;
        Integer twoOrThree = 7;
        Integer moreThanThree = 6;
        
        String bill = (slices <= 1)? 'Chandles has to pay '+(oneSlice*1):slices <= 3? 'ros has to pay'+(twoOrThree*3):'joey has to pay '+(moreThanThree*4) ;
            System.debug(bill);                                                           
    }

}