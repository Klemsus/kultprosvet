package org.klems.spark.example;

import com.google.gson.Gson;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.dao.DaoManager;
import com.j256.ormlite.support.ConnectionSource;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.klems.spark.example.data.Event;
import org.klems.spark.example.data.Genre;

public class EventController {

  private final static ConnectionSource CS = Configuration.init_db();
  private final static Dao<Event, Long> EVENT_DAO;
  private final static Dao<Genre, String> GENRE_DAO;

  static {
    try {
      EVENT_DAO = DaoManager.createDao(CS, Event.class);
      GENRE_DAO = DaoManager.createDao(CS, Genre.class);
    } catch (SQLException ex) {
      throw new IllegalStateException(ex);
    }
  }

  public static Event getEvent(long id) throws SQLException {
    return EVENT_DAO.queryForId(id);
  }

  public static List<Event> getEvents() throws SQLException {
    return EVENT_DAO.queryForAll();
  }

  public static long createEvent(Event event) throws SQLException {
    EVENT_DAO.create(event);
    return event.getId();
  }

  public static JsonDeserializer<Event> eventDeserializer() {
    return (JsonDeserializer<Event>) (JsonElement eventJE, Type type, JsonDeserializationContext jdc) -> {
      JsonElement genreJE = eventJE.getAsJsonObject().get("genres");
      System.out.println(genreJE);
      if (! "".equals(genreJE.toString())) {
        List<Genre> genres = new ArrayList<>();
        try {
          if (genreJE.isJsonArray()) {
            for (JsonElement el : genreJE.getAsJsonArray()) {
              genres.add(GENRE_DAO.queryForId(el.getAsJsonPrimitive().getAsString()));
            }
          } else {
            genres.add(GENRE_DAO.queryForId(genreJE.getAsJsonPrimitive().getAsString()));
          }
        } catch (SQLException ex) {
          Logger.getLogger(EventController.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(new Gson().toJsonTree(genres));
        eventJE.getAsJsonObject().add("genres", new Gson().toJsonTree(genres));
      }
      System.out.println(eventJE);
      return new Gson().fromJson(eventJE, type);
    };
  }

}
