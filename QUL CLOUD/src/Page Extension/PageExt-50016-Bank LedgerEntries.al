pageextension 50016 BankLEdgerEntries_Ext extends "Bank Account Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("Payment Type"; PaymentType)
            {
                ApplicationArea = all;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Clear(PaymentType);
        if Rec."Journal Templ. Name" = 'BANKRCPTV' then
            PaymentType := 'Receipt';

        if Rec."Journal Templ. Name" = 'BANKPYMTV' then
            PaymentType := 'Payment';
    end;

    var
        myInt: Integer;
        PaymentType: Text;

}