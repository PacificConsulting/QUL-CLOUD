pageextension 50012 Purchase_Order_Ext extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Preview)
        {
            action("Purchase Order Report")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                Image = Print;
                trigger OnAction()
                var

                    PH: Record "Purchase Header";
                begin
                    PH.Reset();
                    PH.SetRange("No.", Rec."No.");
                    if PH.FindFirst() then
                        Report.RunModal(50011, true, false, PH);
                end;
            }
        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}