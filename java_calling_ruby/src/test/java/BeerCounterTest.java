import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BeerCounterTest {

	@Test
	public void testJavaConfiguration() {
    ApplicationContext context =
      new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml"});
    BeerCounter counter = context.getBean("beerCounter", BeerCounter.class);
    assertNotNull(counter);
    assertEquals(BeerCounterImpl.class, counter.getClass());
	}

  @Test
  public void testRubyConfiguration() {
      ApplicationContext context = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml"});
      BeerCounter counter = context.getBean("rubyBeerCounter", BeerCounter.class);
      assertNotNull(counter);
      String[] beers = new String[]{"Guinness"};
      assertEquals(1, counter.beersToddHasConsumed(beers));
  }

}