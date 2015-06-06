unit about;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, ExtCtrls, Graphics;

type
  TFormAbout = class(TForm)
    ImageProgram: TImage;
    LabelShadow: TLabel;
    LabelTitle: TLabel;
    ShapeTitle: TShape;
    LabelFree: TLabel;
    LabelText: TLabel;
    BevelAbout: TBevel;
    LabelCopyright: TLabel;
    ButtonClose: TButton;

    procedure FormCreate(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.dfm}

procedure TFormAbout.FormCreate(Sender: TObject);
begin
  LabelText.Caption :=
  'This game is dedicated to: '#13'Tjokro, Djeq, Mbul, Komeng, Susee,'#13+
  'and all staffs of UPPTI Brawijaya University.';
end;

procedure TFormAbout.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

end.

