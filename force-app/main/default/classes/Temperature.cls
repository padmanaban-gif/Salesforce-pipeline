public class Temperature {
    public static Decimal FtoC(Decimal fh){
        Decimal res = (fh - 32)*5/9;
        return res.setScale(2);
    }
}