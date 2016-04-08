package org.klems.spark.example;

import java.io.IOException;

import org.klems.spark.example.components.Index;
import org.klems.spark.example.components.Navbar;
import org.klems.spark.example.components.Navbar.NAVBAR_TYPE;

import static spark.Spark.get;

public class Site {

    public static void main(String[] args) throws IOException {
      new Site("My site").init();
    }

  private final Index page;
    
  private Site(String title) {
    page = new Index(title)
            .add(
                    new Navbar().type(NAVBAR_TYPE.INVERSE)
                                .type(NAVBAR_TYPE.FIXED_TOP)
                                .brand("Brand")
            );
  }

  private void init() {
    get("/", (req, res) -> page.toString());
  }
    
}