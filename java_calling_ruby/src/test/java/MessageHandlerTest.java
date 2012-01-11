import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MessageHandlerTest {

	@Test
	public void testJavaConfiguration() {
    ApplicationContext context = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml"});
    MessageHandler handler = context.getBean("messageHandler", MessageHandler.class);
    assertNotNull(handler);
    assertEquals(JavaMessageHandler.class, handler.getClass());
	}

	@Test
	public void testRubyConfiguration() {
    ApplicationContext context = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml"});
    MessageHandler handler = context.getBean("rubyHandler", MessageHandler.class);
    assertNotNull(handler);
    handler.receive("Stuff");
	}

}