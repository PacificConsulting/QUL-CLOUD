pageextension 50013 Sales_Quote_Ext extends "Sales Quote"
{
    layout
    {

    }
    trigger OnOpenPage()
    var
        GITrAmt: Decimal;
        CITrAmt: Decimal;
        DripAmt: Decimal;
        PlantAmt: Decimal;
        TotalPlantQty: Decimal;
        TrItem: Record 27;
    begin
        //PCPL-NAVCRMINTEGRATION
        GITrAmt := 0;
        CITrAmt := 0;
        DripAmt := 0;
        PlantAmt := 0;
        TotalPlantQty := 0;

        TrSalesLine.SETRANGE("Document Type", TrSalesLine."Document Type"::Quote);
        TrSalesLine.SETRANGE("Document No.", Rec."No.");
        IF TrSalesLine.FINDFIRST() THEN
            REPEAT
                GetGSTAmountLinewise(TrSalesLine, TotalGSTAmountlinewise, TotalGSTPercent);
                TrItem.SETRANGE("No.", TrSalesLine."No.");
                IF TrItem.FINDFIRST() THEN BEGIN
                    IF TrItem."Item Category Code" = 'TS' THEN BEGIN
                        IF TrItem."Trellis Type" = TrItem."Trellis Type"::GI THEN
                            GITrAmt += TrSalesLine."Line Amount" + TotalGSTAmountlinewise - TrSalesLine."Line Discount Amount";
                        IF TrItem."Trellis Type" = TrItem."Trellis Type"::CI THEN
                            CITrAmt += TrSalesLine."Line Amount" + TotalGSTAmountlinewise - TrSalesLine."Line Discount Amount";
                        IF TrItem."Trellis Type" = TrItem."Trellis Type"::Both THEN BEGIN
                            GITrAmt += TrSalesLine."Line Amount" + TotalGSTAmountlinewise - TrSalesLine."Line Discount Amount";
                            CITrAmt += TrSalesLine."Line Amount" + TotalGSTAmountlinewise - TrSalesLine."Line Discount Amount";
                        END;
                    END;

                    IF TrItem."Item Category Code" = 'DM' THEN
                        DripAmt += TrSalesLine."Line Amount" + TotalGSTAmountlinewise - TrSalesLine."Line Discount Amount";

                    IF TrItem."Item Category Code" = 'PLNTM' THEN BEGIN
                        PlantAmt += TrSalesLine."Line Amount" + TotalGSTAmountlinewise - TrSalesLine."Line Discount Amount";
                        TotalPlantQty += TrSalesLine.Quantity;
                    END;
                END;
            UNTIL TrSalesLine.NEXT() = 0;
        Rec."GL Trellis Amount" := GITrAmt;
        Rec."CL Trellis Amount" := CITrAmt;
        Rec."Drip Amount" := DripAmt;
        Rec."Planting Material Amount" := PlantAmt;

        Rec."Total GL TDP Amount" := GITrAmt + DripAmt + PlantAmt;
        Rec."Total CL TDP Amount" := CITrAmt + DripAmt + PlantAmt;

        IF Rec."Area as per Grower" <> 0 THEN BEGIN
            Rec."GL Cost by Grower/Kanal" := (GITrAmt + DripAmt + PlantAmt) / Rec."Area as per Grower";
            Rec."CL Cost by Grower/Kanal" := (CITrAmt + DripAmt + PlantAmt) / Rec."Area as per Grower";
        END;
        IF Rec."Area as per Auto CADD" <> 0 THEN BEGIN
            Rec."CL Cost by CADD/Kanal" := (CITrAmt + DripAmt + PlantAmt) / Rec."Area as per Auto CADD";
            Rec."GL Cost by CADD/Kanal" := (GITrAmt + DripAmt + PlantAmt) / Rec."Area as per Auto CADD";
        END;
        Rec."Total Plants" := TotalPlantQty;
        Rec.MODIFY();
        //PCPL-NAVCRMINTEGRATION
    end;

    procedure GetGSTAmountLinewise(SalesLine: Record "Sales Line";
    var GSTAmount: Decimal; var GSTPercent: Decimal)

    var
        SalesLine1: Record "Sales Line";
    begin
        Clear(GSTAmount);
        Clear(GSTPercent);
        Clear(TotalAmount);
        Clear(CGSTAmount);
        Clear(SGSTAmount);
        Clear(IGSTAmount);


        SalesLine.SetRange("Document Type", SalesLine."Document Type");
        SalesLine.SetRange("Document no.", SalesLine."Document No.");
        SalesLine.SetRange(SalesLine."Line No.", SalesLine."Line No.");
        if SalesLine.FindSet() then
            repeat
                GSTAmount += GetGSTAmount(SalesLine.RecordId());

                TotalAmount += SalesLine."Line Amount" /*- PurchaseLine."Line Discount Amount"*/ - SalesLine."Inv. Discount Amount";//PCPL/NSW/170222
                                                                                                                                    // GetGSTAmounts(SalesLine);
            until SalesLine.Next() = 0;
    end;

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
    /*local procedure GetGSTAmounts(SalesLine: Record "Sales Line")
        var
            ComponentName: Code[30];
            TaxTransactionValue: Record "Tax Transaction Value";
            GSTSetup: Record "GST Setup";
        begin
            if not GSTSetup.Get() then
                exit;

            ComponentName := GetComponentName("Sales Line", GSTSetup);

            if (SalesLine.Type <> SalesLine.Type::" ") then begin
                TaxTransactionValue.Reset();
                TaxTransactionValue.SetRange("Tax Record ID", SalesLine.RecordId);
                TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
                TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
                TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
                if TaxTransactionValue.FindSet() then
                    repeat
                        case TaxTransactionValue."Value ID" of
                            6:
                                begin
                                    SGSTAmount := Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                    SGSTPer := TaxTransactionValue.Percent;
                                    if SGSTAmount <> 0 then
                                        SGSTAMTPER := '[' + FORMAT(SGSTPer) + '%]'
                                    else
                                        Clear(SGSTAMTPER);
                                end;
                            2:
                                begin
                                    CGSTAmount := Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                    CGSTPer := TaxTransactionValue.Percent;
                                    if cGSTAmount <> 0 then
                                        CGSTAMTPER := '[' + FORMAT(CGSTPer) + '%]'
                                    else
                                        Clear(CGSTAMTPER);
                                end;
                            3:
                                begin
                                    IGSTAmount := Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                    IGSTPer := TaxTransactionValue.Percent;
                                    if IGSTAmount <> 0 then
                                        IGSTAMTPER := '[' + FORMAT(IGSTPer) + '%]'
                                    else
                                        Clear(IGSTAMTPER);
                                end;
                        end;
                    until TaxTransactionValue.Next() = 0;
            end;
        end;*/
    var
        TrSalesLine: Record 37;
        CGSTAmount: Decimal;
        SGSTAmount: Decimal;
        IGSTAmount: Decimal;
        TotalAmount: Decimal;
        TotalGSTAmountlinewise: Decimal;
        TotalGSTPercent: Decimal;
}