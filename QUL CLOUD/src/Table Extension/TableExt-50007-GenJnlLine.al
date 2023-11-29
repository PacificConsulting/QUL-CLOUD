tableextension 50007 GenJnlLine extends "Gen. Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Folio No"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Site ID"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Payment Category"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
    }


}