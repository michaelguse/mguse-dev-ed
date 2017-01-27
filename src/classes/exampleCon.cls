public class exampleCon {

    Long prevprevCount = 0;
    Long prevCount = 1;
    Long count = 1;
    Integer step = 0;
                        
    public PageReference incrementCounter() {

            prevprevCount = prevCount;
            prevCount = count;
            count = prevprevCount + prevCount;
            step++;
               
            return null;
    }
                        
    public Long getCount() {
        return count;
    }

    public Integer getStep() {
        return step;
    }

}