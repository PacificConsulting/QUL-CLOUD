pageextension 50015 CompInfo extends "Company Information"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field(CRM_Integration; Rec.CRM_Integration)
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}