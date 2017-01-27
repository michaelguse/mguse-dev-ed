/**
* utils_JS_NWL.js
*
* Small reusable functions to be used in various places in the project
*/
window.nwl = window.nwl || {};

nwl.utility = (function($) {

	// 
	//   SFDC related helpers
	// 
  var sfdc_ = (function() {
    
    return {
      isCaseObject: function( objId ) {
        return ( objId != null ) ? objId.startsWith( "500" ) : false;
      },
      isContactObject: function( objId ) {
        return ( objId != null ) ? objId.startsWith( "003" ) : false;
      },
      isAccountObject: function( objId ) {
        return ( objId != null ) ? objId.startsWith( "001" ) : false;
      },
      isProductObject: function( objId ) {
        return (objId != null ) ? objId.startsWith( "01t" ) : false;
      },
      //
      // --- apply some action on the focused tab for particular object type
      //
      applyActionOnFocusedTab: function( 
        data, objectTypeCallback, foundCallback, notFoundCallback 
      ) {
        console.log( 
          '--->>> nwl.utility.sfdc.applyActionOnFocusedTab() ', 
          data, 
          objectTypeCallback,
          foundCallback,
          notFoundCallback
        );
        sforce.console.getFocusedPrimaryTabObjectId( function( result ) {
          if ( objectTypeCallback( result.id ) ) {
            foundCallback( data, result );
          }
          else {
            sforce.console.getFocusedSubtabObjectId( function( res ) {
              if ( objectTypeCallback( res.id ) ) {
                foundCallback( data, res );
              }
              else { // cannot find focused tab....
                if ( notFoundCallback ) notFoundCallback( data );
              }
            }); 
          }
        });
      },


      //
      // --- Find tab based on the object ID
      //
      findConsoleTabByObjectId: function( objId, context ) {
        var self = this;

        function subTabIdCb( idx, tabId ) {
          sforce.console.getPageInfo( tabId, function subTabPageInfoCb( pi ) {
              console.log( '--->>> subTabIdCb() pi', pi );
              var info = JSON.parse( pi.pageInfo );
              if (  objId.startsWith( info.objectId ) ) {
                var res = {};
                res.tabId = tabId;
                res.subTab = info;
                res.context = context;
                $.event.trigger({
                  type: serviceEventsEnum.E_TAB_FOUND,
                  message: res
                });
                return false;
              }
              return true;
            });
        }

        function subTabIdsCb( tabs ) {
          $.each( tabs.ids, subTabIdCb );
        } 

        function primaryTabIdCb( idx, tabId ) {
          sforce.console.getPageInfo( tabId, function pageInfoCb( pi ) {
            console.log( '--->>> primaryTabIdCb() pi', pi );
            var info = JSON.parse( pi.pageInfo );
            if (  objId.startsWith( info.objectId ) ) {
              var res = {};
              res.tabId = tabId;
              res.primaryTab = info;
              res.context = context;
              $.event.trigger({
                type: serviceEventsEnum.E_TAB_FOUND,
                message: res
              });
              return false;
            }
            return true;
          });
          sforce.console.getSubtabIds( tabId, subTabIdsCb );
        }

        function primaryTabIdsCb( tabs ) {
          $.each( tabs.ids, primaryTabIdCb );
        }


        sforce.console.getPrimaryTabIds( primaryTabIdsCb );
      },
    }
  })();


  //
  // Custom Events used in NWL console implementation
  // 
  var serviceEventsEnum = (function(){
  	return {
      'E_TAB_FOUND' : 'E_TAB_FOUND',

  		'E_CASE_FOCUSED' : 'E_CASE_FOCUSED',
  		'E_CASE_REFRESHED' : 'E_CASE_REFRESHED',
      'E_CASE_CHANGED': 'E_CASE_CHANGED',

      'E_ACCOUNT_CHANGED': 'E_ACCOUNT_CHANGED',

      'E_CONTACT_CHANGED': 'E_CONTACT_CHANGED',
  	}
  })();

  return {
  	sfdc: sfdc_, 
  	serviceEvent: serviceEventsEnum,
    url: {
      getParam: function( lochref, paramName ) {
        var v = null;
        var pairs = lochref.split( '&' );
        $.each( pairs, function( idx, p ) {
          if ( pairs.indexOf( paramName + '=' ) ) {
            v = p.replace( /^.*=/, '' );
            console.log( '--->>> utils_JS_NWL::getParam() paramName ' + paramName + '; v=' + v + ';' );
            return false;
          }
        });
        return v;
      },
    },
  }
  
})(jQuery);
