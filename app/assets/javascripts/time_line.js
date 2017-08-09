jQuery(document).ready(function($) {

  $("#search_filter").live("keypress", function(e) {
    if (e.keyCode == 13) {
       var inserted_tag = $(this)[0].value;
        reorderItems(inserted_tag,e,true);
        return false; // prevent the button click from happening
    }
  });

  //Reorder items
  function reorderItems(tagSelected, event=null, changeTagFilter=false){
    
    localStorage.setItem("tagSelected", tagSelected);
    var storiesToShow = []
    var nextCounter;
    var allStories = JSON.parse(localStorage.getItem('allStories'));
    var oldStories = $('.timeline-content-item, .allStories');
    var firstStory = false;
    var lastStory = false;

    $('#next').remove();
    oldStories.remove();
    changeTagFilter === true ? nextCounter = storyGroup : nextCounter = JSON.parse(localStorage.getItem("next"));

    $.each(allStories, function( index, story ) {
      $.each( story.tag, function( i, storyTag){
        if (storyTag === tagSelected || tagSelected === "*"){
          storiesToShow.push(
            '<div class="timeline-content-item" data-timeline="hour-8">'+
              '<span>'+ story.date +'</span>'+
              '<div class="timeline-content-item-reveal">'+
                '<a href="#" class="pop">'+
                  '<img src='+ story.image +' >'+
                  '<span>'+ story.name +'</span>'+
                '</a>'+
              '</div>'+
            '</div>'
            );
        }
      })
    })

    $.each(storiesToShow, function(index, filteredStory){
      if(index >= (nextCounter-storyGroup) && index < nextCounter){
        $('.timeline-content-day').append(filteredStory)
        if(index === 0){
          firstStory = true;
        }
        else if(index === storiesToShow.length-1){
          lastStory = true;
        }
      }
    })
    
    firstStory === true ? $('#prev').hide() : $('#prev').show();

    if (nextCounter < storiesToShow.length && lastStory === false) {
      $('.timeline-content-day').append('<button id="next" class="corousel-btn next" >Next</button>');
    };

    addMouseEvent();
    addCorouselButtonEvent();
    addFilterEvent();
  }


  function addCorouselButtonEvent(){    

    $(".corousel-btn").unbind().on("click", function(e,data){
      var tagSelected;
      var nextCounter;
      var next = JSON.parse(localStorage.getItem("next"));

      if (data){
        tagSelected = data.tagSelected;
        next = 0;
      }else{
        next < storyGroup ? next = storyGroup : next = next;
      }
      
      if(e.target.id === "next"){
        nextCounter = next + storyGroup;
        localStorage.setItem("next", nextCounter);
      }else if(e.target.id === "prev"){
        nextCounter = next - storyGroup;
        localStorage.setItem("next", nextCounter);
      }
      
      tagSelected != undefined ? reorderItems(tagSelected,e) : reorderItems("*",e);
    });

    return false;
  }

  function addMouseEvent(){
    $(".timeline-wrapper .timeline-content-item > span").on("mouseenter mouseleave", function(e){
      $(".timeline-wrapper .timeline-content-item.active").removeClass("active");
      $(this).parent().addClass("active");
    });

    $('.pop').on('click', function() {
      $('.imagepreview').attr('src', $(this).find('img').attr('src'));
      $('#imagemodal').modal('show');   
    });   

    return false;
  }

  function addFilterEvent(){
    // filter items when filter link is clicked
    $('#filters a').unbind().on("click",function(e){
      $('#filters a').removeClass('active');
      $(this).addClass('active');
      var selector = $(this).attr('data-filter');
      reorderItems(selector,null,true);
    });
      return false;
  }


  var storyGroup = 5;

  addMouseEvent();
  addCorouselButtonEvent();
  addFilterEvent();
});