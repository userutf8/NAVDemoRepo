codeunit 50100 "Contragent Extension Subs"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Table, Database::"Mini Customer Template", 'OnAfterInsertCustomerFromTemplate', '', true, true)]
    local procedure OnAfterInsertCustomerFromTemplateUpdateCustomerPostingGroup(var Customer: Record Customer; ConfigTemplateHeader: Record "Config. Template Header")
    var
        Contragent: Record Contragent;
    begin
        Contragent.Reset();
        Contragent.SetRange(CustomerNo, Customer."No.");
        if Contragent.IsEmpty() then
            Contragent.AddNewContragentFromCustWithUI(Customer."No.")
        else begin
            Contragent.FindFirst();
            Contragent.Validate(CustomerPostingGroup, Customer."Customer Posting Group");
            Contragent.Modify(true);
        end;
    end;

}