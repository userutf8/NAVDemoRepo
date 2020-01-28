table 50101 Contragent
{
    Caption = 'Contragent';
    DataCaptionFields = "No.";
    Permissions = TableData "Vendor" = r,
                  tableData "Customer" = r;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            trigger OnValidate()
            var
                Contragent: Record Contragent;
            begin
                Contragent.Reset();
                If "No." = 0 then begin
                    Contragent.SetCurrentKey("No.");
                    if Contragent.FindLast() then
                        "No." := Contragent."No." + 1
                    else
                        "No." := 1;
                end else begin
                    Contragent.SetRange("No.", "No.");
                    if not Contragent.IsEmpty then
                        Error(RecordAlreadyExistsErr, TableCaption, Contragent.FieldName("No."), "No.");
                end;
            end;
        }
        field(2; CustomerNo; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
            trigger OnValidate()
            begin
                CheckRecWithCustExists(CustomerNo);
            end;
        }
        field(3; VendorNo; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
            trigger OnValidate()
            begin
                CheckRecWithVendExists(VendorNo);
            end;
        }
        field(4; CustomerPostingGroup; Code[20])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
    }
    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; CustomerNo, VendorNo)
        {
        }
    }
    var
        RecordAlreadyExistsErr: Label '%1 with %3 %2 already exists';
        CreateNewConfirmTxt: Label 'Do you want to create a new %1?';

    trigger OnInsert()
    begin
        Validate("No.");
    end;

    procedure AddNewContragentFromCustWithUI(CustNo: Code[20])
    var
        Contragent: Record Contragent;
    begin
        If not GuiAllowed then
            exit;

        CheckRecWithCustExists(CustNo);
        If not Confirm(StrSubstNo(CreateNewConfirmTxt, Contragent.TableCaption), true)
        then
            exit;

        Contragent.Init();
        Contragent.Validate("No.");
        Contragent.Validate(CustomerNo, CustNo);
        Contragent.Insert(true);

        Contragent.SetRecFilter();
        Page.Run(Page::"Contragent Card", Contragent);
    end;

    local procedure CheckRecWithCustExists(CustNo: Code[20])
    var
        Contragent: Record Contragent;
    begin
        Contragent.SetRange(CustomerNo, CustNo);
        if not Contragent.IsEmpty() then
            Error(RecordAlreadyExistsErr, TableCaption, Contragent.FieldName(CustomerNo), Contragent.CustomerNo);
    end;

    local procedure CheckRecWithVendExists(VendorNo: Code[20])
    var
        Contragent: Record Contragent;
    begin
        Contragent.SetRange(VendorNo, VendorNo);
        if not Contragent.IsEmpty() then
            Error(RecordAlreadyExistsErr, TableCaption, Contragent.FieldName(VendorNo), Contragent.VendorNo);
    end;
}