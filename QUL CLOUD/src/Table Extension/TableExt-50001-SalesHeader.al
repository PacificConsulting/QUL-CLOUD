tableextension 50001 SalesHeader_Ext extends "Sales Header"
{
    fields
    {
        field(50000; "Folio No."; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50001; "Ref. Grower"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50002; "Agreement No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        //  field(50003;"temp";Code[20])
        // {

        // }
        field(50004; "Grower"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Reference Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Rental/Charges Invoices"; Option)
        {
            OptionMembers = " ","test";
            DataClassification = ToBeClassified;
        }
        field(50007; "Area as per Grower"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50008; "Area as per Auto CADD"; Decimal)
        {

            DataClassification = ToBeClassified;
        }
        field(50009; "GL Trellis Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50010; "Drip Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50011; "Planting Material Amount"; Decimal)
        {

            DataClassification = ToBeClassified;
        }
        field(50012; "GL Cost by Grower/Kanal"; Decimal)
        {

            DataClassification = ToBeClassified;
        }
        field(50013; "GL Cost by CADD/Kanal"; Decimal)
        {

            DataClassification = ToBeClassified;
        }
        field(50014; "Total GL TDP Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50015; "CL Trellis Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50016; "CL Cost by Grower/Kanal"; Decimal)
        {

            DataClassification = ToBeClassified;
        }
        field(50017; "CL Cost by CADD/Kanal"; Decimal)
        {

            DataClassification = ToBeClassified;
        }
        field(50018; "Total CL TDP Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50020; "Site Id"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(50021; "Topic"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(50019; "Total Plants"; Integer)
        {

            DataClassification = ToBeClassified;
        }
        field(50022; "Created From CRM"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(50023; "Net Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50024; "Product Type"; Text[50])
        {

            DataClassification = ToBeClassified;
        }
        field(50025; "Released On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50026; "TotalFarmerBillAmount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }
}