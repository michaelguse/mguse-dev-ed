/* =================================================================
**
** Global for the page
**
** ================================================================= */
html, body {
	padding: 0px;
	margin: 0px;
	height: 100%;
	font: 0.5em;
}

/* ==================================================================
**
**  Service Console Context Manager (Workspace) formatting.
**
**  Page visually divided into ContextManager panel at the left
**  and list of cases on the right.
**
** ================================================================== */
#cm_wrapper {
	padding-right: 5px;
	overflow: hidden;
	height: 100%;
}

#cm_cases {
	margin: 0 -180px 0 auto; 
	width: 100%; 
	float: right; 
	border: 1px solid #bbb;
}

#cm_panel {
	width: 169px; 
	float: left; 
	height: 100%;
	border: 1px solid #bbb;
	overflow: hidden;
	text-align: center;	
}
/***
.nwl-cm-wrapper{
	width: 100%;
	height: 100%;
	margin: 0 auto;
}	
.nwl-cm-wrap-cases {
	float: left;
	width: 100%;
	height: 100%; 
}
.nwl-cm-cases {
	margin-left: 177px;
	border: 1px solid #bbb; 
	height: 100%;	
}	
.nwl-cm-panel {
	float: left;
	width: 169px;
	margin-left: -100%;
	border: 1px solid #bbb; 
	height: 100%;
	text-align: center;
}
****/
/* ==================================================================
**
** Formating of the elements inside Context Manager Panel div
**
** ================================================================== */

#cm_user_status_wrapper .ui-menu { 
	position: absolute; 
	width: 94px;
}
#cm_user_status_wrapper .ui-button{ 
	width: 100px; 
	height: 30px;
}	
/* ==================================================================
**
** CSR status related styles. Used inside Context Manager Panel
**
** ================================================================== */
.nwl-status-Busy{ 
	background: orange; 
	color: black; 
}	
.nwl-status-Available{ 
	background: green; 
	color: white; 
}	
.nwl-status-AuxOut{ 
	background: yellow; 
	color: black; 
}	
.nwl-status-SignedOff{ 
	background: red; 
	color: white; 
}	
.nwl-case-btn{
	margin-top: 20px;
	margin-left: 10px;
	width: 100px; 
	height: 30px;
}			

#brand_logo_wrapper {
	margin-top: 1.5em;
}


/* ==================================================================
**
** Quick Search dialog and search panels related
**
** ================================================================== */

/*** quick search dialog ***/
#quick_search_dlg{
	padding: 	0;
}

/*** tabs panel ***/
.ui-tabs .ui-tabs-panel {
	padding: 	0;
}

/*** qs tabs header ***/
.ui-tabs .ui-tabs-nav {
	margin: 	0;
	padding: 	0;
	background: 	none;
	border: 	0;
}

/*** qs active/inactive tabs ***/
.ui-tabs .ui-tabs-nav li.ui-tabs-active {
	margin-bottom: 0px;
	padding-bottom: 1px;
	background: white;
	border-top: 1px solid #c8c8c8;
	border-left: 1px solid #c8c8c8;
	border-right: 1px solid #c8c8c8;
	border-bottom: none;
	border-radius: 0 !important;
	margin-right:-1px;
}

.ui-tabs .ui-tabs-nav li{
	margin-bottom: 0px;
	padding-bottom: 1px;
	background: #f0f2f2;
	border-top: 1px solid #c8c8c8;
	border-left: 1px solid #c8c8c8;
	border-right: 1px solid #c8c8c8;
	border-bottom: none;
	border-radius: 0 !important;
	margin-right:-1px;
}

/*** ui tabs anchor ***/
.ui-tabs .ui-tabs-nav li a {
	outline:none !important;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color:#1c1c1c;
}

#qsTabs a{
	outline:none !important;
}
#qsTabs li{
	outline:none !important;
}
/*** qs tabs ***/
#qsTabs{
	border: 	0;
	height: 	100%,  
}
/*** search table ***/
.nwl_qs_table {
  width:            10;
  padding:          0;
  margin:           0;
  border-collapse:  collapse;
  table-layout:     fixed;
  border:           1px solid #AAAAAA;
}

.nwl_qs_table tr:not(:first-child) {
  border-collapse:  collapse;
} 

/*** rule row */
.nwl_qs_table tr:first-child {
  padding: 0;
  margin: 0;
  height: 0;
}
/*** search row ***/
.nwl_qs_table tr:nth-child(2) {
  font-weight: bold;
}

/***.nwl_qs_table tr:nth-child(2) td:first-child {***/
.nwl_qs_table tr:nth-child(2) td {
  vertical-align: top;
}

.nwl_qs_table tr:first-child td {
  table-layout:     fixed;
  overflow:         hidden;
  padding: 0;
  margin: 0;
  border: none;
}

.nwl_qs_table td {
  border-collapse:  collapse;
  border:           1px solid #AAAAAA;
  overflow:         hidden;
  text-overflow:    ellipsis;
  white-space:      nowrap;
}

.nwl_qs_table td:not(:first-child) input {
  width: 100%;
}

.nwl_qs_highlighted_row {
	background-color: lightblue;
}

label.nwl_qs_fuzzy_enabled {
  color:            black;
}

label.nwl_qs_fuzzy_disabled {
  color:            silver;
}

div.result_set_too_big_warning {
	color: red;
	font-weight: bold;
	text-align: center;
}

div.search_object {
	width: 100%;
	text-align: center;
}

/***
*
* qucik search action classes
*
***/
div.action_wrapper {
	width: 100%;
	text-align: center;
	margin-top: 0.2em;
}

div.action_wrapper a {
	margin-left:auto;
	margin-right:auto;
    display: block;		

   border-radius: 4px;
//   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   text-decoration: none;
   vertical-align: middle;
   width: 90%;
}

div.action_wrapper a.action_enabled {
	background-color: lightblue;
	color: black;
}

div.action_wrapper a.action_enabled:hover {
   border-top-color: #28597a;
   background: #28597a;
   color: white;
}

div.action_wrapper a.action_disabled {
	/***background-color: ;***/
	color: silver;
}
