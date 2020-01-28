tableextension 50101 VendorExt extends Vendor
{
    trigger OnAfterInsert()
    var
        Contragent: Record Contragent;
    begin
        If not GuiAllowed then
            exit;

        Contragent.Reset();
        Contragent.SetRange(VendorNo, "No.");
        if not Contragent.IsEmpty() then
            exit;

        If not Confirm(StrSubstNo('Do you want to create a new %1?', Contragent.TableCaption), true)
        then
            exit;

        Contragent.Init();
        Contragent.Validate("No.");
        Contragent.Validate(VendorNo, "No.");
        Contragent.Insert(true);

        Contragent.SetRecFilter();
        Page.Run(Page::"Contragent Card", Contragent);
    end;
}