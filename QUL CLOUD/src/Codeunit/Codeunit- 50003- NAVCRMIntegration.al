codeunit 50003 "NAV CRM Integration"
{

    trigger OnRun()
    begin
        CalcPlantPrice('FW-TI-22-001699');
        MESSAGE('Done');
    end;

    var
        NewCustomer: Record 18;
        SalesQuote: Record 36;
        SalesQuoteLine: Record 37;
        CGSTAmount: Decimal;
        SGSTAmount: Decimal;
        IGSTAmount: Decimal;
        TotalAmount: Decimal;
        TotalGSTAmountlinewise: Decimal;
        TotalGSTPercent: Decimal;
    //StagingPmtEntry: Record 50050;  //table does not exist

    //[Scope('Internal')]
    procedure CreateCustomer("no": Code[20]; name: Text[50]; addr: Text[50]; addr2: Text[50]; city: Text[30]; phone: Text[30]; postCode: Code[20])
    begin
        IF NOT NewCustomer.GET("No") THEN BEGIN
            NewCustomer.INIT();
            NewCustomer."No." := "No";
            NewCustomer.Name := Name;
            NewCustomer.Address := Addr;
            NewCustomer."Address 2" := Addr2;
            NewCustomer.City := City;
            NewCustomer."Phone No." := Phone;
            NewCustomer.VALIDATE("Post Code", PostCode);
            NewCustomer.VALIDATE("State Code", 'JK');
            NewCustomer.VALIDATE("Country/Region Code", 'IN');
            NewCustomer."Customer Posting Group" := 'GROWERS HDP';
            NewCustomer.VALIDATE("Customer Posting Group");
            NewCustomer."Gen. Bus. Posting Group" := 'GENERAL';
            NewCustomer.VALIDATE("Gen. Bus. Posting Group");
            NewCustomer."GST Customer Type" := NewCustomer."GST Customer Type"::Unregistered;
            NewCustomer.INSERT();
        END;
    end;

    //[Scope('Internal')]
    procedure CreateSQHeader("sqno": Code[20]; "customerno": Code[20]; areapergrower: Decimal; areaperautocadd: Decimal; vsiteid: Text[50]; vtopic: Text[100]; vproducttype: Text[50])
    begin
        SalesQuote.INIT();
        SalesQuote.VALIDATE("Document Type", SalesQuote."Document Type"::Quote);
        SalesQuote.VALIDATE("No.", "SqNo");
        SalesQuote.VALIDATE("Created From CRM", TRUE);
        SalesQuote.VALIDATE("Sell-to Customer No.", "CustomerNo");
        SalesQuote."Area as per Grower" := AreaperGrower;
        SalesQuote."Area as per Auto CADD" := AreaperAutoCadd;
        SalesQuote."Site Id" := vSiteid;
        SalesQuote.Topic := vTopic;
        SalesQuote."Customer Price Group" := 'QUOTE';
        SalesQuote.VALIDATE("Customer Price Group");
        SalesQuote.VALIDATE("Location Code", 'WH001');
        ///SalesQuote.VALIDATE(Structure, 'GST');
        SalesQuote."Product Type" := vProductType;
        SalesQuote.INSERT();
    end;


    procedure CreateSQLine("docno": Code[20]; "lineno": Integer; sqtype: Option " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)"; "itemno": Code[20]; locationcode: Code[10]; sqquantity: Decimal)
    begin
        SalesQuoteLine.INIT();
        SalesQuoteLine.VALIDATE("Document Type", SalesQuoteLine."Document Type"::Quote);
        SalesQuoteLine.VALIDATE("Document No.", "DocNo");
        SalesQuoteLine.VALIDATE("Line No.", "LineNo");
        SalesQuoteLine.VALIDATE(Type, SQType);
        SalesQuoteLine.VALIDATE("No.", "ItemNo");
        SalesQuoteLine.VALIDATE("Location Code", LocationCode);
        SalesQuoteLine.VALIDATE(Quantity, SQQuantity);
        SalesQuoteLine.INSERT();
    end;


    // procedure PaymentEntryUpsert(PostingDate: Text[25]; CustomerNo: Text[20]; FolioNo: Text[20]; PaymentType: Text[20]; Amount: Text[20]; SiteID: Text[20]; Paymentcategory: Text[20])
    // begin
    //     StagingPmtEntry.INIT();
    //     StagingPmtEntry."Posting Date" := PostingDate;
    //     StagingPmtEntry."Customer No" := CustomerNo;
    //     StagingPmtEntry."Folio No" := FolioNo;
    //     StagingPmtEntry."Payment Type" := PaymentType;
    //     StagingPmtEntry.Amount := Amount;
    //     StagingPmtEntry."Site ID" := SiteID;
    //     StagingPmtEntry."Transaction Type" := Paymentcategory;
    //     StagingPmtEntry.INSERT();
    // end;     //Table required

    local procedure GetNAVSQNetAmount(SQNo: Code[20]): Decimal
    var
        recSH: Record 36;
    begin
        recSH.RESET;
        recSH.SETRANGE("No.", SQNo);
        IF recSH.FINDFIRST THEN
            EXIT(recSH."Net Total Amount");
    end;


    procedure CreateSalesOrderHeader(orderno: Code[20]; "customerno": Code[20]; totAmt: Decimal)
    begin
        SalesQuote.INIT();
        SalesQuote.VALIDATE("Document Type", SalesQuote."Document Type"::Order);
        SalesQuote.VALIDATE("No.", OrderNo);
        SalesQuote.VALIDATE("Created From CRM", TRUE);
        SalesQuote.VALIDATE("Sell-to Customer No.", "CustomerNo");
        SalesQuote."Customer Price Group" := 'ORDER';
        SalesQuote.VALIDATE("Customer Price Group");
        SalesQuote.VALIDATE("Location Code", 'WH001');
        /// SalesQuote.VALIDATE(Structure, 'GST');
        SalesQuote.TotalFarmerBillAmount := totAmt;
        SalesQuote.INSERT();
    end;


    procedure CreateSalesOrderLine("docno": Code[20]; "lineno": Integer; sqtype: Option " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)"; "itemno": Code[20]; locationcode: Code[10]; sqquantity: Decimal)
    begin
        SalesQuoteLine.INIT();
        SalesQuoteLine.VALIDATE("Document Type", SalesQuoteLine."Document Type"::Order);
        SalesQuoteLine.VALIDATE("Document No.", "DocNo");
        SalesQuoteLine.VALIDATE("Line No.", "LineNo");
        SalesQuoteLine.VALIDATE(Type, SQType);
        SalesQuoteLine.VALIDATE("No.", "ItemNo");
        SalesQuoteLine.VALIDATE("Location Code", LocationCode);
        SalesQuoteLine.VALIDATE(Quantity, SQQuantity);
        SalesQuoteLine.INSERT();
    end;


    procedure CalcPlantPrice(sono: Code[20])
    var
        SH: Record 36;
        SL: Record 37;
        TrSalesHdr: Record 36;
        DiffAmt: Decimal;
        totPlantQty: Decimal;
        unitPrice: Decimal;
        TotalGSTAmount1: Decimal;
        TDSAmount: Decimal;
        TotalAmt: Decimal;
        AmounttoCust: Decimal;
    begin
        totPlantQty := 0;
        //GetGSTAmountLinewise(TrSalesLine, TotalGSTAmountlinewise, TotalGSTPercent);

        SH.GET(SH."Document Type"::Order, SONo);
        //PCPL-BRB

        GetGSTAmountTotal(SH, TotalGSTAmount1);
        GetTDSAmountTotal(SH, TDSAmount);
        GetPostedSalesInvStatisticsAmount(SH, TotalAmt);
        AmounttoCust := TotalAmt + TotalGSTAmount1 - TDSAmount;

        //PCPL-BRB
        SL.RESET;
        SL.SETRANGE("Document No.", SONo);

        // SL.CalculateStructures(SH);
        // SL.AdjustStructureAmounts(SH);       //comment
        // SL.UpdateSalesLines(SH);

        //SH.CALCFIELDS("Amount to Customer");
        DiffAmt := SH.TotalFarmerBillAmount - AmounttoCust;
        IF DiffAmt <> 0 THEN BEGIN
            SL.RESET;
            SL.SETRANGE("Document No.", SONo);
            SL.SETRANGE("Item Category Code", 'PLNTM');
            IF SL.FINDSET THEN
                REPEAT
                    totPlantQty += SL.Quantity;
                UNTIL SL.NEXT = 0;
            unitPrice := DiffAmt / totPlantQty;
            SL.RESET;
            SL.SETRANGE("Document No.", SONo);
            SL.SETRANGE("Item Category Code", 'PLNTM');
            IF SL.FINDSET THEN
                REPEAT
                    SL.VALIDATE("Unit Price", unitPrice);
                    SL.MODIFY;
                UNTIL SL.NEXT = 0;
        END;
        ///SL.CalculateStructures(SH);  //function does not exist
    end;

    // GST Amount
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

    //
    //PCPL-BRB
    procedure GetGSTAmountTotal(SalesHeader: Record 36; var GSTAmount: Decimal)
    var
        SalesLine: Record 37;
    begin
        Clear(GSTAmount);
        SalesLine.SetRange("Document no.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                GSTAmount += GetGSTAmount11(SalesLine.RecordId());
            until SalesLine.Next() = 0;
    end;

    procedure GetTDSAmountTotal(SalesHeader: Record 36; var TDSAmount: Decimal)
    var
        SalesLine: Record 37;
        TCSManagement: Codeunit "TCS Management";
        i: Integer;
        RecordIDList: List of [RecordID];
    begin
        Clear(TDSAmount);
        // Clear(TCSPercent);
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document no.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                RecordIDList.Add(SalesLine.RecordId());
            until SalesLine.Next() = 0;

        for i := 1 to RecordIDList.Count() do begin
            TDSAmount += GetTDSAmount(RecordIDList.Get(i));
        end;
        TDSAmount := TCSManagement.RoundTCSAmount(TDSAmount);
    end;

    procedure GetPostedSalesInvStatisticsAmount(SalesHeader: Record 36; var TotalInclTaxAmount: Decimal)
    var
        SalesLine: Record 37;
        RecordIDList: List of [RecordID];
        GSTAmount: Decimal;
        TDSAmount: Decimal;
    begin
        Clear(TotalInclTaxAmount);
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                RecordIDList.Add(SalesLine.RecordId());
                TotalInclTaxAmount += SalesLine.Amount;
            until SalesLine.Next() = 0;
        TotalInclTaxAmount := TotalInclTaxAmount + GSTAmount + TDSAmount;
    end;

    local procedure GetTDSAmount(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        TDSSetup: Record "TDS Setup";
    begin
        if not TDSSetup.Get() then exit;
        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        TaxTransactionValue.SetRange("Tax Type", TDSSetup."Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then
            TaxTransactionValue.CalcSums(Amount);
        exit(TaxTransactionValue.Amount);
    end;

    local procedure GetGSTAmount11(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
    begin
        if not GSTSetup.Get() then exit;
        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        if GSTSetup."Cess Tax Type" <> '' then TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type", GSTSetup."Cess Tax Type") else TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then begin
            TaxTransactionValue.CalcSums(Amount);
            TaxTransactionValue.CalcSums(Percent);
        end;
        exit(TaxTransactionValue.Amount);
    end;
    //PCPL-BRB
    procedure TestwithKamal(Name: Text[80]): Text
    begin
        exit('Hi Kamalkant Sharma');
    end;
}

