jQuery(document).ready(function(){
  
  jQuery("span.people").click(function() {
    jQuery(this).parent().next().slideToggle();
  });
  
    
});
