package org.klems.spark.example.components;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.google.common.collect.ImmutableList;

import j2html.tags.Tag;

import static java.util.stream.Collectors.joining;

import static j2html.TagCreator.div;
import static j2html.TagCreator.nav;


public class Navbar extends Block<Navbar> {
  
  public static enum NAVBAR_TYPE {
    INVERSE,
    FIXED_TOP,
    FIXED_BOTTOM,
    STATIC_TOP;
  }
  
  private final ImmutableList.Builder<String> classes;
  private final List<Tag> headerLeft = new ArrayList<>();

  public Navbar() {
    classes = ImmutableList.<String>builder().add("navbar", "navbar-default");
  }
  
  public Navbar type(NAVBAR_TYPE type) {
    classes.add("navbar-" + type.toString().toLowerCase().replace('_', '-'));
    return this;
  }
  
  public Navbar brand(String brand) {
    headerLeft.add(div().withClass("navbar-brand").withText(brand));
    return this;
  }
  
  public Navbar leftLink(Link link) {
    return this; 
  }
  
  public Navbar rightLink(Link link) {
    return this; 
  }
  
  public Navbar collapseLink(Link link) {
    return this; 
  }
  
  @Override
  public Tag getTag() {
    return div().withClass("navbar-wrapper").with(div().withClass("container").with(
              nav().withClass(classes.build().stream().collect(joining(" "))).attr("role", "navigation")
                   .with(div().withClass("container").with(
                           headerLeft.isEmpty() ? null : Collections.singletonList(div().withClass("navbar-header pull-left").with(headerLeft))
                   ))
           ));
  }
  
}
