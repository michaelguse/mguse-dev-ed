/**
 * Javascript Widget for the CSR Status 
 * @param  {[type]} $
 * @return {[type]}
 *
 * @author: Harshal 
 * @version: 1.0 - initial implementation. 
 */

(function($) {  

	$.widget( "nwl.csrStatusButton", {

		options: {
			onChangeCb: null,
		},

		myPublicMethod: function( p1, p2 ) {
			// return "got params p1=[" + p1 + "]; p2=[" + p2 + "]";	
		},

		_create: function() {
			var self = this;

			this.element.button()
			.click(function() {
				var menu = $( this ).parent().next().show().position({
					my: "left top",
					at: "left bottom",
					of: this
				});
				$( document ).one( 
					"click", function() { menu.hide(); });
				return false;
			})
			.parent()
			.buttonset()
			.next()
			.hide()
			.menu({
				select: function(event, ui) {
					jFnSetBtnStatusVal( self.element, ui.item.text() );								
				}
			});
			/**
			 * [jFnUpdateStatus description]
			 * @param  {[type]} status [description]
			 * @return {[type]}        [description]
			 */
			function jFnUpdateStatus( status ) {
				if ( self.options.onChangeCb == null ) {
					console.error( "nwl.csrStatusButton please specify onChangeCb option..." );
				}
				self.options.onChangeCb( status );
			}
			/**
			 * [jFnSetBtnStatusVal description]
			 * @param  {[type]} selector
			 * @param  {[type]} status
			 * @return {[type]}
			 */
			var jFnSetBtnStatusVal = function( selector, status ) {
					// if ($(selector).text() != status) { 
						// Remove existing CSS class 
						var styleClasssRemoveVar = 'nwl-status-' + $(selector).text().replace( /\s+/g, "" );
						console.log( '>>--> CSS Class to remove :', styleClasssRemoveVar );
						$(selector).removeClass( styleClasssRemoveVar )
						// Add new CSS class	
						var styleClassAddVar = 'nwl-status-' + status.replace( /\s+/g, "" );
						console.log( '>>--> CSS Class to Add : ', styleClassAddVar );
						$(selector).addClass( styleClassAddVar );
						// Set the text for the button from the menu value selected	
						$(selector).text( status );	
						// Update User Object with status via controller
						jFnUpdateStatus( status );	
					}

					jFnSetBtnStatusVal( self.element, self.element.text() );	
				},

			});

})(jQuery);	