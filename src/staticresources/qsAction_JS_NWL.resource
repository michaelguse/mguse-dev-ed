/**
* qsAction_JS_NEL
*
* Widget for action to be used in other components
*
* This widget sends clicked event if enabled and nothing if disabled
*
* it triggers "qs_actionstart_action" custom event when enabled and clicked on
*
* @author: Alex Shekhter
* @version: 1.0 - initial implementation.
*/
(function($) {  
  
  $.widget( "nwl.qs_action", {

    options: {
    	title: null,
    	enabled_css: "action_enabled",
    	disabled_css: "action_disabled",
    },

    _create: function() {

    	this.element.html( "<a href='#'>" + this.options.title + "</a>" );
    	this.ahref = $(this.element.find( "a" ));
    	this.element.bind( "click", $.proxy( this._onClick, this ) );
    },

    enable: function() {
    	console.log( '--->>> nwl.qs_action:: enable();', this.ahref );
    	this.ahref.addClass(  this.options.enabled_css );
	   	this.ahref.removeClass( this.options.disabled_css );
    },

    disable: function() {
    	console.log( '--->>> nwl.qs_action:: disable();', this.ahref );
    	this.ahref.addClass( this.options.disabled_css );
    	this.ahref.removeClass( this.options.enabled_css );
    },

    _onClick: function( event ) {
    	if ( this.ahref.hasClass( this.options.enabled_css ) ) {
    		this._trigger( "start_action", this, this.options.title );
    	}
    },

});

})(jQuery);