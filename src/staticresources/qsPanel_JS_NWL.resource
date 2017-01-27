/**
*  nwl_qsearch.js
*
*  widget to manage quick search conditions and results
*
*  This widget will trigger event "SEARCH_EVENT" with the following
*  data object:
*
*    {
*       sobjectName: "Contact",
*       searchType: and|or|fuzzy,   // and - precise search; or - non precise; fuzzy - non precise + fuzzy
*       conditions [
*         sObjFieldName: cond1,
*         sObjFieldName: cond2 
*       ]
*    }
*
* @author: Alex Shekhter
* @version: 1.0 - initial
*/
(function($) {  
  
  $.widget( "nwl.qsearch", {

    options: {
      //
      //// information about our search
      //
      // meta:  
      // {
      //  sobjectName: Contact  
      //  maxResultSetSize: 50
      //  selectableResults: none|single|multi 
      //  actions: [],   // action elements
      //  searchMeta: [ 
      //    { 
      //      field: "SObjFieldName",
      //      title: "Column Title", 
      //      type: "hidden"|"input"|"text", 
      //      width: 0, 
      //    },
      //    ...
      //    {
      //      field: "SObjFieldName",
      //      title: "Column Title", 
      //      type: "hidden"|"input"|"text", 
      //      width: 0, 
      //    },
      // ]
      //
      meta: null, 
      waitTime: 200, // Wait time until SEARCH_EVENT will be triggered

      tableCssClass:             "nwl_qs_table",
      enabledFuzzyLabelCssClass: "nwl_qs_fuzzy_enabled",
      disabledFuzzyLabelCssClass: "nwl_qs_fuzzy_disabled",
      highlitedRowClass: "nwl_qs_highlighted_row",
    },

    /**
    * _rulerRowHtml
    */
    _rulerRowHtml: function() {
      var self = this;
      var res = "<tr>";
      $.each( this.options.meta[ "searchMeta" ], function( i, m ){
        res += '<td style="width: ' 
          + (( m.width == "0" || m.width == null ) ? "10em" : m.width)
          + ';"></td>';
      });
      res += "</tr>";
      return res;
    },

    /**
    * _searchCellHtml
    */
    _searchCellHtml: function( meta ) {
      return "<td>"
            + (
                ( meta[ "type" ] == "input" ) ? 
                  "<input type=\"edit\" placeholder=\"" + meta[ "title" ] + "\">" 
                : 
                meta[ "title" ]
              ) 
            + "</td>";
    },

    /**
    * _searchRowHtml
    */
    _searchRowHtml: function() {
      var self = this;
      var res = "<tr>";
      $.each( this.options.meta[ "searchMeta" ], function( i, m ){
        if ( i == 0 ) {
          res += self._searchTypeHtml();
        }
        else {
          res += self._searchCellHtml( m );
        }
      });
      res += "</tr>";
      return res;
    },

    /**
    * _searchTypeHtml - method to construct html for choosing search type
    */
    _searchTypeHtml: function() {
      var res = "<td>"
        + "<input type=\"checkbox\" value=\"precise\"><label>Precise</label>"
        + "<input type=\"checkbox\" value=\"fuzzy\"><label>Fuzzy</label>"
        + "<div class=\"search_object\">Search " + this.options[ "meta" ][ "sobjectName" ] + "</div>"
        + "<div class=\"result_set_too_big_warning\"/>"
        + "</td>";
      return res;
    },

    /**
    * _linkSelectorPropsToDOM - 
    */
    _linkSelectorPropsToDOM: function() {
      this.table = $(this.element.find( "table" )[ 0 ]);
      this.searchRow = $(this.table.find( "tr:nth-child(2)" )[ 0 ]);
      var srcTypeTd = $(this.searchRow.find( "td:first" ));
      
      this.preciseCb = $(srcTypeTd.find( ":first" ));
      this.fuzzyCb = $(srcTypeTd.find( ":nth-child(3)" ));
      this.fuzzyLabel = $(srcTypeTd.find( "label:nth-child(4)" ));
      
      this._setSearchTypeState();
      // events for search type
      this.preciseCb.click( $.proxy( this._clickPreciseCb, this ) );
      this.fuzzyCb.click( $.proxy( this._clickFuzzyCb, this ) );
    },

    /**
    * _setSearchTypeState
    */
    _setSearchTypeState: function() {
      this.preciseCb.attr( "checked", this.isPrecise );
      if ( this.isPrecise ) {
        this.fuzzyLabel
          .removeClass( this.options.enabledFuzzyLabelCssClass )
          .addClass( this.options.disabledFuzzyLabelCssClass );
        this.isFuzzy = false;
      }
      else {
        this.fuzzyLabel
          .removeClass( this.options.disabledFuzzyLabelCssClass )
          .addClass( this.options.enabledFuzzyLabelCssClass );
      }
      this.fuzzyCb.attr( "disabled", this.isPrecise ).attr( "checked", this.isFuzzy );
    },

    /**
    * _preciseSearch
    */
    _preciseSearch: function() {
      var preciseCriteria = "";
      var meta = this.options.meta[ "searchMeta" ];
      for ( var i = 2; i <= this.lastColWithSearchCriteria; i++ ) {
        preciseCriteria += this._searchCellHtml( meta[ i ] );
      }
      var firstCol = this.searchRow.find( "td:nth-child(2)" );
      firstCol.attr( "colspan", 1 ).after( preciseCriteria );
      firstCol.find( "input" ).attr( "placeholder", meta[ 1 ].title ) 
        .val( '' );
    },

    /**
    * _nonPreciseSearch
    */
    _nonPreciseSearch: function() {
      var colspanVal = parseInt( this.lastColWithSearchCriteria );
      var placeholder = [];
      for ( var i = 1; i <= colspanVal; i++ ) {
        var m = this.options.meta[ "searchMeta" ][ i ];
        if ( m.type == "input" ) placeholder.push( m.title ); 
      }
      //console.log( "placeholder", placeholder );
      var fld = $(this.searchRow.find( "td:nth-child(2)" ));
      fld.attr( "colspan", colspanVal );
      fld.find( "input" ).attr( "placeholder", "" + placeholder.join( "," ) ).val( '' );
      this.searchRow.find( "td" ).slice( 2, this.lastColWithSearchCriteria + 1).remove();

    },

    /**
    * _clickPreciseCb
    */
    _clickPreciseCb: function( event ) {
      var el = $(event.target);
      this.isPrecise = el.is( ":checked" );
      if ( this.isPrecise ) {
        this._preciseSearch();
      }
      else {
        this._nonPreciseSearch();
      }
      this._setSearchTypeState();
      event.stopPropagation();
      return null;
    },

    /**
    * _clickFuzzyCb
    */
    _clickFuzzyCb: function( event ) {
      var el = $(event.target);
      this.isFuzzy = el.is( ":checked" );
      if ( this.isFuzzy ) {
        this.isPrecise = false;
      }
      else {
        this._nonPreciseSearch();
      }
      event.stopPropagation();
      return null;
    },

    /**
    * _setTableWidth
    */
    _setTableWidth: function() {
      var self = this;
      var w = 0;
      $.each( this.options.meta[ "searchMeta" ], function( i, m ) {
        w += parseInt( m.width.replace( /[^\d]/g, "" ) );
      });
      this.table.css( "width", w + "em" );
    },

    /**
    * _findLastColWithSearchCriteria
    */
    _findLastColWithSearchCriteria: function() {
      var meta = this.options.meta[ "searchMeta" ];
      for ( var i = meta.length - 1; i >= 0; i-- ) {
        if ( meta[ i ].type == "input" ) {
          this.lastColWithSearchCriteria = i;
          break;
        }
      }
    },

    /**
    * _highLightRow
    */
    _highLightRow: function( row ) {
      console.log( '--->>> qsPanel_JS_NWL::_highLightRow() row', row, this.currentHighlightedRow );
      if ( this.currentHighlightedRow != null ) {
        this.currentHighlightedRow.removeClass( this.options.highlitedRowClass );
      }
      this.currentHighlightedRow = row;
      this.currentHighlightedRow.addClass( this.options.highlitedRowClass );
    },

    /**
    * _create
    */
    _create: function() {
      var self = this;
      
      // Class properties placeholder
      this.table = null;
      this.searchRow = null;

      this.isPrecise = true;
      this.isFuzzy = false;
      this.preciseCb = null;
      this.fuzzyCb = null;
      this.fuzzyLabel = null;

      this.lastColWithSearchCriteria = -1;

      this.currentHighlightedRow = null;

      this._findLastColWithSearchCriteria();

      this.element.append(
        "<table class=\"" + this.options.tableCssClass + "\">"
        + this._rulerRowHtml()
        + this._searchRowHtml()
        + "</table>" 
      );
      this._linkSelectorPropsToDOM();
      this._setTableWidth();

      // Actions if available:
      var srcTypeTd = $(this.searchRow.find( "td:first" ));
      console.log( '--->>> qsPanel_JS_NWL::_create adding actions... to ' + srcTypeTd.html() );
      $.each( this.options.meta.actions, function( idx, act ) {
        console.log( "--->>> qsPanel_JS_NWL:: action ", idx, $(act) );
        srcTypeTd.append( act );
      } );


      this.searchRow.delegate( 
        "input[type=edit]", "click", $.proxy( this._searchCriteriaClick, this ) );
      this.searchRow.delegate( 
        "input[type=edit]", "keyup", $.proxy( this._keyupEvent, this ) );
      this.table.delegate( 
        "input[type=radio]", "click", $.proxy( this._selectSingleRow, this ) );
//      this.element.delegate( "input", "focus", $.proxy( this._notifyContainerOnFocus, this ) );

      this.table.delegate( "tr[_type=data]", "click", $.proxy( this._dataRowClicked, this ) );
    },

    /**
    * _dataRowClicked
    */
    _dataRowClicked: function( event ) {
      //console.log( '--->>> qsPanel_JS_NWL::_dataRowClicked()', $(event.currentTarget), $(event.currentTarget).attr( "sfdc_id" ) );
      this._trigger( "DATA_ROW_CLICKED", null, $(event.currentTarget).attr( "sfdc_id" ) );
      this._highLightRow( $(event.currentTarget) );
      event.stopPropagation();
    },

    /**
    * _keyupEvent
    */
    _keyupEvent: function( event ) {
      //console.log( 'qsPanel_JS_NWL::_keyupEvent() event', event );
      //console.log( 'qsPanel_JS_NWL::_keyupEvent() val', $(event.currentTarget).val() );
      var ctrlEl = $(event.delegateTarget);
      var timer = ctrlEl.data( "timer" );
      //console.log( 'qsPanel_JS_NWL::_keyupEvent() timer', timer );
      if ( timer ) clearTimeout( timer );
      ctrlEl.data( 
        "timer", 
        setTimeout( 
          $.proxy( this._triggerSearchEvent, this ),  
          this.options.waitTime
        ) 
      );
    },

    /**
    * _getSearchConditionsMeta
    *
    * Function is responsible to filter out all 'hidden' and 'text' types from options[ 'searchMeta' ] array
    *
    */
    _getSearchConditionsMeta: function() {
      var res = new Array();
      $.each( this.options.meta[ 'searchMeta' ], function( idx, el ) {
        if ( el.type === 'input' ) res.push( el );
      });
      return res;
    },

    prepareSearchForObjId: function( objId, objectName ) {
      var res = {};
      res.sobjectName = objectName;
      res.conditions = new Array();
      var fc = {};
      fc[ this.options.meta.searchMeta[ 0 ].field ] = objId; 
      res.conditions.push( fc );
      res.searchType = "and";
      //alert( JSON.stringify( res ) );
      return res;
    }, 
    
    /**
    * _triggerSearchEvent
    */
    _triggerSearchEvent: function() {
      //console.log( '--->>> qsPanel_JS_NWL::_triggerSearchEvent()...' );
      var res = {};
      res[ "sobjectName" ] = this.options.meta[ "sobjectName" ];
      res[ "conditions" ] = new Array();
      var needToTrigger = false;
      var self = this;
      if ( this.isPrecise ) {
        res[ "searchType" ] = "and";
        var searchMeta = this._getSearchConditionsMeta();
        this.searchRow.find( "input[type=edit]" ).each(function( idx, el ){
          var fldMeta = searchMeta[ idx ];
          //console.log( '--->>> qsPanel_JS_NWL::_triggerSearchEvent() field: ', fldMeta );
          var v = $(el).val();
          if ( v ) {
            needToTrigger = true;
            var fc = {};
            fc[ fldMeta.field ] = v;
            res[ "conditions" ].push( fc );
          }
        });
      }
      else {
        res[ "searchType" ] = (self.isFuzzy) ? "fuzzy" : "or";
        var fc = {};
        fc[ "ALL" ] = this.searchRow.find( "input[type=edit]" ).val();
        if ( fc[ "ALL" ] ) needToTrigger = true;
        res[ "conditions" ].push( fc );
      }
      if ( needToTrigger ) {
        console.log( '--->>> qsPanel_JS_NWL::_triggerSearchEvent() res: ', res );      
        this._trigger( "SEARCH_EVENT", null, res );
      }
    },

    /**
    * _notifyContainerOnFocus
    */
    _notifyContainerOnFocus: function( event ) {
      this._trigger( "focus", event, { el: this.element } ); 
    },

    /**
    * _selectRow
    */
    _selectSingleRow: function( event ) {
      //alert( event.currentTarget );
      //$(event.currentTarget).attr( "checked", true );
      var id = $(event.currentTarget).val();
      this._trigger( "SINGLE_ROW_SELECTED", null, { "sobjectName": this.options.meta.sobjectName, "elId": id, } );
      this._highLightRow( $(event.currentTarget).parents( "tr" ) );
      event.stopPropagation();
    },

    /**
    * _searchCriteriaClick
    */
    _searchCriteriaClick: function( event ) {
      $(event.currentTarget).focus();
    },
    
    /**
    * refresh of the search panel. mostly means that we need to reinit and reset events
    */
    refresh: function() {
      this._linkSelectorPropsToDOM();
    },

    //
    // --- setData method...
    //
    //  @param: jsom - result set
    //  @param: mode - null, '', 'add'    
    //
    setData: function( json, mode ) {
      var self = this;
      var selType = self.options.meta[ "selectableResults" ];
      console.log( '--->>> qsPanel_JS_NWL::setData() json [', JSON.stringify( json ) );

      // we need to show warning if result set is too large...
      var records = json.length;
      var warnDiv = $(this.searchRow.find( "div.result_set_too_big_warning" ));
      console.log( '--->>> qsPanel_JS_NWL::setData() warnDiv ', warnDiv, this.options[ "meta" ], mode );
      if ( records >= this.options[ "meta" ][ "maxResultSetSize" ] ) {
        warnDiv.html( 'Please Narrow<br>Your Search...' );
      }
      else {
        warnDiv.html( '' );
      }  

      // New data rows html
      var rows = "";
      var ts = (new Date()).getTime();
      var randv = Math.random();

      if ( mode == "add" ) {
        var name = $(this.table.find( "input[type=radio]:first" )[ 0 ]).attr( "name" );
        if ( name ) {
          ts = name.replace( /^nwl_qs_radio_/, '' );
          randv = '';
        }
      }

      console.log( "--->>> qsPanel_JS_NWL::setData() typeof json", typeof json );
      $.each( json, function( i, row ) {
        console.log( "--->>> qsPanel_JS_NWL::setData() i=" + i, row );
        rows += "<tr _type=\"data\" sfdc_id=\"";
        var id = null;
        $.each( self.options.meta[ "searchMeta" ], function( j, m ) {
          if ( j == 0 ) {
            id = row[ m.field ];
            rows += row[ m.field ] + "\">";
          }
          else {
            if ( j == 1 &&  selType != null && selType != "none" ) {
              rows += "<td><span><input name=\"nwl_qs_radio_" + ts + randv + "\""
                + " type=\""+ ((selType == "single") ? "radio" : "checkbox")
                + "\" value=\"" + id + "\">" + row[ m.field ] + "</span></td>";
            }
            else { 
              rows += "<td>" + row[ m.field ] + "</td>";
            }
          }
        });
        rows += "</tr>";
      });
      console.log( "--->>> qsPanel_JS_NWL::setData() rows", rows );
      var rowspan = null;
      if ( mode == "add" ) {
        console.log( 'inserting first row...' + rows );
        rowspan = parseInt( this.searchRow.find( "td:first" ).attr( "rowspan" ) ) + 1;
        this.table.find( "tr:nth-child(2)" ).after( rows );
        //this.table.find( "input[type=radio]:first" ).prop( "checked", true );
        this._highLightRow( this.table.find( "tr:nth-child(3)" ) );
        this.element.scrollTop( 0 );
      }
      else  {
        rowspan = json.length + 1;
        this.table.find( "tr" ).slice( 2 ).remove();
        this.table.append( rows );
      }
      this.searchRow.find( "td:first" ).attr( "rowspan", rowspan );     
    },

  });

})(jQuery);
