import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class AppTest {

    @Test
    public void testMain() {
        // Assuming App has a method that returns a greeting
        String expected = "Hello, World!";
        String actual = App.getGreeting(); // Replace with actual method call
        assertEquals(expected, actual);
    }
}