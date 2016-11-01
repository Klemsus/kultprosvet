<script>
$(document).ready(function() {
  $("#add-event").click(function(event){
    var formData = new FormData($(this)[0]);

    $.post($(this).attr("action"), formData, function(data) {
        alert(data);
    });

    return false;
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