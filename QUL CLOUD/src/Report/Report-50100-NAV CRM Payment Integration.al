report 50100 "NAV_CRM_Payment_Integration"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING(Number)
                                 WHERE(Number = CONST(1));

            trigger OnAfterGetRecord()
            begin
                CompanyInformation.GET;
                IF CompanyInformation.CRM_Integration = FALSE THEN
                    ERROR('CRM Integration is not activated in this company so this report cannot be viewed. Please contact System Admin.');

                BankLinesCreated := 0;
                CashLinesCreated := 0;
                CLEAR(DocumentNo);
                StagingTable.RESET;
                StagingTable.SETRANGE(Created, FALSE);
                IF StagingTable.FINDSET THEN
                    REPEAT
                        IF StagingTable."Payment Type" <> 'Cash' THEN BEGIN
                            IF GenJnlBatch.GET('BANK RECEI', 'PMTINTG') THEN BEGIN
                                LineNo := 10000;
                                DocumentNo := NoSeriesMgmt.GetNextNo(GenJnlBatch."No. Series", 0D, FALSE);
                                GenJnlLine3.SETRANGE("Journal Template Name", GenJnlBatch."Journal Template Name");
                                GenJnlLine3.SETRANGE("Journal Batch Name", GenJnlBatch.Name);
                                IF GenJnlLine3.FINDLAST() THEN
                                    LineNo := LineNo + GenJnlLine3."Line No.";
                                GenJnlLine.INIT();
                                GenJnlLine.VALIDATE("Journal Template Name", GenJnlBatch."Journal Template Name");
                                GenJnlLine.VALIDATE("Journal Batch Name", GenJnlBatch.Name);
                                GenJnlLine.VALIDATE("Line No.", LineNo);
                                LineNo := LineNo + 10000;
                                IF EVALUATE(PostingDate, StagingTable."Posting Date") THEN
                                    GenJnlLine.VALIDATE("Posting Date", PostingDate);
                                GenJnlLine.VALIDATE("Document Type", GenJnlLine."Document Type"::Payment);
                                GenJnlLine.VALIDATE("Document No.", DocumentNo);
                                GenJnlLine.VALIDATE("Posting No. Series", GenJnlBatch."Posting No. Series");
                                GenJnlLine.VALIDATE("Account Type", GenJnlLine."Account Type"::Customer);
                                GenJnlLine.VALIDATE("Account No.", StagingTable."Customer No");
                                CLEAR(GenJnlLineAmt);
                                IF EVALUATE(GenJnlLineAmt, StagingTable.Amount) THEN
                                    GenJnlLine.VALIDATE("Credit Amount", GenJnlLineAmt);
                                GenJnlLine.VALIDATE("Folio No", StagingTable."Folio No");
                                GenJnlLine.VALIDATE("Site ID", StagingTable."Site ID");
                                GenJnlLine.VALIDATE("Payment Category", StagingTable."Payment Category");
                                GenJnlLine.INSERT();
                                BankLinesCreated := BankLinesCreated + 1;

                                GenJnlLine2.INIT();
                                GenJnlLine2.VALIDATE("Journal Template Name", GenJnlBatch."Journal Template Name");
                                GenJnlLine2.VALIDATE("Journal Batch Name", GenJnlBatch.Name);
                                GenJnlLine2.VALIDATE("Line No.", LineNo);
                                LineNo := LineNo + 10000;
                                IF EVALUATE(PostingDate, StagingTable."Posting Date") THEN
                                    GenJnlLine2.VALIDATE("Posting Date", PostingDate);
                                GenJnlLine2.VALIDATE("Document Type", GenJnlLine2."Document Type"::Payment);
                                GenJnlLine2.VALIDATE("Document No.", DocumentNo);
                                GenJnlLine2.VALIDATE("Posting No. Series", GenJnlBatch."Posting No. Series");
                                GenJnlLine2.VALIDATE("Account Type", GenJnlLine2."Account Type"::"Bank Account");
                                GenJnlLine2.VALIDATE("Account No.", 'BANK-001');
                                CLEAR(GenJnlLineAmt);
                                IF EVALUATE(GenJnlLineAmt, StagingTable.Amount) THEN
                                    GenJnlLine2.VALIDATE("Debit Amount", GenJnlLineAmt);
                                GenJnlLine2.VALIDATE("Folio No", StagingTable."Folio No");
                                GenJnlLine2.VALIDATE("Site ID", StagingTable."Site ID");
                                GenJnlLine2.VALIDATE("Payment Category", StagingTable."Payment Category");
                                GenJnlLine2.INSERT();
                                BankLinesCreated := BankLinesCreated + 1;
                            END;
                        END;

                        IF StagingTable."Payment Type" = 'Cash' THEN BEGIN
                            IF GenJnlBatch.GET('CASHRCPT', 'PMTINTG') THEN BEGIN
                                LineNo := 10000;
                                DocumentNo := NoSeriesMgmt.GetNextNo(GenJnlBatch."No. Series", 0D, FALSE);
                                GenJnlLine3.SETRANGE("Journal Template Name", GenJnlBatch."Journal Template Name");
                                GenJnlLine3.SETRANGE("Journal Batch Name", GenJnlBatch.Name);
                                IF GenJnlLine3.FINDLAST() THEN
                                    LineNo := LineNo + GenJnlLine3."Line No.";
                                GenJnlLine.INIT();
                                GenJnlLine.VALIDATE("Journal Template Name", GenJnlBatch."Journal Template Name");
                                GenJnlLine.VALIDATE("Journal Batch Name", GenJnlBatch.Name);
                                GenJnlLine.VALIDATE("Line No.", LineNo);
                                LineNo := LineNo + 10000;
                                IF EVALUATE(PostingDate, StagingTable."Posting Date") THEN
                                    GenJnlLine.VALIDATE("Posting Date", PostingDate);
                                GenJnlLine.VALIDATE("Document Type", GenJnlLine."Document Type"::Payment);
                                GenJnlLine.VALIDATE("Document No.", DocumentNo);
                                GenJnlLine.VALIDATE("Posting No. Series", GenJnlBatch."Posting No. Series");
                                GenJnlLine.VALIDATE("Account Type", GenJnlLine."Account Type"::Customer);
                                GenJnlLine.VALIDATE("Account No.", StagingTable."Customer No");
                                CLEAR(GenJnlLineAmt);
                                IF EVALUATE(GenJnlLineAmt, StagingTable.Amount) THEN
                                    GenJnlLine.VALIDATE("Credit Amount", GenJnlLineAmt);
                                GenJnlLine.VALIDATE("Folio No", StagingTable."Folio No");
                                GenJnlLine.VALIDATE("Site ID", StagingTable."Site ID");
                                GenJnlLine.VALIDATE("Payment Category", StagingTable."Payment Category");
                                GenJnlLine.INSERT();
                                CashLinesCreated := CashLinesCreated + 1;

                                GenJnlLine2.INIT();
                                GenJnlLine2.VALIDATE("Journal Template Name", GenJnlBatch."Journal Template Name");
                                GenJnlLine2.VALIDATE("Journal Batch Name", GenJnlBatch.Name);
                                GenJnlLine2.VALIDATE("Line No.", LineNo);
                                LineNo := LineNo + 10000;
                                IF EVALUATE(PostingDate, StagingTable."Posting Date") THEN
                                    GenJnlLine2.VALIDATE("Posting Date", PostingDate);
                                GenJnlLine2.VALIDATE("Document Type", GenJnlLine2."Document Type"::Payment);
                                GenJnlLine2.VALIDATE("Document No.", DocumentNo);
                                GenJnlLine2.VALIDATE("Posting No. Series", GenJnlBatch."Posting No. Series");
                                GenJnlLine2.VALIDATE("Account Type", GenJnlLine2."Account Type"::"G/L Account");
                                GenJnlLine2.VALIDATE("Account No.", '104302');
                                CLEAR(GenJnlLineAmt);
                                IF EVALUATE(GenJnlLineAmt, StagingTable.Amount) THEN
                                    GenJnlLine2.VALIDATE("Debit Amount", GenJnlLineAmt);
                                GenJnlLine.VALIDATE("Folio No", StagingTable."Folio No");
                                GenJnlLine2.VALIDATE("Site ID", StagingTable."Site ID");
                                GenJnlLine2.VALIDATE("Payment Category", StagingTable."Payment Category");
                                GenJnlLine2.INSERT();
                                CashLinesCreated := CashLinesCreated + 1;
                            END;
                        END;
                        StagingTable.Created := TRUE;
                        StagingTable.MODIFY();
                        COMMIT();
                    UNTIL StagingTable.NEXT() = 0;
            END;
        }

    }
    trigger OnPreReport()
    begin
        CompanyInformation.GET;
        IF CompanyInformation.CRM_Integration = FALSE THEN
            ERROR('CRM Integration is not activated in this company so this report cannot be viewed. Please contact System Admin.');
    end;

    trigger OnPostReport()
    begin
        MESSAGE('%1 Cash Lines Created , %2 Bank Lines Created', CashLinesCreated, BankLinesCreated);
    end;


    VAR
        StagingTable: Record 50050;
        GenJnlLine: Record 81;
        GenJnlBatch: Record 232;
        LineNo: Integer;
        PostingDate: Date;
        NoSeriesMgmt: Codeunit 396;
        GenJnlLineAmt: Decimal;
        GenJnlLine2: Record 81;
        DocumentNo: Code[20];
        CashLinesCreated: Integer;
        BankLinesCreated: Integer;
        GenJnlLine3: Record 81;
        CompanyInformation: Record 79;

}