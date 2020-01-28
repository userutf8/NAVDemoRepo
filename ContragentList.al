page 50102 "Contragent List"
{
    Caption = 'Contragents';
    PageType = List;
    CardPageID = "Contragent Card";
    UsageCategory = Lists;
    SourceTable = Contragent;
    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contragent''s number.';
                    Editable = false;
                }
                field("Customer No."; CustomerNo)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the customer''s number.';
                }
                field("Vendor No."; VendorNo)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the vendor''s number.';
                }
            }
        }
    }
}