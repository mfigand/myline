jQuery(document).ready(function($) {

  $(".timeline-wrapper .timeline-content-item > span").on("mouseenter mouseleave", function(e){
    $(".timeline-wrapper .timeline-content-item.active").removeClass("active");
    $(this).parent().addClass("active");
  });

  //Reorder items
    function reorderItems(tagSelected){
      var allStories = JSON.parse(localStorage.getItem('allStories'));
      var oldStories = $('.timeline-content-item, .allStories');

      oldStories.remove();

      $.each(allStories, function( index, story ) {

        $.each( story.tag, function( i, storyTag){

          if (storyTag === tagSelected){
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

});