unit iDialogService;

interface

type
  IDialog = interface
    procedure ShowInfo(const Msg: string; const Title: string = 'Informação');
    procedure ShowSuccess(const Msg: string; const Title: string = 'Sucesso');
    procedure ShowAtenc(const Msg: string; const Title: string = 'Atenção');
    procedure ShowError(const Msg: string; const Title: string = 'Erro');
    function Confirm(const Msg: string; const Title: string = 'Confirmação'): Boolean;
  end;

implementation

end.
