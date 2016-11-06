<script>
// Put all events only on document ready
$(document).ready(function() {
  
  // Collapse all description at the beginning
  $('.collapse-desc').collapse();
  // Don't fully collapse event description
  $('.collapse-desc').on('hidden.bs.collapse', function (e) {
    $(e.target).removeClass('collapse').css({        
        'overflow': 'hidden',
        'height': '60px'
    })
  })
  // Switch icon for uncollapsed descs
  $('button.desc').click(function (e) {
    console.log(e);
    $(e.target).children("i.indicator").toggleClass('glyphicon-chevron-down glyphicon-chevron-up')
  })

  // Send form
  $("#add-event").click(function(event){
    var formData = new FormData($(this)[0]);

    $.post($(this).attr("action"), formData, function(data) {
        alert(data);
    });

    return false;
  });

  // Enable date picker
  $('#date').datepicker({
          format: "dd.mm.yyyy",
          language: "ru",
          autoclose: true,
          todayHighlight: true,
          daysOfWeekHighlighted: "0,6"
  });

  // Enable time picker
  $('#time').clockpicker({
          autoclose: true,
  });

  //Eneable selece2 on genre selection
  $('#add-event-genre').select2({
          tags: true,
          theme: "bootstrap",
          placeholder: "Выбрать стили"
  });

  // Enable datepicker in filter
  $('#filter-date').datepicker({
          format: "dd.mm.yyyy",
          language: "ru",
          autoclose: true,
          todayHighlight: true,
          daysOfWeekHighlighted: "0,6"
  });
  
// Click to only happen on buy-ticket-link links
  $(".buy-ticket-link").click(function(){
          console.log($(this));
          $("#price").val($(this).data('price'));
  });
});
</script>