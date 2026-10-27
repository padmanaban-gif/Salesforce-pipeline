public class listChallenge {
    //adding two list into one map
    public static void newListChallange(){
        List<String> apexPosts = new List<String>{'methods','callouts'};
            List<String> lightningPosts = new list<String>{'framework','components'};
                Map<String,List<String>> newList =  new Map<String, List<String>>();
        newList.put('Apex',apexPosts);
        newList.put('Lightning',lightningPosts);
        System.debug(newList);
    }

}