/**
* nwl_qs_dialog.js
*
* Widget for NWL Quick Search Dialog
*
* @author: Alex Shekhter
* @version: 1.0 - initial implementation.
*/
(function($) {  
  
  $.widget( "nwl.qs_dialog", {

    options: {
      //
      // array hashes @see nwl_qsearch.js options.meta:
      //   { field: "name", title: "Col Ttitle", type: "text", width: 0 }  
      //
      enableClose: true,
      activeSearchMeta: null, 
      inactiveSearchMeta: null,
      height: 350,
      activeSearchHeight: 250,
      left: 185,
    },
    
    _create: function() {
      this.contentWrapper = $(this.element.append( "<div/>" ).find( "div" )[ 0 ]);
      this.contentWrapper.css( "height", "100%" );
      this.activeSearch = $(this.contentWrapper.append( "<div/>" ).find( "div" )[ 0 ]);
      this.activeSearch.css( {
        "height": this.options.activeSearchHeight,
        "margin-bottom": 5,
        "overflow": "auto",
        "display": "block",  
        "background-color": "#FFFFF2",
      });
      this.inactiveSearch = $(this.contentWrapper.append( "<div/>" ).find( "div" )[ 1 ]);
      this.inactiveSearch.css( { "background-color": "#F2FFFF", });

      this.element.dialog({
        autoOpen:   false,
        height:     this.options.height,
        width:      $.proxy( this.width, this ),
        modal:      true,
        hide:       "slide",
        show:       "slide",
        resizable:  false,
        closeOnEscape: this.options.enableClose,
      })
      .dialog( "widget" )
      .find( ".ui-dialog-titlebar" ).css({
        "float" : "right",
        border: 0,
        padding: 0,
        margin: 0
      })
      .find( ".ui-dialog-title").css({
        display: "none"
      })
      .end();
      var closeEl = $(this.element.dialog( "widget" ).find( ".ui-dialog-titlebar-close" )[ 0 ]);
      if ( this.options.enableClose )
        closeEl.css({
          top: 0,
          right: 0,
          margin: 0,
          "z-index": 999
        });
      else
        closeEl.css({
          display: "none"
        });

      console.log( '--->>> qsDialog_JS_NWL:: this.')
      this.activeSearch.qsearch( { 
        "meta": this.options.activeSearchMeta, 
        "SEARCH_EVENT" : $.proxy( this._searchPanelSearchEvent, this ),
      } );
      this.inactiveSearch.qsearch( { 
        "meta": this.options.inactiveSearchMeta, 
        "SEARCH_EVENT" : $.proxy( this._searchPanelSearchEvent, this ),
      } );

      //this.inactiveSearch.click( $.proxy( this._switchSearches, this ) );
      this.activeSearch.click( $.proxy( this._searchPanelFocus, this ) );
      this.inactiveSearch.click( $.proxy( this._searchPanelFocus, this ) );

      this.element.bind( "qsearchfocus", $.proxy( this._searchPanelFocus, this ) );
      this.element.bind( "qsearchdata_row_clicked", $.proxy( this._dataRowClicked, this ) );
      this.element.bind( "qsearchsingle_row_selected", $.proxy( this._singleRowSelected, this ) );
    },

    _searchPanelFocus: function( event, ui ) {
      //console.log( event );
      var o = ( event.type == "qsearchfocus" ) ? $(ui.el[ 0 ]) : $(event.currentTarget);
      //console.log( o.height() );
      if ( o.height() <= this.element.height()/3 ) { 
        var upperH = this.activeSearch.height();
        this.activeSearch.height( this.inactiveSearch.height() );
        this.inactiveSearch.height( upperH);
      }
      event.stopPropagation();
      return null;
    },

    _searchPanelSearchEvent: function( event, ui ) {
      console.log( '--->>> qsDialog_JS_NWL::_searchPanelSearchEvent()...', ui );
      this._trigger( "SEARCH_EVENT", null, ui );
    },

    _dataRowClicked: function( event, ui ) {
      this._trigger( "DATA_ROW_CLICKED", null, ui );
    },

    _singleRowSelected: function( eevent, ui ) {
      this._trigger( "SINGLE_ROW_SELECTED", null, ui );
    },

    _switchSearches: function() {
      var self = this;
      
      var iasHtml = this.inactiveSearch.html();
      var asHtml = this.activeSearch.html();

      console.log( "activeSearch HTML", asHtml );
      console.log( "inactiveSearch HTML", iasHtml );
      
      var finish = function( $sel, html, bg ) {
        $sel.html( html );
        $sel.css( "background-color", bg );
        $sel.animate( 
          { left: "+=50", opacity: 1 }, 
          { duration: 400, queue: false } 
        );
        $sel.qsearch( "refresh" );
      }

      var iaBg = "" + this.inactiveSearch.css( "background-color" );
      var aBg = "" + this.activeSearch.css( "background-color" );
      this.activeSearch.animate( 
        { left: "+=50", opacity: 0 },
        { 
          duration: 400, queue: false, complete: function() {
            finish( self.activeSearch, iasHtml, iaBg );
          }
        }
      );

      this.inactiveSearch.animate(
        { left: "+=50", opacity: 0 }, 
        { duration: 400, queue: false, complete: function() { 
            finish( self.inactiveSearch, asHtml, aBg ); 
          } 
        }
      );
    },

    _setOption: function( key, value ) {
      this.element.dialog( "option", key, value );
    },

    open: function() {
      this.element.dialog( "open" );

      var cssv = function( el, attr ) {
        var res = el.css( attr ).replace( /[^\d]/g, "" );
        res = ("" + res == "") ? 0 : res;
        return res;
      }

      this.inactiveSearch.height( 
        this.element.height()
        - this.activeSearch.outerHeight( true )
        - cssv( this.activeSearch, "margin-bottom" )
        - cssv( this.inactiveSearch, "border-bottom" )
        - cssv( this.inactiveSearch, "border-top" )
        - cssv( this.inactiveSearch, "padding-bottom" )
        - cssv( this.inactiveSearch, "padding-top" )
        - cssv( this.inactiveSearch, "margin-bottom" )
        - cssv( this.inactiveSearch, "margin-top" )
      );
      this.inactiveSearch.css({
        "overflow": "auto",
        "display": "block",  
      });

    },

    prepareSearchForObjId: function( ObjId, ObjType ) {
      var json = this.activeSearch.qsearch( "prepareSearchForObjId", ObjId, ObjType );
      json.mode = "add";
      this._searchPanelSearchEvent( null, json );
    },

    width: function() {
      this.element.width( 
      	$(document).width() - parseInt( this.options.left ) - 10 
      );
      this.activeSearch.css( "width", this.element.width() - 20 );
      this.inactiveSearch.css( "width", this.element.width() - 20 );
    },
  
    // json - search result set
    // mode - null; '' or 'add'
    setActiveData: function( json, mode ) {
      this.activeSearch.qsearch( "setData", json, mode );
    },

    // json - search result set
    // mode - null; '' or 'add'
    setInactiveData: function( json, mode ) {
      this.inactiveSearch.qsearch( "setData", json, mode ); 
    },

  });

})(jQuery);
