tableextension 50100 CustomerExt extends Customer
{
    trigger OnAfterInsert()
    var
        Contragent: Record Contragent;
    begin
        Contragent.AddNewContragentFromCustWithUI("No.");
    end;
}