@isTest
private class taskUtilityTest {
@isTest
    private static void cheNormalTaskUtility(){
        String p = taskUtility.taskPriority('NA');
        System.assertEquals('Normal',p,'results are incorrect');
    }
    @isTest
    private static void cheNullTaskUtility(){
        String p =taskUtility.taskPriority('');
        System.assertEquals(null,p,'results are incorrect');
    }
    @isTest
    private static void cheHighTaskUtility(){
        String p =taskUtility.taskPriority('CA');
        System.assertEquals('High',p,'results are incorrect');
    }
}