// This is a manifest file that"ll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin"s vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It"s not advisable to add code directly here, but if you do, it"ll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(document).ready(function(){
  $(".word-list").hide();
  $(".word-list:first").show();
  $(".submit-answer").hide();
  $(".count").html("1/20")
  $num = 1;
  $(".choose").click(function(){
    $num++;
    $(".count").html($num+"/20")
    if ($num <= 20){
      $(".word-list:visible").hide().next().next().show();
      if($num == 20){
        $(".submit-answer").show();
        $(".choose").hide();
      }
    }
  return false;
  });
}); 
