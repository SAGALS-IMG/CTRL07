{------------------------------------------------------------
  TSelShape  矩形領域選択用コンポーネント

** プロパティ **
  SizeSense            : リサイズ領域内法
  MinWidth, MinHeight  : リサイズ可能な最小幅＆高さ
  MinTop,   MinLeft    :       〃      上端＆左端
  MaxBottom,MaxRight   :       〃      下端＆右端
                         Maxを0にすると親コントロールのクライアント
                         領域に限定できる。
  SelOption
    ResizeX,ResizeY    : X,Y方向へのリサイズ
    MoveX,  MoveY      : X,Y方向への移動 

  98/07  by N.Watari  (watariya@geocities.co.jp)
-------------------------------------------------------------}
unit SelShape;

interface

uses
  Windows, Classes, Controls, ExtCtrls, Graphics;

type
  TSelMode = (SelM, SelN, SelS, SelW, SelE, SelNE, SelNW, SelSE, SelSW);
  TSelOptSet = (ResizeX, ResizeY, MoveX, MoveY);
  TSelOpt    = set of TSelOptSet;

type
  TSelShape = class(TShape)
  private
    { Private 宣言 }
    FSizeSense: Integer;
    FMinWidth : Integer;
    FMinHeight: Integer;
    FMinTop   : Integer;
    FMinLeft  : Integer;
    FMaxBot   : Integer;
    FMaxRit   : Integer;
    FSelOpt   : TSelOpt;
    FSelDrag  : Boolean;
    FSelMode  : TSelMode;
    PreX, PreY: Integer;
    procedure SelChgTop(Y: Integer);
    procedure SelChgBot(Y: Integer);
    procedure SelChgLft(X: Integer);
    procedure SelChgRit(X: Integer);
    procedure SelChgMov(X, Y: Integer);
  protected
    { Protected 宣言 }
  public
    { Public 宣言 }
    constructor Create(AOwner: TComponent); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp  (Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  published
    { Published 宣言 }
    property SizeSense:  Integer read FSizeSense write FSizeSense;
    property MinWidth:   Integer read FMinWidth  write FMinWidth;
    property MinHeight:  Integer read FMinHeight write FMinHeight;
    property MinTop:     Integer read FMinTop    write FMinTop;
    property MinLeft:    Integer read FMinLeft   write FMinLeft;
    property MaxBottom:  Integer read FMaxBot    write FMaxBot;
    property MaxRight :  Integer read FMaxRit    write FMaxRit;
    property SelOption: TSelOpt read FSelOpt    write FSelOpt;
  end;

procedure Register;

implementation


constructor TSelShape.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSizeSense := 5;
  FMinWidth  := 5;
  FMinHeight := 5;
  FMaxRit    := 0;
  FMaxBot    := 0;
  FMinTop    := 0;
  FMinLeft   := 0;
  FSelDrag := False;
  FSelOpt := [ResizeX, ResizeY, MoveX, MoveY];
  Brush.Style := bsClear;
end;

procedure TSelShape.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  CPoint: TPoint;
  Rect : TRect;
begin
  inherited MouseDown(Button, Shift, X, Y);
  FSelDrag := True;
  PreX := X;
  PreY := Y;
  CPoint.X := 0;
  CPoint.Y := 0;
  CPoint := Parent.ClientToScreen(Cpoint);
  Rect.Left  := CPoint.X;
  Rect.Top   := CPoint.Y;
  Rect.Right := CPoint.X + Parent.Width;
  Rect.Bottom:= CPoint.Y + Parent.Height;
  ClipCursor(@Rect);
end;

procedure TSelShape.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  FSelDrag := False;
  ClipCursor(nil);
end;

procedure TSelShape.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if FSelDrag then
  begin
    case FSelMode of                                  // 縦方向変更
        SelN, SelNW, SelNE: SelChgTop(Y-PreY);
        SelS, SelSW, SelSE: SelChgBot(Y-PreY);
    end;
    case FSelMode of                                  // 横方向変更
      SelW, SelNW, SelSW: SelChgLft(X-PreX);
      SelE, SelNE, SelSE: SelChgRit(X-PreX);
    end;
    if FSelMode = SelM then
      SelChgMov(X-PreX,Y-PreY);
  end
  else
  begin
    if X <= FSizeSense then                           //マウス左
    begin
      if Y <= FSizeSense then                         //        上
        FSelMode := SelNW
      else if (Height - Y) <= FSizeSense then         //        下
        FSelMode := SelSW
      else                                            //        中
        FSelMode := SelW;
    end
    else if (Width - X) <= FSizeSense then            //マウス右
    begin
      if Y <= FSizeSense then                         //        上
        FSelMode := SelNE
      else if (Height - Y) <= FSizeSense then         //        下
        FSelMode := SelSE
      else                                            //        中
        FSelMode := SelE;
    end
    else                                              //マウス中央
    begin
      if Y <= FSizeSense then                         //        上
        FSelMode := SelN
      else if (Height - Y) <= FSizeSense then         //        下
        FSelMode := SelS
      else                                            //        中
        FSelMode := SelM;
    end;
  end;
  if not (ResizeX in FSelOpt) then
  begin
    case FselMode of
      SelNW, SelNE : FselMode := SelN;
      SelSW, SelSE : FSelMode := SelS;
      SelW,  SelE  : FSelMode := SelM;
    end;
  end;
  if not (ResizeY in FSelOpt) then
  begin
    case FselMode of
      SelNW, SelSW : FselMode := SelW;
      SelNE, SelSE : FSelMode := SelE;
      SelN,  SelS  : FSelMode := SelM;
    end;
  end;
  case FSelMode of
    SelM:          Cursor := crDefault;
    SelNW, SelSE:  Cursor := crSizeNWSE;
    SelSW, SelNE:  Cursor := crSizeNESW;
    SelN,  SelS :  Cursor := crSizeNS;
    SelW,  SelE :  Cursor := crSizeWE;
  end;
end;

procedure TSelShape.SelChgTop(Y: Integer);                 //上に伸縮
begin
  if (Top + Y < FMinTop) then
    Y := FMinTop - Top;
  if (Height - Y < FMinHeight) then Exit;
  Top    := Top    + Y;
  Height := Height - Y;
end;

procedure TSelShape.SelChgBot(Y: Integer);                 //下に伸縮
begin
  if (Height + Y < FMinHeight) then Exit;
  if (FMaxBot <= FMinTop) then                                  //MaxBot指定なし
  begin                                                         //  Maxは親Cntrl
    if (Top + Height + Y > Parent.ClientHeight) then
      Y := Parent.ClientHeight - (Top + Height);
  end
  else                                                          //MaxBot指定あり
    if (Top + Height + Y > FMaxBot) then
      Y := FMaxBot - (Top + Height);
  Height := Height + Y;
  PreY := PreY + Y;
end;

procedure TSelShape.SelChgLft(X: Integer);                 //左に伸縮
begin
  if (Left + X < FMinLeft) then
    X := FMinLeft - Left;
  if (Width - X < FMinWidth) then Exit;
    Left    := Left    + X;
    Width := Width - X;
end;

procedure TSelShape.SelChgRit(X: Integer);                 //右に伸縮
begin
  if (Width + X < FMinWidth) then Exit;
  if (FMaxRit <= FMinLeft) then                                 //MaxRit指定なし
  begin                                                         //  Maxは親Cntrl
    if (Left + Width + X > Parent.ClientWidth) then
      X := Parent.ClientWidth -(Left + Width);
  end
  else                                                          //MaxRit指定あり
    if (Left + Width + X > FMaxRit) then
      X := FMaxRit - (Left + Width);
    Width := Width + X;
    PreX := PreX + X;
end;

procedure TSelShape.SelChgMov(X, Y: Integer);
begin
  if (MoveY in FSelOpt) then
  begin
    if (Top + Y < FMinTop) then                               //****** 縦
      Y := FMinTop - Top;
    if (FMaxBot <= FMinTop) then                                  //MaxBot指定なし
    begin                                                         //  Maxは親Cntrl
      if (Top + Height + Y > Parent.ClientHeight) then
        Y := Parent.ClientHeight - (Top + Height);
    end
    else                                                          //MaxBot指定あり
      if (Top + Height + Y > FMaxBot) then
        Y := FMaxBot - (Top + Height);
    Top := Top + y;
  end;
  if (MoveX in FSelOpt) then
  begin
    if (Left + X < FMinLeft) then                             //****** 横
      X := FMinLeft - Left;
    if (FMaxRit <= FMinLeft) then                                 //MaxRit指定なし
    begin                                                         //  Maxは親Cntrl
      if (Left + Width + X > Parent.ClientWidth) then
        X := Parent.ClientWidth -(Left + Width);
    end
    else                                                          //MaxRit指定あり
      if (Left + Width + X > FMaxRit) then
        X := FMaxRit - (Left + Width);
    Left := Left + X;
  end;
end;

procedure Register;
begin
  RegisterComponents('Samples', [TSelShape]);
end;

end.
