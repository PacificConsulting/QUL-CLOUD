table 50050 StagingPaymentEntry
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Posting Date"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Customer No"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Folio No"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Payment Type"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Amount; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Created; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Site ID"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Payment Category"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }

    }

    var
        myInt: Integer;
}
