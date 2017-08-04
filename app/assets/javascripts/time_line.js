jQuery(document).ready(function($) {

  $("#search_filter").live("keypress", function(e) {
    if (e.keyCode == 13) {
       var inserted_tag = $(this)[0].value;
        reorderItems(inserted_tag,e);
        return false; // prevent the button click from happening
    }
  });

  function addMouseEvent(){
    $(".timeline-wrapper .timeline-content-item > span").on("mouseenter mouseleave", function(e){
      $(".timeline-wrapper .timeline-content-item.active").removeClass("active");
      $(this).parent().addClass("active");
    });
    return false
  }

  //Reorder items
    function reorderItems(tagSelected, event=null){
      var allStories = JSON.parse(localStorage.getItem('allStories'));
      var oldStories = $('.timeline-content-item, .allStories');

      oldStories.remove();

      $.each(allStories, function( index, story ) {

        $.each( story.tag, function( i, storyTag){

          if (storyTag === tagSelected || tagSelected === "*"){
            $('.timeline-content-day').append(
              '<div class="timeline-content-item" data-timeline="hour-8">'+
                '<span>'+ story.date +'</span>'+
                '<div class="timeline-content-item-reveal">'+
                  '<a href='+ story.image +' data-pretty="prettyPhoto[gallery1]" >'+
                    '<img src='+ story.image +' >'+
                    '<span>'+ story.name +'</span>'+
                  '</a>'+
                '</div>'+
              '</div>'
              )
          }

        })

      })

      addMouseEvent();
    }

    // filter items when filter link is clicked
    $('#filters a').click(function(){
      $('#filters a').removeClass('active');
      $(this).addClass('active');
      var selector = $(this).attr('data-filter');
      //$container.isotope({ filter: selector });
      reorderItems(selector);
      return false;
    });

    addMouseEvent();

});