public class OpProcSchedulabe implements Schedulable{
    public void execute(SchedulableContext cs){
        OpProc op = new OpProc();
        Database.executeBatch(op);
    }

}