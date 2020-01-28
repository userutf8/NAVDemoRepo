tableextension 50100 CustomerExt extends Customer
{
    trigger OnAfterInsert()
    begin
        AddNewContragentFromCustWithUI("No.");
    end;

    procedure AddNewContragentFromCustWithUI(CustNo: Code[20])
    var
        Contragent: Record Contragent;
    begin
        If not GuiAllowed then
            exit;

        Contragent.Reset();
        Contragent.SetRange(CustomerNo, CustNo);
        if not Contragent.IsEmpty() then
            exit;

        If not Confirm(StrSubstNo('Do you want to create a new %1?', Contragent.TableCaption), true)
        then
            exit;

        Contragent.Init();
        Contragent.Validate("No.");
        Contragent.Validate(CustomerNo, CustNo);
        Contragent.Insert(true);

        Contragent.SetRecFilter();
        Page.Run(Page::"Contragent Card", Contragent);
    end;
}