<#macro event event>
<div class="col-sm-6 col-md-4 col-lg-4 event">
  <div class="carousel-inner" style="background-image: url('${event.poster}');">
    <div class="carousel-caption">
      <a href="#s"><small>${event.genre}</small></a>
    </div>
  </div>
  <div class="well">
    <h4><strong><a href="/event?id=${event.id}">${event.name}</a> <#if event.age??><small>${event.age}+</small></#if></strong></h4>
    <p><small>${event.anons}</small></p>
    <p><strong><span class="glyphicon glyphicon-time" aria-hidden="true"></span> &nbsp;${event.date}, ${event.time}</strong></p>
    <p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> &nbsp;<a href="/location?l=${event.location}" class="map">${event.location}</a></p>
    <button type="button" class="btn btn-danger center-block buy-ticket-link" data-toggle="modal" data-target="#buyTicket" data-price="1000">Купить билет</button>
  </div>
</div>
</#macro>

