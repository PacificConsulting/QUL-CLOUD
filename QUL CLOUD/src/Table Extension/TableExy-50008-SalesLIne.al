tableextension 50008 SaleLine extends "Sales Line"
{
    fields
    {
        // Add changes to table fields here
        field(50050; "Amount To customer"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }



    var
        myInt: Integer;
}