@isTest
public class TemperatureTest {
@isTest
    private static void warmTempTest(){
        Decimal c = Temperature.FtoC(70);
        System.assertEquals(21.11,c,'asserts are incorrect');
    }
    @isTest
    private static void tempCheck(){
        Decimal c = Temperature.FtoC(32);
        System.assertEquals(0,c,'asserts are incorrect');
    }
}