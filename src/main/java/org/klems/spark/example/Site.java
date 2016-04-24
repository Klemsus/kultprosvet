package org.klems.spark.example;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.sql.SQLException;
import org.klems.spark.example.data.Event;
import spark.ModelAndView;
import static spark.Spark.get;
import static spark.Spark.post;
import static spark.Spark.staticFileLocation;
import spark.template.freemarker.FreeMarkerEngine;

public class Site {

  public static Gson gson;
  
  public static void main(String[] args) throws IOException, ClassNotFoundException, SQLException {
  
    gson = new GsonBuilder()
            //.registerTypeAdapter(Event.class, EventController.eventDeserializer())
            .setDateFormat("dd.MM.yyyy HH:mm")
            .create();    
    //String json = "{\"eventName\":\"test\",\"anons\":\"rasd\",\"genres\":[\"rock\",\"rap\"],\"date\":\"\",\"time\":\"\",\"location\":\"vvv\"}";
    //Event ev = gson.fromJson(json, Event.class);
    initSpark();
  }
  
  public static void initSpark() {
    staticFileLocation("/public");
    FreeMarkerEngine fme = Configuration.init_freemarker();
    get("/", (req, res) -> new ModelAndView(null, "index.ftl"), fme);
    post("/event", (req, res) -> {
      System.out.println(req.raw().getCharacterEncoding());
      System.out.println(req.headers("Accept-Encoding"));
      System.out.println(req.body());
      long id = EventController.createEvent(gson.fromJson(req.body(), Event.class));
      //res.redirect("/");
      res.status(201);
      return id;
    });
    get("/events", (req, res) -> EventController.getEvents(), (list) -> gson.toJson(list));
  }
   
}