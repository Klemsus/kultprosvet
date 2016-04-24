<script type="text/javascript">
    $(document).ready(function() {
      $("#add-event").click(function(event){
        var form_data = {};
        $("#add_event_form").serializeArray().map(function(item) {
           if (item.name == "genres") {
              val = item.value;
              item.value = { name : val };
              item.value["humanName"] = $("#add_event_form").find('select').find('option').toArray().find(it => it.value == val).label;
            } 
            if (item.name == "time") {
              form_data.date += " " + item.value;
            } else if ( form_data[item.name] ) {
                form_data[item.name] = [form_data[item.name]];
                form_data[item.name].push(item.value);
            } else {
                form_data[item.name] = item.value;
            }
        });
        
        $.ajax({
          type: 'POST',
          url: '/event',
          data: JSON.stringify(form_data),
          dataType: "json",
          contentType : "application/json",
          success: function(){
                     alert("succecss");
                  },
          error: function(){
                  alert("failure");
                }
        });
      });
      $('#date').datepicker({
              format: "dd.mm.yyyy",
              language: "ru",
              autoclose: true,
              todayHighlight: true,
              daysOfWeekHighlighted: "0,6"
      });
      $('#time').clockpicker({
              autoclose: true,
      });
      $('#add-event-genre').select2({
              tags: true,
              theme: "bootstrap",
              placeholder: "Выбрать стили"
      });
      $('#filter-date').datepicker({
              format: "dd.mm.yyyy",
              language: "ru",
              autoclose: true,
              todayHighlight: true,
              daysOfWeekHighlighted: "0,6"
      });
      $(".buy-ticket-link").click(function(){ // Click to only happen on buy-ticket-link links
              $("#price").val($(this).data('price'));
      });
    });
  </script>
