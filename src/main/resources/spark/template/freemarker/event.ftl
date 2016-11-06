<#macro event event>
<div class="col-sm-6 col-md-4 col-lg-4 event">
  <div class="carousel-inner" style="background-image: url('${event.media.cover.url}');">
    <#if event.sets?size == 1>
        <div class="price carousel-caption label-warning pull-right">${event.sets[0].price} р.</div>
    </#if>
  </div>
  <div class="well">
    <h4><strong><a href="/tickets?id=${event.id}">${event.title.text}</a> <#if event.age??><small>${event.age}+</small></#if></strong></h4>
    <div class="small collapse in collapse-desc" id="desc-${event.id}">${event.title.desc}</div>
    <button class="desc btn btn-link pull-right" type="button" data-toggle="collapse" data-target="#desc-${event.id}" aria-expanded="false" aria-controls="desc-${event.id}">
      <i class="indicator glyphicon glyphicon-chevron-down"></i>
    </button>
    <p><strong><span class="glyphicon glyphicon-time" aria-hidden="true"></span> &nbsp;${event.date?date}, ${event.date?time}</strong></p>
    <p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> &nbsp;<a href="https://maps.yandex.ru/?text=${event.location.point.coordinates[0]}+${event.location.point.coordinates[1]}" class="map">${event.location.name}</a></p>
    <button type="button" class="btn btn-danger center-block buy-ticket-link" data-toggle="modal" data-target="#buyTicket" data-price="1000">Купить билет</button>
  </div>
</div>
</#macro>

