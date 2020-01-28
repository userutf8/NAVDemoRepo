table 50101 Contragent
{
    Caption = 'Contragent';
    DataCaptionFields = "No.";
    Permissions = TableData "Vendor" = rm,
                  tableData "Customer" = rm;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            trigger OnValidate()
            var
                Contragent: Record Contragent;
            begin
                If "No." <> 0 then begin
                    Contragent.Reset();
                    Contragent.SetRange("No.", "No.");
                    if not Contragent.IsEmpty then
                        Error(RecordAlreadyExistsErr, TableCaption, Contragent.FieldName("No."), "No.");
                    exit;
                end;

                Contragent.Reset();
                Contragent.SetCurrentKey("No.");
                if Contragent.FindLast() then
                    "No." := Contragent."No." + 1
                else
                    "No." := 1;
            end;
        }
        field(2; CustomerNo; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
            trigger OnValidate()
            var
                Contragent: Record Contragent;
            begin
                Contragent.Reset();
                Contragent.SetRange(CustomerNo, CustomerNo);
                if not Contragent.IsEmpty then
                    Error(RecordAlreadyExistsErr, TableCaption, Contragent.FieldName(CustomerNo), Contragent.CustomerNo);
            end;
        }
        field(3; VendorNo; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
            trigger OnValidate()
            var
                Contragent: Record Contragent;
            begin
                Contragent.Reset();
                Contragent.SetRange(VendorNo, VendorNo);
                if not Contragent.IsEmpty then
                    Error(RecordAlreadyExistsErr, TableCaption, Contragent.FieldName(VendorNo), Contragent.VendorNo);
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

    trigger OnInsert()
    begin
        Validate("No.");
    end;
}