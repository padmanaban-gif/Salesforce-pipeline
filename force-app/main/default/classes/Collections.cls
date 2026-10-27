public class Collections {
    public static void Collections(){
        //List
       /*List<Integer> num = new List<Integer>();
        List<Integer> num2 = new List <Integer>();
        
        
        num.add(1);
        num.add(2);
        num.add(0,18);
        //System.debug('list values'+ num );
        num2.add(10);
        num2.add(20);
        //num.add(num2);
        System.debug( 'list values >'+num2);
        //num.addAll(num2);
        if(num.contains(2)){
            System.debug('true');
        }else{
            System.debug('false');
        }
        if(num.Equals(num2)){
            System.debug('equal');
        }else{
            System.debug('unequal');
        }
        System.debug(num.get(2));
        System.debug(num.indexof(18));
        System.debug(num2.isEmpty());
        num.remove(2);
       System.debug( num.size());
        num.sort();
        System.debug(num);
       // System.debug('new list values ='+num);
        //num.clear();
         //System.debug('new list values ='+num);
  //set-------------------------
         Set<Integer> s = new Set<Integer>();
        Set<Integer> s2 = new Set<Integer>();
        List<Integer> s3 = new list<Integer>();
        s.add(1);
        s.add(2);
        s.add(2);
        System.debug('set values'+ s);
        s2.add(5);
        s2.add(7);
        s.addAll(s2);
        //System.debug('set values'+ s);
        System.debug('comibined set'+s);
        s3.add(0);
        s3.add(10);
        s.addAll(s3);
        s = s2.clone();
        System.debug(s);
        System.debug('combined set and list values'+ s);
        s.add(1);
        s.add(2);
        s.add(3);
        s2.add(1);
        s2.add(2);
        s2.add(6);
        System.debug(s.equals(s2));
        if(s.containsAll(s2)){
            System.debug('yes');
        }else{
            System.debug('No');
        
        //s.addAll(s2);
        //System.debug(s);
        //s.removeAll(s2);
        //System.debug(s);
        s.retainAll(s2);
        System.debug(s);*/
 //Map-------------------------------------------------
         Map<Integer, String> intToStr = new Map<Integer,String>();
        Map<Integer,String> intToStr2 = new Map<Integer,String>();
        intToStr.put(1,'red');
        intToStr.put(2,'blue');
        intToStr.put(3,'yellow');
        intToStr2.put(11,'red');
        intToStr2.put(12,'blue');
        intToStr2.put(13,'yellow');
        //System.debug('map values --->'+intToStr);
        //intToStr.putAll(intToStr2);
        //System.debug('map values --->'+intToStr.keySet());
        intToStr= intToStr2.clone();
        System.debug('cloned map---->'+intToStr);
    }
}