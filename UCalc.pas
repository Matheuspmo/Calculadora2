﻿unit UCalc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmCalc = class(TForm)
    BtnSinal: TButton;
    Btn0: TButton;
    BtnVirgula: TButton;
    BtnIgual: TButton;
    Btn1: TButton;
    Btn2: TButton;
    Btn3: TButton;
    BtnSoma: TButton;
    Btn4: TButton;
    Btn5: TButton;
    Btn6: TButton;
    BtnSubtr: TButton;
    BtnApagar: TButton;
    Btn7: TButton;
    Btn8: TButton;
    Btn9: TButton;
    BtnMult: TButton;
    BtnLimpar: TButton;
    BtnLimparTudo: TButton;
    BtnPorcent: TButton;
    BtnUmSobreValor: TButton;
    BtnValorQuadrado: TButton;
    BtnRaizQuadradaValor: TButton;
    BtnDiv: TButton;
    Tela1: TEdit;
    Tela2: TEdit;
    procedure BtnSomaClick(Sender: TObject);
    procedure BtnSubtrClick(Sender: TObject);
    procedure BtnMultClick(Sender: TObject);
    procedure BtnDivClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn1Click(Sender: TObject);
    procedure Btn0Click(Sender: TObject);
    procedure Btn2Click(Sender: TObject);
    procedure Btn3Click(Sender: TObject);
    procedure Btn4Click(Sender: TObject);
    procedure Btn5Click(Sender: TObject);
    procedure Btn6Click(Sender: TObject);
    procedure Btn7Click(Sender: TObject);
    procedure Btn8Click(Sender: TObject);
    procedure Btn9Click(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnLimparTudoClick(Sender: TObject);
    procedure BtnIgualClick(Sender: TObject);
    procedure BtnVirgulaClick(Sender: TObject);
    procedure BtnApagarClick(Sender: TObject);
    procedure BtnRaizQuadradaValorClick(Sender: TObject);
    procedure BtnValorQuadradoClick(Sender: TObject);
    procedure BtnUmSobreValorClick(Sender: TObject);
    procedure BtnSinalClick(Sender: TObject);
    procedure BtnPorcentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var sinalsoma, sinalsub, sinalmult, sinaldiv, sinaltotal, botaovirgula : Boolean;
    var valor1, valor2, total : Double;
    var operador : string;

    procedure BtnNumero(x : integer);
    procedure Desativarbotoes;
    procedure Ativarbotoes;
    procedure Resetar;
  end;

var
  FrmCalc: TFrmCalc;

implementation

{$R *.dfm}



procedure TFrmCalc.Ativarbotoes;
begin
 BtnSinal.Enabled             := True;
 BtnVirgula.Enabled           := True;
 BtnSoma.Enabled              := True;
 BtnSubtr.Enabled             := True;
 BtnMult.Enabled              := True;
 BtnDiv.Enabled               := True;
 BtnRaizQuadradaValor.Enabled := True;
 BtnValorQuadrado.Enabled     := True;
 BtnUmSobreValor.Enabled      := True;
 BtnPorcent.Enabled           := True;
end;

procedure TFrmCalc.Btn0Click(Sender: TObject);
begin
 BtnNumero(0);
end;

procedure TFrmCalc.Btn1Click(Sender: TObject);
begin
 BtnNumero(1);
end;

procedure TFrmCalc.Btn2Click(Sender: TObject);
begin
 BtnNumero(2);
end;

procedure TFrmCalc.Btn3Click(Sender: TObject);
begin
 BtnNumero(3);
end;

procedure TFrmCalc.Btn4Click(Sender: TObject);
begin
 BtnNumero(4);
end;

procedure TFrmCalc.Btn5Click(Sender: TObject);
begin
 BtnNumero(5);
end;

procedure TFrmCalc.Btn6Click(Sender: TObject);
begin
 BtnNumero(6);
end;

procedure TFrmCalc.Btn7Click(Sender: TObject);
begin
 BtnNumero(7);
end;

procedure TFrmCalc.Btn8Click(Sender: TObject);
begin
 BtnNumero(8);
end;

procedure TFrmCalc.Btn9Click(Sender: TObject);
begin
 BtnNumero(9);
end;

procedure TFrmCalc.BtnApagarClick(Sender: TObject);
begin
 Tela1.Font.Size := 28;
 if ((Tela1.Text = 'Resultado indefinido') or (Tela1.Text = 'Não é possível dividir por zero')) then
 begin
  Resetar;
 end
 else
 begin
  if operador = '' then
  begin
   if sinaltotal = True then
   begin
    Tela2.Text := '';
   end
   else
   begin
    Tela1.text := copy(Tela1.text, 0, length(Tela1.text)-1);
    if length(Tela1.Text) = 0 then
     Tela1.Text := '0';
   end;

   valor1 := StrToFloat(Tela1.Text);
  end
  else
  begin
   if sinaltotal = True then
   begin
    Tela2.Text := '';
   end
   else
   begin
    Tela1.text := copy(Tela1.text, 0, length(Tela1.text)-1);
    if length(Tela1.Text) = 0 then
     Tela1.Text := '0';
   end;

   valor2 := StrToFloat(Tela1.Text);
  end;
 end;
end;

procedure TFrmCalc.BtnDivClick(Sender: TObject);
begin
 Tela1.Font.Size := 28;
 valor2 := 0;
 operador     := ' ÷ ';
 sinalsoma    := False;
 sinalsub     := False;
 sinalmult    := False;
 sinaldiv     := True;
 botaovirgula := False;
 sinaltotal   := False;
 Tela2.Text := valor1.ToString + operador;
end;

procedure TFrmCalc.BtnIgualClick(Sender: TObject);
begin
Tela1.Font.Size := 28;
 if sinalsoma = True then
 begin
  total       := valor1 + valor2;
  Tela2.Text  := valor1.ToString + operador + valor2.ToString + ' =';
  Tela1.Text  := total.ToString;
  valor1      := total;
 end;
 if sinalsub = True then
 begin
  total       := valor1 - valor2;
  Tela2.Text  := valor1.ToString + operador + valor2.ToString + ' =';
  Tela1.Text  := total.ToString;
  valor1      := total;
 end;
 if sinalmult = True then
 begin
  total       := valor1 * valor2;
  Tela2.Text  := valor1.ToString + operador + valor2.ToString + ' =';
  Tela1.Text  := total.ToString;
  valor1      := total;
 end;
 if sinaldiv = True then
 begin
  if ((operador = ' ÷ ') and (valor1 = 0) and (valor2 = 0)) then
  begin
   Tela1.Font.Size := 25;
   Tela1.Text := 'Resultado indefinido';
   Desativarbotoes;
  end
  else if ((operador = ' ÷ ') and  (valor2 = 0)) then
  begin
   Tela1.Font.Size := 17;
   Tela1.Text := 'Não é possível dividir por zero';
   Desativarbotoes;
  end
  else
  begin
   total       := valor1 / valor2;
   Tela1.Text  := total.ToString;
   Tela2.Text  := valor1.ToString + operador + valor2.ToString + ' =';
   valor1      := total;
  end;
 end;
 sinaltotal  := True;
end;

procedure TFrmCalc.BtnLimparClick(Sender: TObject);
begin
 Ativarbotoes;
 Tela1.Font.Size := 28;
 if sinaltotal = False then
 begin
  if operador = '' then
  begin
   valor1     := 0;
   Tela1.Text := valor1.ToString;
  end
  else
  begin
   valor2     := 0;
   Tela1.Text := valor2.ToString;
  end;
 end
 else
 begin
  Resetar;
 end;
end;

procedure TFrmCalc.BtnLimparTudoClick(Sender: TObject);
begin
 Resetar;
end;

procedure TFrmCalc.BtnMultClick(Sender: TObject);
begin
 Tela1.Font.Size := 28;
 valor2 := 0;
 operador     := ' x ';
 sinalsoma    := False;
 sinalsub     := False;
 sinalmult    := True;
 sinaldiv     := False;
 botaovirgula := False;
 sinaltotal   := False;
 Tela2.Text := valor1.ToString + operador;
end;

procedure TFrmCalc.BtnNumero(x : Integer);
begin
 Ativarbotoes;
 Tela1.Font.Size := 28;
 if ((sinaltotal = True) and (valor2 <> 0)) then
 begin
  operador     := '';
  sinaltotal   := False;
  botaovirgula := False;
  valor1       := 0;
  Tela2.Text   := '';
 end;
 if ((Tela1.Text = 'Resultado indefinido') or (Tela1.Text = 'Não é possível dividir por zero')) then
  Tela2.Text := '';

 if operador = '' then
 begin
  if botaovirgula = True then
  begin
   Tela1.Text := Tela1.Text + x.ToString;
   valor1     := StrToFloat(Tela1.Text);
  end
  else
  begin
   valor1     := (valor1.ToString + x.ToString).ToDouble;
   Tela1.Text := valor1.ToString
  end;
 end
 else
 begin
  if botaovirgula = True then
  begin
   Tela1.Text := Tela1.Text + x.ToString;
   valor2     := StrToFloat(Tela1.Text);
  end
  else
  begin
   valor2     := (valor2.ToString + x.ToString).ToDouble;
   Tela1.Text := valor2.ToString;
  end;
 end;
end;

procedure TFrmCalc.BtnPorcentClick(Sender: TObject);
begin
 if valor2 = 0 then
 begin
  Tela1.Text := '0';
  Tela2.Text := '0';
 end
 else
 begin
  valor2 := valor2/100;
  Tela2.Text := valor1.ToString + operador + valor2.ToString;
  Tela1.Text := valor2.ToString;
 end;
end;

procedure TFrmCalc.BtnRaizQuadradaValorClick(Sender: TObject);
begin
 total := sqrt(valor1);
 Tela2.Text := '√(' + valor1.ToString + ')';
 Tela1.Text := total.ToString;
 valor1 := total;
end;

procedure TFrmCalc.BtnSinalClick(Sender: TObject);
begin
 if operador = '' then
 begin
  valor1 := -1 * valor1;
  Tela1.Text := valor1.ToString;
 end
 else
 begin
  total := -1 * total;
  Tela1.Text := total.ToString;
  Tela2.Text := 'Negate(' + total.ToString + ')';
 end;
end;

procedure TFrmCalc.BtnSomaClick(Sender: TObject);
begin
 Tela1.Font.Size := 28;
 valor2       := 0;
 operador     := ' + ';
 sinalsoma    := True;
 sinalsub     := False;
 sinalmult    := False;
 sinaldiv     := False;
 botaovirgula := False;
 sinaltotal   := False;
 Tela2.Text   := valor1.ToString + operador;
end;

procedure TFrmCalc.BtnSubtrClick(Sender: TObject);
begin
 Tela1.Font.Size := 28;
 valor2       := 0;
 operador     := ' - ';
 sinalsoma    := False;
 sinalsub     := True;
 sinalmult    := False;
 sinaldiv     := False;
 botaovirgula := False;
 sinaltotal   := False;
 Tela2.Text := valor1.ToString + operador;
end;

procedure TFrmCalc.BtnUmSobreValorClick(Sender: TObject);
var total : Double;
begin
 total := 1/valor1;
 Tela2.Text := '1/(' + valor1.ToString + ')';
 Tela1.Text := total.ToString;
 valor1 := total;
end;

procedure TFrmCalc.BtnValorQuadradoClick(Sender: TObject);
var total : Double;
begin
 total := sqr(valor1);
 Tela2.Text := 'sqr(' + valor1.ToString + ')';
 Tela1.Text := total.ToString;
 valor1 := total;
end;

procedure TFrmCalc.BtnVirgulaClick(Sender: TObject);
begin
 Tela1.Font.Size := 28;
 if (botaovirgula = False) then
 begin
  botaovirgula := True;
  if operador = '' then
   Tela1.Text := valor1.ToString + ','
  else
   Tela1.Text := valor2.ToString + ',';
 end;
  if (sinaltotal = True) then
  begin
   sinaltotal := False;
   valor1     := 0;
   Tela1.Text := valor1.ToString + ',';
   Tela2.Text := '';
   operador   := '';
  end;
end;

procedure TFrmCalc.Desativarbotoes;
begin
 BtnSinal.Enabled             := False;
 BtnVirgula.Enabled           := False;
 BtnSoma.Enabled              := False;
 BtnSubtr.Enabled             := False;
 BtnMult.Enabled              := False;
 BtnDiv.Enabled               := False;
 BtnRaizQuadradaValor.Enabled := False;
 BtnValorQuadrado.Enabled     := False;
 BtnUmSobreValor.Enabled      := False;
 BtnPorcent.Enabled           := False;
end;

procedure TFrmCalc.FormShow(Sender: TObject);
begin
 Tela1.Text := valor1.ToString;
end;

procedure TFrmCalc.Resetar;
begin
 Ativarbotoes;
 Tela1.Font.Size := 28;
 valor1       := 0;
 valor2       := 0;
 operador     := '';
 sinalsoma    := False;
 sinalsub     := False;
 sinalmult    := False;
 sinaldiv     := False;
 botaovirgula := False;
 sinaltotal   := False;
 Tela1.Text   := valor1.ToString;
 Tela2.Text   := '';
end;

end.
