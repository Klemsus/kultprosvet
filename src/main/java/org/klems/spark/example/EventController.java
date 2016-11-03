package org.klems.spark.example;

import static io.restassured.RestAssured.when;

import java.util.List;

import io.restassured.response.Response;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class EventController {

  static List<Event> getEvents() {
    Response resp = when().get("/v1/services/simple/events");
    System.out.println(resp.body().asString());
    return new Gson().fromJson(resp.body().asString(), new TypeToken<List<Event>>(){}.getType());
  }
  
  static String getTicketsJson(String id) {
    String tickets = when().get("/v1/resources/events/" + id + "/tickets").body().asString();
    System.out.println(id + ": " + tickets);
    return tickets;
  }
  
  static List<Ticket> getTickets(String id) {
    return new Gson().fromJson(getTicketsJson(id), new TypeToken<List<Ticket>>(){}.getType());
  }

}
