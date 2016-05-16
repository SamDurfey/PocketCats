import java.util.List;
import java.util.ArrayList;
import java.time.LocalDateTime;
import org.junit.*;
import static org.junit.Assert.*;
import org.sql2o.*;

public class CatTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void Cat_instantiatesCorrectly_true() {
    Cat newCat = new Cat("Appa", "Siamese");
    assertEquals(true, newCat instanceof Cat);
  }

  @Test
  public void all_EmptyAtFirst_true() {
    assertEquals(0, Cat.all().size());
  }

  @Test
  public void save_savesToCatDatabase() {
    Cat newCat = new Cat("Appa", "Siamese");
    newCat.save();
    assertTrue(Cat.all().get(0).equals(newCat));
  }

  @Test
  public void save_saveAssignsIdToObject() {
    Cat newCat = new Cat("Appa", "Siamese");
    newCat.save();
    assertEquals(newCat.getId(), Cat.all().get(0).getId());
  }
}
