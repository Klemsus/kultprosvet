<!DOCTYPE html>
<#setting date_format="dd MMMMM">
<#setting time_format="HH:mm">
<#include "bootstrap/bootstrap.ftl">
<#include "event.ftl">
<#assign title="Test">
<#assign city="Ижевск">
<#assign info_active="about">
<html lang="ru">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
    <meta name="author" content="">
    <title>${title}</title>

	<!-- For site use 

	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

	<link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.1/css/bootstrap-datepicker3.min.css" rel="stylesheet">
	
	-->
    
	<!-- Bootstrap core CSS -->
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Enhanced dropdown -->
	<link href="css/dropdown-enhancement.min.css" rel="stylesheet">
	
	<!-- Datetime picker CSS -->
	<link rel="stylesheet" href="css/bootstrap-datepicker3.min.css" />
	<link rel="stylesheet" href="css/bootstrap-clockpicker.min.css" />
	
	<!-- Select2 -->
	<link rel="stylesheet" href="css/select2.min.css" />
	<link rel="stylesheet" href="css/select2-bootstrap.min.css" />
	
    <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet">
	
  </head>
  <body>
    <#assign nav_links = [
      {"name":city, "dropdown": [
        {"href":"#", "name":"Ижевск"}
        ]},
      {"name":"Информация", "modal":"info"}
    ]>
    <@navbar links=nav_links brand="КультProСвет" ; place>
      <#if place == "fixed_right">
        <button type="button" class="btn btn-default navbar-btn pull-right" data-toggle="modal" data-target="#loginModal">Войти</button>
      </#if>
    </@navbar>
    <!-- Info modal -->
    <@modal "info" "Информация" ; place>
        <#if place == "body">
				<!-- Nav tabs -->
        <#assign info_links = [
          {"id":"about", "name":"О нас"},
          {"id":"eticket", "name":"Электронный билет"},
          {"id":"organizer", "name":"Организаторам"},
          {"id":"contact", "name":"Контакты"}
        ]>
        <@tabs info_active info_links; tab>
				  <#if tab == "about">
					Мы такие крутые, вот наш сайтик, мы тут продаем билеты и все такое
					<#elseif tab == "eticket">
          <#assign eticket_panel = [
           {"name":"Описание", "id": "info"},
           {"name":"Преимущества", "id":"cons"},
           {"name":"Принципиальный алгоритм покупки", "id":"algo"},
           {"name":"Способы оплаты", "id":"pays"},
           {"name":"Часто задаваемые вопросы", "id":"faq"}
          ]>
          <@accordion "eticket-accordion" eticket_panel; acc>
            <#if acc == "info">
            <p>Электронный билет - это передовая технология, позволяющая сделать посещение всех наших концертов максимально удобным. Это альтернатива обычным бумажным билетам, продающимся на бланках утверждённой формы в билетных кассах и иных точках продаж. Для покупки электронного билета не нужно тратить время на то, чтобы идти в кассу, стоять в очереди или ждать курьера. Достаточно лишь зайти на наш сайт, найти нужное мероприятие, выбрать понравившиеся места и подходящую для вас стоимость, оплатить покупку и распечатать электронный билет.</p>
            <#elseif acc == "cons">
            <p>Покупка электронного билета на нашем сайте – это целый ряд преимуществ по сравнению с приобретением в обычных кассах или у других агентов, с которыми мы сотрудничаем.</p>
            <ul>
               <li><strong>Экономия времени и простота процесса: </strong>не нужно делать предварительный заказ - для покупки понадобится всего пара минут. После завершения оплаты и получения подтверждения этого, все, что вам нужно сделать – это распечатать билет; при этом забирать билет в кассе или заказывать доставку не нужно.</li>
               <li><strong>Надежность: </strong>электронные билеты нельзя потерять. Они находятся на сервере компании, поэтому владельцу билета не нужно нести ответственность за его сохранность; даже в случае утери распечатки и стирания всех подтверждений, при входе на концерт достаточно идентифицировать себя с помощью любого полноценного удостоверения личности, сверяя ваши данные с сохраненными в системе</li>
               <li><strong>Удобство и универсальность: </strong>разнообразные способы оплаты, в том числе, кроме банковских карт, с помощью моментальных платежей с электронных кошельков.</li>
               <li><strong>Конфиденциальность: </strong>код заказа передается на электронную почту покупателя, а также на мобильный телефон в виде СМС; эти данные не передаются третьим лицам.</li>
            </ul>
            <#elseif acc == "algo">
            <ul>
               <li>Выбор концерта на сайте, выбор типа билета ( «стоячий» на танцполе или «сидячий» с посадкой за столом или в зрительном зале), выбор стоимости</li>
               <li>Оплата заказа</li>
               <li>Получение подтверждения на введенный адрес электронной почты и мобильный телефон</li>
               <li>Распечатка на любом принтере</li>
               <li>Предъявление при  входе на концерт сотруднику службы контроля входа</li>
            </ul>
            <#elseif acc == "pays">
            <p>К оплате принимаются банковские карты следующих платежных систем: Visa (включая Electron), MasterCard и Maestro, выпущенные любыми банками любых стран. При оплате заказа банковской картой (включая ввод номера карты), обработка платежа происходит с иcпользованием платежной системы Yandex Money, по технологии 3-D Secure (подтверждение паролями на странице банка). При этом, Yandex Money гарантирует, что конфиденциальные данные клиента (реквизиты карты, регистрационные данные и др.) не поступают в интернет-магазин https://svizh.ru, их обработка полностью защищена и никто, в том числе https://svizh.ru, не может получить персональные и банковские данные клиента</p>
            <#elseif acc == "faq">
            <ul>
               <li>
                  Я распечатал электронный билет и потерял его. Как быть?
                  <p>Вы можете распечатать его повторно, или предъявить при входе на мероприятие полученное вами подтверждение покупки с экрана вашего электронного устройства</p>
               </li>
               <li>
                  Я хочу обменять электронный билет на традиционный. Это возможно?
                  <p>Электронный билет вы можете обменять на традиционный по адресу: г. Ижевск, ул. Пушкинская, 185, билетная касса рок-магазина «ELVIS». Тел. 51-35-50</p>
               </li>
               <li>
                  Мой билет скопировали, как быть, если кто-то попытается пройти на концерт по этой копии?
                  <p>Доступ на мероприятие будет открыт только по тому электронному билету, который предъявляется первым.</p>
               </li>
            </ul>
            </#if>
          </@accordion>
          <a href="/pages/publick_oferta">Публичная оферта по продаже билетов, в т.ч. электронных на концертные мероприятия.</a>
					<#elseif tab == "organizer">
          ...Информация для организаторов...
          <#elseif tab == "contact">
					...Наши контакты: почта, ...
          </#if>
				</@tabs>
        </#if>
    </@modal>
	
    <!-- Login modal form -->
    <@modal "loginModal" "Вход"; place>
      <#if place=="body">
      <#assign login_inputs = [
        {"id":"login", "placeholder":"Электронный адрес", "type":"text", "icon":"user"},
        {"id":"password", "placeholder":"Пароль", "type":"password", "icon":"lock"}
      ]>
      <#assign enter_btn = {"type":"submit", "name":"Войти", "style":"success", "classes":"btn-block", "id":"login"}>
      <@form_horizontal "login_form" "/login" login_inputs enter_btn>
        <div class="form-group">
          <div class="col-xs-12 checkbox">
            <label>
              <input type="checkbox"> Запомнить
            </label>
          </div>
        </div> <!-- /.checkbox -->
      </@form_horizontal>
      <#elseif place=="footer">
        <@link {"name":"Зарегистрироваться", "href":"#", "classes":"btn btn-primary"}/>
      </#if>
    </@modal>

    <!-- Add event modal window -->
    <#-- <@modal "add-event-modal" "Добавление мероприятия"; place>
      <#if place=="body">
      <#assign event_inputs= [
        {"id":"name", "label":"Название", "type":"text", "required":true},
        {"id":"poster", "label":"Постер", "type":"file", "required":true, "attrs":{"accept":"image/jpg,image/jpeg,image/png,image/gif"}},
        {"id":"anons", "input":"textarea", "label":"Анонс", "required":true, "attrs":{"rows":"3"}},
        [{"id":"date", "type":"date", "label":"Дата", "icon":"calendar", "required":true, "readonly":true},{"id":"time", "type":"time", "label":"Время", "icon":"time", "required":true, "readonly":true}],
        {"id":"location", "label":"Место", "type":"text", "required":true}
      ]>
      <@form_horizontal "add_event_form" "/event" event_inputs {"type":"button", "name":"Добавить", "style":"success", "classes":"btn-block", "id":"add-event"}/>
      <#elseif place=="footer">
        <@link {"type":"submit", "style":"primary", "name":"Добавить"} true/>
      </#if> 
    </@modal> -->

    <!-- Ad carousel -->
    <#-- <#assign carousel_images=[
      {"src":"http://svizh.ru/uploads/top_slider/file/81/17-04_7__974_92.jpg"},
      {"src":"https://svizh.ru/uploads/top_slider/file/95/12-02_NobodyOne_974_92.jpg"}
    ]>
    <@carousel "event_carousel" carousel_images /> -->
    <!-- /.carousel -->
	
    <!-- Buy ticket modal -->
    <#-- <@modal "buyTicket" "Купить билет" ; place>
    <#if place=="body">
      <#assign buy_inputs = [
        {"id":"price", "placeholder":"Цена", "type":"text", "icon":"rub", "required":true, "disabled":true}
      ]>
      <@form_horizontal "buy_form" "/buy" buy_inputs {"type":"submit", "name":"Купить", "style":"danger", "id":"buy"} />
    </#if>
    </@modal> -->
    <!-- buy -->

    <div class="container">
	
    <!-- Filter bar -->
    <#assign filter_links = [
      {"name":"Все площадки", "dropdown": [
        {"href":"#", "name":"Все площадки", "label":"6"},
        {"href":"#", "name":"Метрополис", "label":"3"},
        {"href":"#", "name":"Dropclub", "label":"3"}
        ]}
    ]>
    <@navbar links=filter_links navbar_types=["inverse", "static-top"] role="filter" fluid=true toggle={"id":"filter-collapse", "role":"filter", "icon":"filter", "classes":"pull-left", "style":"margin-left: 10px;"}; place>
      <#if place == "links">
        <li class="navbar-form">
          <div class="input-group input-daterange" id="filter-date">
            <span class="input-group-addon">с</span>
            <input type="date" class="input-sm form-control" name="start" readonly />
            <span class="input-group-addon">по</span>
            <input type="date" class="input-sm form-control" name="end" readonly />

            <span class="input-group-addon">
              <i class="glyphicon glyphicon-calendar"></i>
            </span>
          </div>
        </li>
        <li>
          <form class="navbar-form" role="search">
            <div class="input-group">
              <input type="text" id="search" class="form-control" placeholder="Найти мероприятие..." >
              <span class="input-group-btn">
                <button class="btn btn-default" type="submit"><label for="search" class="glyphicon glyphicon-search"></label></button>
              </span>
            </div>
          </form>
        </li>
      </#if>
    </@navbar>
    
    <#list events_by_group as date, events>
      <div class="row">
      <h2>${date}</h2>
      <#list events as evnt>
        <@event evnt />
      </#list>
      </div>
      <hr>
    </#list>
    <footer>
      <a href="#">Афиша</a> &middot; <a href="#">Электронные билеты</a> &middot; <a href="#">О  нас</a> &middot; <a href="#">Контакты</a></p>
      <p class="text-muted">&copy; 2015 Company, Inc.</p>
    </footer>
  </div><!-- /.container -->
	
  <!-- For placing on site   
  <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.1/js/bootstrap-datepicker.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.1/js/bootstrap-datepicker.min.js"></script>
  -->

  <!-- For local use -->
  <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://api-maps.yandex.ru/2.1/?lang=ru_RU"></script>
  <script type="text/javascript" src="js/dropdowns-enhancement.js"></script>
  <script type="text/javascript" src="js/select2.min.js"></script>
  <script type="text/javascript" src="js/bootstrap-clockpicker.min.js"></script>
  <script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript" src="js/bootstrap-datepicker.ru.min.js"></script>
  <script type="text/javascript" src="js/scripts.js"></script>

  <#include "js.ftl">
  
  </body>
</html>