unit uControlUtils;

interface

uses
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Controls,Vcl.ExtCtrls,RxCurrEdit;
type
TControlUtils = class

  public
    class procedure LimparControles(Parent: TWinControl);
    class procedure HabilitarControles(Parent: TWinControl; Habilitar: Boolean);
  end;

implementation

class procedure TControlUtils.LimparControles(Parent: TWinControl);
var
  i: Integer;
begin
  for i := 0 to Parent.ControlCount - 1 do
  begin
    if Parent.Controls[i] is TEdit then
      TEdit(Parent.Controls[i]).Clear;

    if Parent.Controls[i] is TMaskEdit then
      TMaskEdit(Parent.Controls[i]).Clear;

    if Parent.Controls[i] is TLabeledEdit then
      TMaskEdit(Parent.Controls[i]).Clear;

    if Parent.Controls[i] is TComboBox then
      TComboBox(Parent.Controls[i]).ItemIndex := -1;

    if Parent.Controls[i] is TWinControl then
      LimparControles(TWinControl(Parent.Controls[i]));
  end;
end;

class procedure TControlUtils.HabilitarControles(Parent: TWinControl; Habilitar: Boolean);
var
  i: Integer;
begin
  for i := 0 to Parent.ControlCount - 1 do
  begin
    if Parent.Controls[i] is TEdit then
      TEdit(Parent.Controls[i]).Enabled := Habilitar;

    if Parent.Controls[i] is TMaskEdit and (Parent.Controls[i].Tag <> 1) then
      TMaskEdit(Parent.Controls[i]).Enabled := Habilitar;

    if Parent.Controls[i] is TComboBox then
      TComboBox(Parent.Controls[i]).Enabled := Habilitar;

    if (Parent.Controls[i] is TLabeledEdit) and (Parent.Controls[i].Tag <> 1) then
      TComboBox(Parent.Controls[i]).Enabled := Habilitar;

    if Parent.Controls[i] is TRadioGroup and (Parent.Controls[i].Tag <> 1) then
      TEdit(Parent.Controls[i]).Enabled := Habilitar;

    if Parent.Controls[i] is TWinControl then
      HabilitarControles(TWinControl(Parent.Controls[i]), Habilitar);

    if Parent.Controls[i] is TCurrencyEdit then
      HabilitarControles(TWinControl(Parent.Controls[i]), Habilitar);

  end;
end;
end.
