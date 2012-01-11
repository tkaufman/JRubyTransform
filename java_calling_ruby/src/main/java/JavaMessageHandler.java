public class JavaMessageHandler implements MessageHandler {

  public void receive(Object obj) {
    System.out.println("Class is " + obj.getClass());
    System.out.println("toString is " + obj);
  }

}