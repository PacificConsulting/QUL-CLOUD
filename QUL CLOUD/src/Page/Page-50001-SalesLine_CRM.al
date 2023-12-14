page 50001 SalesLine_CRM
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = 37;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                }
                field("Amount To customer"; Rec."Amount To customer")
                {
                    ApplicationArea = all;
                }
            }
        }

    }

    trigger OnAfterGetRecord()
    var
        SalesLine: Record 37;
        GSTAmount: Decimal;
    begin
        SalesLine.Reset();
        SalesLine.SetCurrentKey("Document No.", Type);
        SalesLine.SetRange("Document No.", Rec."Document No.");
        SalesLine.SetRange("No.", Rec."No.");
        SalesLine.SetRange("Line No.", Rec."Line No.");
        if SalesLine.FindFirst() then
            GSTAmount := GetGSTAmount(SalesLine.RecordId());

        Rec."Amount To customer" := Rec."Line Amount" + GSTAmount;


    END;
    //PCPL-25/101123
    local procedure GetGSTAmount(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
    begin
        if not GSTSetup.Get() then
            exit;
        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        if GSTSetup."Cess Tax Type" <> '' then
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type", GSTSetup."Cess Tax Type")
        else
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then begin
            TaxTransactionValue.CalcSums(Amount);
            TaxTransactionValue.CalcSums(Percent);
        end;
        exit(TaxTransactionValue.Amount);
    end;
    //PCPL-25/101123



}