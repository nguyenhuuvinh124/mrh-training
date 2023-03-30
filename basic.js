function setupMenu() {
    $(".description-nav .sp-menu").hover(function() {
        $(this).parent().find(".sb-menu").show();
      }, function() {
        $(this).parent().find(".sb-menu").hide();
      });
    
      $(".group-tab .nav-tab-item .nav-link").on( "click", function(e) {
      e.preventDefault();
      var $parent = $(this).parent();
      $parent.toggleClass("active");
      $parent.siblings().removeClass("active");
      var tabContentId = $(this).attr("href");
      $(tabContentId).toggleClass("active");
      $(tabContentId).siblings().removeClass("active");
    });
    }
    
    $(document).ready(function() {
      setupMenu();
    });
      