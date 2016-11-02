package org.klems.spark.example;


import com.google.gson.Gson;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;
import org.apache.commons.lang3.time.DateUtils;
import spark.ModelAndView;
import static spark.Spark.get;
import static spark.Spark.port;
import static spark.Spark.staticFileLocation;
import spark.template.freemarker.FreeMarkerEngine;


public class Site {

  public static void main(String[] args) throws IOException, ClassNotFoundException, SQLException {
    initSpark();
  }
  
  public static void initSpark() {
    port(80);
    Initialization.initRestAssured();
    FreeMarkerEngine fme = Initialization.initFreemarker();
    staticFileLocation("/public");
    get("/", (req, res) -> {
      Map<String, Object> root = new HashMap<>();
      root.put("events_by_group", EventController.getEvents().stream().collect(Collectors.groupingBy((Event event) -> DateUtils.isSameDay(event.getDate(), new Date()) ? "Today" : new SimpleDateFormat("LLLL yyyy").format(event.getDate()))));
      return new ModelAndView(root, "index.ftl");
    }, fme);
    get("/events", (req, res) -> EventController.getEvents(), (list) -> new Gson().toJson(list));
  }
   
}