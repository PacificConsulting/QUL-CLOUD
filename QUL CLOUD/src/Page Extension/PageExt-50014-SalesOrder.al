pageextension 50014 SalesOrder_Ext extends "Sales Order"
{
    layout
    {

    }
    actions
    {
        addafter(CalculateInvoiceDiscount)
        {
            action(CalculatePrice)
            {
                Caption = 'Calculate Plant Price';
                Promoted = true;
                ApplicationArea = all;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = Calculate;
                trigger OnAction()
                var
                    Navcrm: Codeunit "NAV CRM Integration";
                begin
                    Navcrm.CalcPlantPrice(Rec."No.");
                end;
            }
        }
    }
}