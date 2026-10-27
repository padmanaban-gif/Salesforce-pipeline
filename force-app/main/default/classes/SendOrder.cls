public class SendOrder {
    public static void initiateOrder(List<Order> ord){
        for(Order order : ord){
            system.enqueueJob(new OrderCallout(order.Id));
        }
    }

}