/**
* qsSearchProcessor_JS_NWL
*
* Jquery plugin to process search requests from Dialogs and Panels and return them results back
* 
* @author: Alex Shekhter
* @version: 1.0 - initial
*/
(function($) {  
  
	$.widget( "nwl.qs_search_processor", {

	    options: {
	    	"eventName": null,
	    	"searchMetadata": null, // [ { sobject: "account", actionFunction: performSearch, targetPanel: panelJQselector }...]
	    },

	    _create: function() {

	    	this.currSearch = null;
	    	this.nextSearch = null;
	    	this.isSearchRunning = false;

	    	this.element.bind( this.options.eventName, $.proxy( this._processSearch, this ) );

	    },

	    _findTargetObject: function( sobjName ) {
	    	var resObj = null;
			$.each( this.options.searchMetadata, function( idx, meta ) {
				if ( meta.sobject == sobjName ) {
					resObj = meta;
					return false;
				}
			});
	    	return resObj;	
	    },

	    _callActionFunction: function( sobjName ) {
			//var af = this.options.actionFunction;
			var af = this._findTargetObject( sobjName ).actionFunction;
			console.log( '--->>> qs_search_processor::_processSearch() actionFunction: ', af, this.currSearch );
			af( this.currSearch );
	    },

	    _processSearch: function( event, ui ) {
	    	console.log( '--->>> qs_search_processor::_processSearch() event', event, 'ui', ui, this.isSearchRunning );
			var srchCond = JSON.stringify( ui );
			if ( !this.isSearchRunning ) {
				this.isSearchRunning = true;
			 	this.currSearch = srchCond;
				this.nextSearch = null;
				this._callActionFunction( ui.sobjectName );
			}
			else {
				this.nextSearch = srchCond;
			}
	    },

	    processSearchResult: function( resSet ) {
	    	console.log( '--->>> qs_search_processor::processSearchResult() isSearchRunning', this.isSearchRunning );
		    if ( this.isSearchRunning ) {
		    	this.isSearchRunning = false;  		
		    	var searchCondition = JSON.parse( this.currSearch );
		    	var jsonData = JSON.parse( resSet );
		    	var r = jsonData.data;
		    	console.log( '--->>> qs_search_processor::processSearchResult() r', r );
		    	var srchMeta = this._findTargetObject( searchCondition.sobjectName );
		    	srchMeta.targetPanel.qsearch( "setData", r, jsonData.mode );
		    }
		    if ( this.nextSearch != null ) {
		    	this.currSearch = this.nextSearch;
		    	this.nextSearch = null;
		    	this.isSearchRunning = true;
		    	var searchCondition = JSON.parse( this.currSearch );
				this._callActionFunction( searchCondition.sobjectName );
		    }
		    else {
		    	this.isSearchRunning = false;
		    }
	    },

	});

})(jQuery);

