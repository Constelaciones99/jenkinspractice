package com.miempresa;

import org.junit.Test;
import static org.junit.Assert.*;

public class AppTest {
    
    @Test
    public void testSuma() {
        App app = new App();
        assertEquals(5, app.suma(2, 3));
    }
}