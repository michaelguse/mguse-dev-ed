public class WebSvcCallout {
    public static String callEchoString(String input) {
        docSample.DocSamplePort sample = new docSample.DocSamplePort();
        sample.endpoint_x = 'http://api.salesforce.com/foo/bar';
        
        // This invokes the EchoString method in the generated class
        String echo = sample.EchoString(input);
        
        return echo;
    }   
}