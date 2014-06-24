# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

tinymce.init({
	mode: 'textareas',
	selector : "#category_text",
	plugins: "uploadimage,code,image",
	theme_advanced_buttons3 : "uploadimage,image",
 });
