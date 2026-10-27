public with sharing class ColorController{
    @AuraEnabled
    public static String getColor(List<String> colors){
        try{
            System.debug('submitted colors' + colors);
            //return 'colors return successfully';
        } catch (Exception e){
            system.debug('Error occured' + e.getMessage());
        }
        return 'colors return successfully';
    }

}