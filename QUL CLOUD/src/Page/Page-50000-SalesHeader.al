page 50000 SalesHeader_CRM
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = 36;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Area as per Grower"; Rec."Area as per Grower")

                {
                    ApplicationArea = all;
                }
                field("Area as per Auto CADD"; Rec."Area as per Auto CADD")
                {
                    ApplicationArea = all;
                }

                field("Drip Amount"; Rec."Drip Amount")
                {
                    ApplicationArea = All;
                }
                field("CL Trellis Amount"; Rec."CL Trellis Amount")
                {
                    ApplicationArea = all;
                }
                field("GL Trellis Amount"; Rec."GL Trellis Amount")
                {
                    ApplicationArea = all;
                }
                field("Planting Material Amount"; Rec."Planting Material Amount")
                {
                    ApplicationArea = all;
                }
                field("CL Cost by Grower/Kanal"; Rec."CL Cost by Grower/Kanal")
                {
                    ApplicationArea = all;
                }
                field("CL Cost by CADD/Kanal"; Rec."CL Cost by CADD/Kanal")
                {
                    ApplicationArea = all;
                }
                field("GL Cost by CADD/Kanal"; Rec."GL Cost by CADD/Kanal")
                {
                    ApplicationArea = all;
                }
                field("GL Cost by Grower/Kanal"; Rec."GL Cost by Grower/Kanal")
                {
                    ApplicationArea = all;
                }
                field("Total GL TDP Amount"; Rec."Total GL TDP Amount")
                {
                    ApplicationArea = all;
                }
                field("Total CL TDP Amount"; Rec."Total CL TDP Amount")
                {
                    ApplicationArea = all;
                }
            }
        }


    }
}