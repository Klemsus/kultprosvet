package org.klems.spark.example;

import com.j256.ormlite.jdbc.JdbcConnectionSource;
import com.j256.ormlite.support.ConnectionSource;
import com.j256.ormlite.table.TableUtils;
import static freemarker.template.Configuration.VERSION_2_3_23;
import java.sql.SQLException;
import java.util.Locale;
import org.klems.spark.example.data.Event;
import org.klems.spark.example.data.EventGenres;
import org.klems.spark.example.data.Genre;
import org.klems.spark.example.data.Location;
import spark.template.freemarker.FreeMarkerEngine;

public class Configuration {

  public static ConnectionSource init_db() {
    try {
      Class.forName("org.sqlite.JDBC");
      ConnectionSource connectionSource = new JdbcConnectionSource("jdbc:sqlite:events.db");
      TableUtils.createTableIfNotExists(connectionSource, Genre.class);
      TableUtils.createTableIfNotExists(connectionSource, EventGenres.class);
      TableUtils.createTableIfNotExists(connectionSource, Location.class);
      TableUtils.createTableIfNotExists(connectionSource, Event.class);
      return connectionSource;
    } catch (ClassNotFoundException | SQLException ex) {
      throw new IllegalStateException(ex);
    }
  }
  
  public static FreeMarkerEngine init_freemarker() {
    freemarker.template.Configuration conf = new freemarker.template.Configuration(VERSION_2_3_23);
    conf.setClassForTemplateLoading(FreeMarkerEngine.class, "");
    conf.setEncoding(new Locale("ru", "RU"), "utf-8");
    return new FreeMarkerEngine(conf);
  }
  
}
