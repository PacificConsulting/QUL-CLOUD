report 50011 "PO GST"
{
    DefaultLayout = RDLC;
    Caption = 'Purchase Order';
    RDLCLayout = 'src\Report Layout\PO GST-3.rdl';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Posting Date";
            column(IGSTTot; IGSTTot)
            {
            }
            column(TotalGSTAmountFinal; TotalGSTAmountFinal)
            {

            }
            column(TotalGSTAmount; TotalGSTAmount)
            {

            }
            column(TotalAmountFooter; TotalAmountFooter)
            {

            }
            column(AmounttoVendor_PurchaseHeader; '')//"Purchase Header"."Amount to Vendor")
            {
            }
            column(CGSTTot; CGSTTot)
            {
            }
            column(SGSTTot; SGSTTot)
            {
            }
            column(CGSTWords; CGSTWords[1])
            {
            }
            column(SGSTWords; SGSTWords[1])
            {
            }
            column(IGSTWords; IGSTWOrds[1])
            {
            }
            column(UOM_PurchaseHeader; '')//"Purchase Header".UOM) //PCPL-064 9sep2023
            {
            }
            column(OrderDate_PurchaseHeader; "Purchase Header"."Order Date")
            {
            }
            column(QuoteNo_PurchaseHeader; "Purchase Header"."Quote No.")
            {
            }
            column(No_PurchaseHeader; "Purchase Header"."No.")
            {
            }
            column(PaymentMethodCode_PurchaseHeader; "Purchase Header"."Payment Method Code")
            {
            }
            column(PaymentTermsCode_PurchaseHeader; "Purchase Header"."Payment Terms Code")
            {
            }
            column(ShipmentMethodCode_PurchaseHeader; "Purchase Header"."Shipment Method Code")
            {
            }
            column(VendStateCode; RecState."State Code (GST Reg. No.)")
            {
            }
            column(GSTINVEND; RVend."GST Registration No.")
            {
            }
            column(VendEmail; RVend."E-Mail")
            {
            }
            column(PhNo; RVend."Phone No.")
            {
            }
            column(PaytoName_PurchaseHeader; "Purchase Header"."Pay-to Name")
            {
            }
            column(PaytoVendorNo_PurchaseHeader; "Purchase Header"."Pay-to Vendor No.")
            {
            }
            column(PaytoAddress_PurchaseHeader; "Purchase Header"."Pay-to Address")
            {
            }
            column(PaytoAddress2_PurchaseHeader; "Purchase Header"."Pay-to Address 2")
            {
            }
            column(InboundWhseHandlingTime_PurchaseHeader; "Purchase Header"."Inbound Whse. Handling Time")
            {
            }
            column(ManufacturerECCNo_PurchaseHeader; '')// "Purchase Header"."Manufacturer E.C.C. No.")
            {
            }
            column(PAN_Vendor; RVend."P.A.N. No.")
            {
            }
            column(GSTTotalAmt; GSTTotalAmt)
            {
            }
            column(VendState; RecState.Description)
            {
            }
            column(TotalAmount; TotalAmount)
            {
            }
            column(PaytoCity_PurchaseHeader; "Purchase Header"."Pay-to City")
            {
            }
            column(PaytoPostCode_PurchaseHeader; "Purchase Header"."Pay-to Post Code")
            {
            }
            column(PaytoContact_PurchaseHeader; "Purchase Header"."Pay-to Contact")
            {
            }
            column(PaytoCounty_PurchaseHeader; "Purchase Header"."Pay-to County")
            {
            }
            column(Logo; CompanyInfo.Picture)
            {
            }
            column(add; Add)
            {
            }
            column(ShipmentMethodCode_SalesInvoiceHeader; ShiAgent.Name)
            {
            }
            column(BillPan; RCust."P.A.N. No.")
            {
            }
            column(SHIPan; PANShip)
            {
            }
            column(ShiptoName_SalesInvoiceHeader; "Purchase Header"."Ship-to Name")
            {
            }
            column(OrderDate_SalesInvoiceHeader; "Purchase Header"."Order Date")
            {
            }
            column(PostingDate_SalesInvoiceHeader; "Purchase Header"."Posting Date")
            {
            }
            column(PaymentTermsCode; "Purchase Header"."Payment Terms Code")
            {
            }
            column(SalesOrderNo; "Purchase Header"."No.")
            {
            }
            column(AmountinWords1; AmountinWords[1])
            {
            }
            column(StateName; StateName)
            {
            }
            column(StateCode; StateCode)
            {
            }
            column(Frieght; Frieght)
            {
            }
            column(Insurance; Insurance)
            {
            }
            column(OtherCharges; OtherCharges)
            {
            }
            column(CopyText; COPYTEXT)
            {
            }
            column(ComName; CompanyInfo.Name)
            {
            }
            column(ComName1; CompanyInfo.Name + '' + CompanyInfo."Name 2")
            {
            }
            column(ComAddress; CompanyInfo.Address + '' + CompanyInfo."Address 2" + '' + CompanyInfo.City + '' + CompanyInfo."Post Code")
            {
            }
            column(BankAccntNo; CompanyInfo."Bank Account No.")
            {
            }
            column(ComGSTRegNo; CompanyInfo."GST Registration No.") //PCPL-064 9sep2023
            {

            }
            column(comPhoneNo; CompanyInfo."Phone No.")
            {

            }
            column(ComPAN; CompanyInfo."P.A.N. No.")
            {

            }
            column(ComEmail; CompanyInfo."E-Mail")
            {

            }
            column(ComHome; CompanyInfo."Home Page")  //PCPL-064 9sep2023
            {

            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CustAddr1; CustAddr[1])
            {
            }
            column(CustAddr2; CustAddr[2])
            {
            }
            column(CustAddr3; CustAddr[3])
            {
            }
            column(CustAddr4; CustAddr[4])
            {
            }
            column(PageCaption; PageCaption)
            {
            }
            column(CustAddr5; CustAddr[5])
            {
            }
            column(CustAddr6; CustAddr[6])
            {
            }
            column(CustAddr7; CustAddr[7])
            {
            }
            column(CustAddr8; CustAddr[8])
            {
            }
            column(State; '')//CompanyInfo.State)
            {
            }
            column(CompanyAddr1; CompanyAddr[1])
            {
            }
            column(CompanyAddr2; CompanyAddr[2])
            {
            }
            column(CompanyAddr3; CompanyAddr[3])
            {
            }
            column(CompanyAddr4; CompanyAddr[4])
            {
            }
            column(CompanyAddr5; CompanyAddr[5])
            {
            }
            column(CompanyAddr6; CompanyAddr[6])
            {
            }
            column(GSTIN; CompanyInfo."GST Registration No.")
            {
            }
            column(ShipToAddr1; ShipToAddr[1])
            {
            }
            column(ShipToAddr2; ShipToAddr[2])
            {
            }
            column(ShipToAddr3; ShipToAddr[3])
            {
            }
            column(ShipToAddr4; ShipToAddr[4])
            {
            }
            column(ShipToAddr5; ShipToAddr[5])
            {
            }
            column(ShipToAddr6; ShipToAddr[6])
            {
            }
            column(ShipToAddr7; ShipToAddr[7])
            {
            }
            column(ShipToAddr8; ShipToAddr[8])
            {
            }
            column(BankName; recBank.Name)
            {
            }
            column(BankAddress; recBank.Address)
            {
            }
            column(BankAddress2; recBank."Address 2")
            {
            }
            column(BankSwiftCode; recBank."SWIFT Code")
            {
            }
            column(LocStateCode; recLocation."State Code")
            {
            }
            column(CGST; CGST)
            {
            }
            column(SGST; SGST)
            {
            }
            column(IGST; IGST)
            {
            }
            column(Designation; '')// Designation)//PCPL-064 9sep2023
            {

            }
            column(Designation1; Designation1)
            {

            }
            column(QuoteNo; QuoteNo)
            {

            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemLinkReference = "Purchase Header";
                DataItemTableView = WHERE(Type = FILTER(Item));
                column(CGSTAmount; CGSTAmount)
                {
                }
                column(SGSTAmount; SGSTAmount)
                {
                }
                column(IGSTAmount; IGSTAmount)
                {
                }
                column(CGSTPer; CGSTPer)
                {
                }
                column(SGSTPer; SGSTPer)
                {
                }
                column(IGSTPer; IGSTPer)
                {
                }
                column(LineDiscountAmt; LineDiscountAmt)
                {
                }
                column(LineDiscPer; "Purchase Line"."Line Discount %")
                {
                }
                column(SrNo; SrNo)
                {
                }
                column(HSNSACCode_SalesInvoiceLine; "Purchase Line"."HSN/SAC Code")
                {
                }
                column(ItemNo; "Purchase Line"."No.")
                {
                }
                column(docno; "Purchase Line"."Document No.")
                {
                }
                column(lineno; "Purchase Line"."Line No.")
                {
                }
                column(Description; "Purchase Line".Description)
                {
                }
                column(UOM; "Purchase Line"."Unit of Measure Code")
                {
                }
                column(Quantity; "Purchase Line".Quantity)
                {
                }
                column(Amount; "Purchase Line".Amount)
                {
                }
                column(UnitCost_PurchaseLine; "Purchase Line"."Unit Cost")
                {
                }
                column(UnitsperParcel_PurchaseLine; "Purchase Line"."Units per Parcel")
                {
                }
                column(Unit; ("Purchase Line"."Units per Parcel") * "Purchase Line".Quantity)
                {
                }
                column(Noofpacks_PurchaseLine; 0)//"Purchase Line"."No. of packs") //PCPL-064 9sep2023
                {
                }
                column(PackSize_PurchaseLine; '')//"Purchase Line"."Pack Size") //PCPL-064 9sep2023
                {
                }

                trigger OnAfterGetRecord();
                begin
                    SrNo += 1;

                    LineDiscountAmt += "Purchase Line"."Line Discount Amount";
                    GetGSTAmountLinewise("Purchase Line", TotalGSTAmountlinewise, TotalGSTPercent);

                    IF PurchHedr.get("Purchase Line"."Document Type", "Purchase Line"."Document No.") then
                        TotalGSTAmountFinal := GSTFooterTotal(PurchHedr);
                    // Message((Format(TotalGSTAmountFinal)));

                end;

                trigger OnPreDataItem();
                begin
                    NoOfRecords := "Purchase Header".COUNT;
                    LineDiscountAmt := 0;
                end;

                trigger OnPostDataItem()
                begin


                end;
            }

            trigger OnAfterGetRecord();
            begin


                IF "Purchase Header"."Location Code" = 'UNIT1' THEN
                    Add := 'Unit I-6 1A & 2, Brahma Compound, Val Village, Rehanal, Thane - 421302, Maharashtra'
                ELSE
                    IF "Purchase Header"."Location Code" = 'UNIT 2' THEN
                        Add := 'Unit II-Plot No. 288, Abitghar, Sathepada, Near Sati Rolling Mill, Tal. Wada, Dist. Palghar-421303';

                IF RVend.GET("Purchase Header"."Buy-from Vendor No.") THEN BEGIN
                    IF RecState.GET(RVend."State Code") THEN;
                END;

                IF RVend.GET("Purchase Header"."Buy-from Vendor No.") THEN;





                FormatAddr.PurchHeaderBuyFrom(CustAddr, "Purchase Header");
                FormatAddr.PurchHeaderShipTo(ShipToAddr, "Purchase Header");



                //Amount in Words
                // TotalAmount := 0;
                recPurchLine.RESET;
                recPurchLine.SETRANGE(recPurchLine."Document No.", "Purchase Header"."No.");
                recPurchLine.SETRANGE(Type, recPurchLine.Type::Item);
                IF recPurchLine.FINDSET THEN
                    REPEAT
                        TotalAmount += recPurchLine.Amount;
                    UNTIL recPurchLine.NEXT = 0;

                //Amount in Words
                //TotalAmountFooter := 0;
                recPurchLine.RESET;
                recPurchLine.SETRANGE(recPurchLine."Document No.", "Purchase Header"."No.");
                recPurchLine.SETRANGE(Type, recPurchLine.Type::Item);
                IF recPurchLine.FINDSET THEN
                    REPEAT
                        TotalAmountFooter += recPurchLine.Amount;
                    UNTIL recPurchLine.NEXT = 0;


                recSalesReceivalesSetup.Get();
                recPurchLine.RESET;
                recPurchLine.SETRANGE(recPurchLine."Document No.", "Purchase Header"."No.");
                recPurchLine.SETRANGE(Type, recPurchLine.Type::"G/L Account");
                // recPurchLine.SetRange("No.", recSalesReceivalesSetup.Frieght); //PCPL-064  09sep2023
                IF recPurchLine.FINDFIRST THEN begin
                    Frieght := recPurchLine."Line Amount";

                end;

                recPurchLine.RESET;
                recPurchLine.SETRANGE(recPurchLine."Document No.", "Purchase Header"."No.");
                recPurchLine.SETRANGE(Type, recPurchLine.Type::"G/L Account");
                //  recPurchLine.SetRange("No.", recSalesReceivalesSetup.Insurance); //PCPL-064  09sep2023
                IF recPurchLine.FINDFIRST THEN begin
                    Insurance := recPurchLine."Line Amount";

                end;


                recPurchLine.RESET;
                recPurchLine.SETRANGE(recPurchLine."Document No.", "Purchase Header"."No.");
                recPurchLine.SETRANGE(Type, recPurchLine.Type::"G/L Account");
                //recPurchLine.SetRange("No.", recSalesReceivalesSetup.Courier);   //PCPL-064  09sep2023
                IF recPurchLine.FINDFIRST THEN begin
                    Frieght += recPurchLine."Line Amount";
                    //Frieght := recPurchLine."Line Amount";

                end;

                RecPurchaseHeader.Reset;
                RecPurchaseHeader.SetRange("Document Type", recPurchLine."Document Type");
                if RecPurchaseHeader.FindFirst then begin

                    Designation1 := '';//UpperCase(CopyStr(Designation, 1, 1)) + LowerCase(CopyStr(Designation, 2)); //PCPL-064 9sep2023
                    QuoteNo := UpperCase(CopyStr("Quote No.", 1, 1)) + LowerCase(CopyStr("Quote No.", 2));
                end;


                GetPurchaseStatisticsAmount("Purchase Header", TotalGSTAmount, TotalGSTPercent);

                //Message(Format(TotalGSTAmount));
                //  GSTTotalAmt := TotalGSTAmount; //IGSTTot + SGSTTot + CGSTTot; //PPCL/NSW/07  121022

                repCheck.InitTextVariable;
                repCheck.FormatNoText(AmountinWords, ROUND((TotalAmount + TotalGSTAmount), 1), "Purchase Header"."Currency Code");

                repCheck.InitTextVariable;
                repCheck.FormatNoText(IGSTWOrds, IGSTAmount/*IGSTTot*/, "Purchase Header"."Currency Code");

                repCheck.InitTextVariable;
                repCheck.FormatNoText(SGSTWords, SGSTAmount/*SGSTTot*/, "Purchase Header"."Currency Code");

                repCheck.InitTextVariable;
                repCheck.FormatNoText(CGSTWords, CGSTAmount/*CGSTTot*/, "Purchase Header"."Currency Code");
            end;

            trigger OnPostDataItem()
            begin
                // GSTTotalAmt := CGSTAmount + SGSTAmount + IGSTAmount;
                //Message(Format(GSTTotalAmt));
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Functions)
                {
                    field("No Of Copies"; NoOfCopies)
                    {
                        ApplicationArea = all;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
        FormatAddr.Company(CompanyAddr, CompanyInfo);
    end;

    var
        CompanyInfo: Record 79;
        recSalesReceivalesSetup: Record 311;
        PurchHedr: Record 38;
        TotalGSTAmountlinewise: Decimal;
        TotalGSTAmountFinal: Decimal;
        TotalGSTPercent1: Decimal;
        TotalAmountFooter: Decimal;

        FormatAddr: Codeunit 365;
        CustAddr: array[8] of Text;
        CompanyAddr: array[8] of Text;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        OutPutNo: Integer;
        TEXT001: Label 'Original for Recipient';
        COPYTEXT: Text;
        TEXT002: Label 'Duplicate for Supplier';
        TEXT003: Label 'Triplicate for Transporter';
        TEXT004: Label 'Extra Copy';
        PageCaption: Label 'Page %1 of %2';
        NoOfRows: Integer;
        NoOfRecords: Integer;
        recCust: Record 18;
        repCheck: Codeunit 50100;
        AmountinWords: array[5] of Text[250];
        TotalAmount: Decimal;
        recPurchLine: Record 39;
        SrNo: Integer;
        GLE: Record "Detailed GST Entry Buffer";
        CGST: Decimal;
        SGST: Decimal;
        IGST: Decimal;
        CGSTPer: Decimal;
        SGSTPer: Decimal;
        IGSTPer: Decimal;
        CGSTAmount: Decimal;
        SGSTAmount: Decimal;
        IGSTAmount: Decimal;
        ShipToAddr: array[8] of Text[50];
        recBank: Record 270;
        recLocation: Record 14;
        RecState: Record "State";
        StateName: Text[50];
        StateCode: Code[20];
        ShipToGST: Code[20];
        ShipToState: Text[20];
        ShipToStateCode: Code[20];
        BillToGST: Code[20];
        BillToState: Text[20];
        BillToStateCode: Code[20];
        Frieght: Decimal;
        Insurance: Decimal;
        OtherCharges: Decimal;
        //PostedStrOrderdetailLines: Record 13795;
        RCust: Record 18;
        ShipToAdd: Record 222;
        PANShip: Code[20];
        CGSTWords: array[5] of Text[250];
        SGSTWords: array[5] of Text[250];
        IGSTWOrds: array[5] of Text[250];
        Add: Text[250];
        ShiAgent: Record 291;
        LineDiscountAmt: Decimal;
        RVend: Record 23;
        GSTTotalAmt: Decimal;
        CGSTTot: Decimal;
        SGSTTot: Decimal;
        IGSTTot: Decimal;
        GLE1: Record "Detailed GST Entry Buffer";
        TotalGSTAmount: Decimal;
        TotalGSTPercent: Decimal;
        CessAmount: Decimal;
        GSTComponentCodeName: array[20] of Code[20];
        IGSTLbl: Label 'IGST';
        SGSTLbl: Label 'SGST';
        CGSTLbl: Label 'CGST';
        CESSLbl: Label 'CESS';
        GSTLbl: Label 'GST';
        GSTCESSLbl: Label 'GST CESS';
        RecPurchaseHeader: Record "Purchase Header";
        Designation1: Text;
        QuoteNo: Text;




    // StructOrderLine: Record 13795;

    procedure GetPurchaseStatisticsAmount(
        PurchaseHeader: Record "Purchase Header";
        var GSTAmount: Decimal; var GSTPercent: Decimal)
    var
        PurchaseLine: Record "Purchase Line";
    begin
        Clear(GSTAmount);
        Clear(GSTPercent);
        Clear(TotalAmount);
        Clear(CGSTAmount);
        Clear(SGSTAmount);
        Clear(IGSTAmount);
        Clear(IGSTPer);
        Clear(SGSTPer);
        Clear(CGSTPer);

        PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchaseLine.SetRange("Document no.", PurchaseHeader."No.");
        if PurchaseLine.FindSet() then
            repeat
                GSTAmount += GetGSTAmount(PurchaseLine.RecordId());
                GSTPercent += GetGSTPercent(PurchaseLine.RecordId());
                TotalAmount += PurchaseLine."Line Amount" /*- PurchaseLine."Line Discount Amount"*/ - PurchaseLine."Inv. Discount Amount";//PCPL/NSW/170222
                GetGSTAmountsTotal(PurchaseLine);
            until PurchaseLine.Next() = 0;
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
            /*
            if TaxTransactionValue."Value ID" = 6 then begin
                SGSTAmount += TaxTransactionValue.Amount;
                SGSTPer += TaxTransactionValue.Percent;
                // message('%1', SGSTAmt);
            end;
            if TaxTransactionValue."Value ID" = 2 then begin
                CGSTAmount += TaxTransactionValue.Amount;
                CGSTPer += TaxTransactionValue.Percent;
            end;
            if TaxTransactionValue."Value ID" = 3 then begin
                IGSTAmount += TaxTransactionValue.Amount;
                IGSTPer += TaxTransactionValue.Percent;
            end;
            */
        end;


        exit(TaxTransactionValue.Amount);
    end;

    local procedure GetGSTPercent(RecID: RecordID): Decimal
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
        if not TaxTransactionValue.IsEmpty() then
            TaxTransactionValue.CalcSums(Percent);

        exit(TaxTransactionValue.Percent);
    end;

    local procedure GetGSTAmounts(PurchaseLine: Record "Purchase Line")
    var
        ComponentName: Code[30];
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
    begin
        if not GSTSetup.Get() then
            exit;

        ComponentName := GetComponentName("Purchase Line", GSTSetup);

        if (PurchaseLine.Type <> PurchaseLine.Type::" ") then begin
            TaxTransactionValue.Reset();
            TaxTransactionValue.SetRange("Tax Record ID", PurchaseLine.RecordId);
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
                            end;
                        2:
                            begin
                                CGSTAmount := Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                CGSTPer := TaxTransactionValue.Percent;
                            end;
                        3:
                            begin
                                IGSTAmount := Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                IGSTPer := TaxTransactionValue.Percent;
                            end;
                    end;
                until TaxTransactionValue.Next() = 0;
        end;
    end;

    local procedure GetGSTAmountsTotal(PurchaseLine: Record "Purchase Line")
    var
        ComponentName: Code[30];
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
    begin
        if not GSTSetup.Get() then
            exit;

        ComponentName := GetComponentName("Purchase Line", GSTSetup);

        if (PurchaseLine.Type <> PurchaseLine.Type::" ") then begin
            TaxTransactionValue.Reset();
            TaxTransactionValue.SetRange("Tax Record ID", PurchaseLine.RecordId);
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
            TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
            TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
            if TaxTransactionValue.FindSet() then
                repeat
                    case TaxTransactionValue."Value ID" of
                        6:
                            begin
                                SGSTAmount += Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                SGSTPer := TaxTransactionValue.Percent;
                            end;
                        2:
                            begin
                                CGSTAmount += Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                CGSTPer := TaxTransactionValue.Percent;
                            end;
                        3:
                            begin
                                IGSTAmount += Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                IGSTPer := TaxTransactionValue.Percent;
                            end;
                    end;
                until TaxTransactionValue.Next() = 0;
        end;
    end;


    local procedure GetCessAmount(TaxTransactionValue: Record "Tax Transaction Value";
        PurchaseLine: Record "Purchase Line";
        GSTSetup: Record "GST Setup")
    begin
        if (PurchaseLine.Type <> PurchaseLine.Type::" ") then begin
            TaxTransactionValue.Reset();
            TaxTransactionValue.SetRange("Tax Record ID", PurchaseLine.RecordId);
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."Cess Tax Type");
            TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
            if TaxTransactionValue.FindSet() then
                repeat
                    CessAmount += Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(GetComponentName(PurchaseLine, GSTSetup)));
                until TaxTransactionValue.Next() = 0;
        end;
    end;

    local procedure GetGSTCaptions(TaxTransactionValue: Record "Tax Transaction Value";
        PurchaseLine: Record "Purchase Line";
        GSTSetup: Record "GST Setup")
    begin
        TaxTransactionValue.Reset();
        TaxTransactionValue.SetRange("Tax Record ID", PurchaseLine.RecordId);
        TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if TaxTransactionValue.FindSet() then
            repeat
                case TaxTransactionValue."Value ID" of
                    6:
                        GSTComponentCodeName[6] := SGSTLbl;
                    2:
                        GSTComponentCodeName[2] := CGSTLbl;
                    3:
                        GSTComponentCodeName[3] := IGSTLbl;
                end;
            until TaxTransactionValue.Next() = 0;
    end;

    local procedure GetComponentName(PurchaseLine: Record "Purchase Line";
        GSTSetup: Record "GST Setup"): Code[30]
    var
        ComponentName: Code[30];
    begin
        if GSTSetup."GST Tax Type" = GSTLbl then
            if PurchaseLine."GST Jurisdiction Type" = PurchaseLine."GST Jurisdiction Type"::Interstate then
                ComponentName := IGSTLbl
            else
                ComponentName := CGSTLbl
        else
            if GSTSetup."Cess Tax Type" = GSTCESSLbl then
                ComponentName := CESSLbl;
        exit(ComponentName)
    end;

    // local procedure GetTDSAmount(TaxTransactionValue: Record "Tax Transaction Value";
    //     PurchaseLine: Record "Purchase Line";
    //     TDSSetup: Record "TDS Setup")
    // begin
    //     if (PurchaseLine.Type <> PurchaseLine.Type::" ") then begin
    //         TaxTransactionValue.Reset();
    //         TaxTransactionValue.SetRange("Tax Record ID", PurchaseLine.RecordId);
    //         TaxTransactionValue.SetRange("Tax Type", TDSSetup."Tax Type");
    //         TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
    //         TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
    //         if TaxTransactionValue.FindSet() then
    //             repeat
    //                 TDSAmt += TaxTransactionValue.Amount;
    //             until TaxTransactionValue.Next() = 0;
    //     end;
    //     TDSAmt := Round(TDSAmt, 1);
    // end;

    procedure GetGSTRoundingPrecision(ComponentName: Code[30]): Decimal
    var
        TaxComponent: Record "Tax Component";
        GSTSetup: Record "GST Setup";
        GSTRoundingPrecision: Decimal;
    begin
        if not GSTSetup.Get() then
            exit;
        GSTSetup.TestField("GST Tax Type");

        TaxComponent.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxComponent.SetRange(Name, ComponentName);
        TaxComponent.FindFirst();
        if TaxComponent."Rounding Precision" <> 0 then
            GSTRoundingPrecision := TaxComponent."Rounding Precision"
        else
            GSTRoundingPrecision := 1;
        exit(GSTRoundingPrecision);
    end;

    procedure GetGSTAmountLinewise(
        PurchaseLine: Record 39;
        var GSTAmount: Decimal; var GSTPercent: Decimal)
    var
        PurchaseLine1: Record "Purchase Line";
    begin
        Clear(GSTAmount);
        Clear(GSTPercent);
        Clear(TotalAmount);
        Clear(CGSTAmount);
        Clear(SGSTAmount);
        Clear(IGSTAmount);
        Clear(IGSTPer);
        Clear(SGSTPer);
        Clear(CGSTPer);

        PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type");
        PurchaseLine.SetRange("Document no.", PurchaseLine."Document No.");
        PurchaseLine.SetRange(PurchaseLine."Line No.", PurchaseLine."Line No.");
        if PurchaseLine.FindSet() then
            repeat
                GSTAmount += GetGSTAmount(PurchaseLine.RecordId());
                GSTPercent += GetGSTPercent(PurchaseLine.RecordId());
                TotalAmount += PurchaseLine."Line Amount" /*- PurchaseLine."Line Discount Amount"*/ - PurchaseLine."Inv. Discount Amount";//PCPL/NSW/170222
                GetGSTAmounts(PurchaseLine);
            until PurchaseLine.Next() = 0;
    end;

    procedure GSTFooterTotal(PurchaseHeader: Record "Purchase Header"): Decimal

    var
        PurchaseLine: Record "Purchase Line";
        GSTAmountFooter: Decimal;
    begin
        // Clear(GSTAmount);
        // Clear(GSTPercent);
        // Clear(TotalAmount);
        // Clear(CGSTAmount);
        // Clear(SGSTAmount);
        // Clear(IGSTAmount);
        // Clear(IGSTPer);
        // Clear(SGSTPer);
        // Clear(CGSTPer);

        PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchaseLine.SetRange("Document no.", PurchaseHeader."No.");
        if PurchaseLine.FindSet() then
            repeat
                GSTAmountFooter += GetGSTAmountFooter(PurchaseLine.RecordId());
            until PurchaseLine.Next() = 0;
        exit(GSTAmountFooter);
    end;

    local procedure GetGSTAmountFooter(RecID: RecordID): Decimal
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





}

