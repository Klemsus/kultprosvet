<#macro event event>
<div class="col-sm-6 col-md-4 col-lg-4 event">
  <div class="carousel-inner" style="background-image: url('${event.media.cover.url}');">
  </div>
  <div class="well">
    <h4><strong><a href="/event?id=${event.id}">${event.title.text}</a> <#if event.age??><small>${event.age}+</small></#if></strong></h4>
    <p><small>${event.title.desc}</small></p>
    <p><strong><span class="glyphicon glyphicon-time" aria-hidden="true"></span> &nbsp;${event.date?date}, ${event.date?time}</strong></p>
    <p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> &nbsp;<a href="https://maps.yandex.ru/?text=${event.location.point.coordinates[0]}+${event.location.point.coordinates[1]}" class="map">${event.location.name}</a></p>
    <button type="button" class="btn btn-danger center-block buy-ticket-link" data-toggle="modal" data-target="#buyTicket" data-price="1000">Купить билет</button>
  </div>
</div>
</#macro>

