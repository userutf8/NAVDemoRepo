page 50101 "Contragent Card"
{
    Caption = 'Contragent Card';
    PageType = Card;
    SourceTable = Contragent;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
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
            group(Details)
            {
                field("Customer Posting Group"; CustomerPostingGroup)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies Customer Posting Group for the Customer.';
                }
            }
        }
    }
}