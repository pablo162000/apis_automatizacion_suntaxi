package pets;
import com.intuit.karate.junit5.Karate;

public class UserGetRunner {

    @Karate.Test
    Karate runPet() {
        return Karate.run().relativeTo(getClass());
    }
}
