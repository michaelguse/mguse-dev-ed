public class RestJsonController {
 
    public String geoAddress {get;set;}
    public String address {get;set;}
    public String city {get;set;}
    public String state {get;set;}
    public Boolean useGoogle {get;set;}
    public String Zipcode {get;set;}
    public String Country {get;set;}
 
    // method called by the Visualforce page's submit button
    public PageReference submit() {
 
        if (address.length() == 0) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Address cannot be blank'));
        }
        if (city.length() == 0) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'City cannot be blank'));
        }
        if (state.length() == 0) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'State cannot be blank'));
        }
 
        if (!ApexPages.hasMessages())
            geoAddress = getAddress(address,city,state,Zipcode,Country);
 
        return null;
    }
 
    // call the geocoding service
    public String getAddress(String street, String city, String state, String Zipcode, String Country) {
 
        String jsonresp;
 
        // hard-coded returned JSON response from Google
        if (useGoogle) {
            jsonresp = '{"results" : [ { "address_components" : [ { "long_name" : "1600", "short_name" : "1600", "types" : [ "street_number" ] }, { "long_name" : "Amphitheatre Parkway", "short_name" : "Amphitheatre Pkwy", "types" : [ "route" ] }, { "long_name" : "Mountain View", "short_name" : "Mountain View", "types" : [ "locality", "political" ] }, { "long_name" : "Santa Clara County", "short_name" : "Santa Clara County", "types" : [ "administrative_area_level_2", "political" ] }, { "long_name" : "California", "short_name" : "CA", "types" : [ "administrative_area_level_1", "political" ] }, { "long_name" : "United States", "short_name" : "US", "types" : [ "country", "political" ] }, { "long_name" : "94043", "short_name" : "94043", "types" : [ "postal_code" ] } ], "formatted_address" : "1600 Amphitheatre Parkway, Mountain View, CA 94043, USA", "geometry" : { "location" : { "lat" : 37.4217913, "lng" : -122.0837139 }, "location_type" : "ROOFTOP", "viewport" : { "northeast" : { "lat" : 37.42314028029149, "lng" : -122.0823649197085 }, "southwest" : { "lat" : 37.4204423197085, "lng" : -122.0850628802915 } } }, "types" : [ "street_address" ] } ], "status" : "OK" }';

        // call the geocoding service live
        } else {
 
            HttpResponse res = null;
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setMethod('GET');
            req.setEndpoint('https://maps.googleapis.com/maps/api/geocode/json?address='
                 + EncodingUtil.urlEncode(street,'UTF-8')+',+'
                 + EncodingUtil.urlEncode(city,'UTF-8')+',+'
                 + EncodingUtil.urlEncode(state,'UTF-8')+',+'
                 + EncodingUtil.urlEncode(Zipcode,'UTF-8')+',+'
                 + EncodingUtil.urlEncode(Country,'UTF-8')
                 +'&output=json&sensor=false');
            
            res = http.send(req);
            jsonresp = res.getBody().replace('\n', '');
        }
 
        return toGeoResult(jsonresp).toDisplayString();
    
    }
 
    // utility method to convert the JSON object to the inner class
    private GeoResult toGeoResult(String resp) {
 
        GeoResult geo = new GeoResult();
 
        try {

            Map<String, Object> respM = (Map<String, Object>)JSON.deserializeUntyped(resp);
			List<Object> resultsL = (List<Object>)respM.get('results');
			Map<String, Object> resultsM = (Map<String, Object>)resultsL[0];
            
			String address = (String)resultsM.get('formatted_address');
            String statusCode = (String)respM.get('status');
            
            Map<String, Object> geometryM = (Map<String, Object>)resultsM.get('geometry');
            Map<String, Object> location = (Map<String, Object>)geometryM.get('location');
            Decimal lat = (Decimal)location.get('lat');
            Decimal lng = (Decimal)location.get('lng');
 			
            geo.address = address;
            geo.statusCode = statusCode;
 
            // set the coordinates - they may either be integers or doubles
            geo.coordinate1 = lat.toPlainString();
            geo.coordinate2 = lng.toPlainString();
            geo.coordinate3 = '';

            System.debug('~~~~~~~~~~~~~~~~~~ coordinate1 ~~~~~~~~~~~~~~~~~~~~' + geo.coordinate1);
            System.debug('~~~~~~~~~~~~~~~~~~ coordinate2 ~~~~~~~~~~~~~~~~~~~~' + geo.coordinate2);
            System.debug('~~~~~~~~~~~~~~~~~~ coordinate3 ~~~~~~~~~~~~~~~~~~~~' + geo.coordinate3);
 
        } catch (Exception e) {
            // #fail
            System.debug(e);
        }
 
        return geo;
    }
 
    // inner class
    private class GeoResult {
 
        public String statusCode;
        public String coordinate1;
        public String coordinate2;
        public String coordinate3;
        public String address;
        public String Zipcode;
        public String Country;
        public String toDisplayString() {
            return address + ' ['
            + coordinate1 + ', '
            + coordinate2 + ', '
            + coordinate3 + '] - Status: '
            + statusCode;
        }
 
    }
 
}