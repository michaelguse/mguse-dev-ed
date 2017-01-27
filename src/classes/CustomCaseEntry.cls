public class CustomCaseEntry {

    public PageReference cancel() {
        return null;
    }


    public PageReference submitCase() {
        return null;
    }


    public Case customCase { get; set; }
    
    // public CustomCaseEntry() {
    //    this.customCase = getCustomCaseEntryFields();
    // }

    public List<Schema.FieldSetMember> getFields() {
        return SObjectType.Case.FieldSets.Custom_Case_Entry_Fields.getFields();
    }

    private Case getCustomCaseEntryFields() {
        String query = 'SELECT ';
        for(Schema.FieldSetMember f : this.getFields()) {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id, CaseNumber FROM Case LIMIT 1';
        return Database.query(query);
    }
}