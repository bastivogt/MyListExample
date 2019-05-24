unit sebastian.vogt.lists;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  generic TBaseList<T> = class
    private
      FArray: array of T;
      FBuffer: Integer;
      FCount: Integer;

      function __Count(): Integer;
      function NeedBuffer(): Boolean;

      //


    public
      constructor Create(VBuffer: Integer); overload;
      constructor Create; overload;

      destructor Destroy; override;

      procedure Add(Value: T);
      function RemoveAt(VIndex: Integer): Boolean;
      function GetValue(VIndex: Integer): T;
      procedure SetValue(VIndex: Integer; Value: T);
      procedure Clear();
      property Item[I: Integer]: T read GetValue write SetValue; default;
      property Count: Integer read FCount;
  end;





  TIntegerList = specialize TBaseList<Integer>;
  TDoubleList = specialize TBaseList<Double>;

  TStringList = specialize TBaseList<string>;
  TObjectList = specialize TBaseList<TObject>;


implementation

constructor TBaseList.Create(VBuffer: Integer);
begin
  inherited Create;
  FBuffer := VBuffer;
  FCount := 0;
  SetLength(FArray, VBuffer);
end;

// Create
constructor TBaseList.create;
begin
  Create(10);
end;


// Destroy
destructor TBaseList.Destroy;
begin
  //WriteLn('Wieder weg!');
  SetLength(FArray, 0);
  inherited;
end;


// __Count
function TBaseList.__Count(): Integer;
begin
  Result := Length(FArray) -  FCount;
end;

// needBuffer
function TBaseList.NeedBuffer(): Boolean;
begin
  if Length(FArray) - FCount > 0 then begin
    Result := False;
  end else begin
      Result := True;
  end;
end;

// Add
procedure TBaseList.Add(Value: T);
begin
  FCount += 1;
  if NeedBuffer then begin
    SetLength(FArray, FCount + FBuffer);
    FArray[FCount - 1] := Value;
  end else begin
      FArray[FCount - 1] := Value;

  end;
  WriteLn('============= Add ================');
  WriteLn('FArray length: ', Length(FArray));
  WriteLn('__Count: ', __Count);
  WriteLn('FCount: ', FCount);

end;


// RemoveAt
function TBaseList.RemoveAt(VIndex: Integer): Boolean;
var
  i: Integer;
  tempLength: Integer;

begin
  tempLength := Length(FArray);
  if (VIndex < 0) or (VIndex >= FCount) then begin
    Result := False;
    Exit;
  end;

  if VIndex = FCount - 1 then begin
    SetLength(FArray, FCount - 1);
    FCount -= 1;
    Result := True;
  end else begin
    for i := VIndex to FCount - 2 do begin
       FArray[i] := FArray[i + 1];
    end;
    SetLength(FArray, FCount - 1);
    FCount -= 1;
    Result := True;
  end;
  SetLength(FArray, tempLength);

  WriteLn('============= Remove ================');
  WriteLn('FArray length: ', Length(FArray));
  WriteLn('__Count: ', __Count);
  WriteLn('FCount: ', FCount);
end;


// GetValue
function TBaseList.GetValue(VIndex: Integer): T;
begin
  if (VIndex < 0) or (VIndex >= Count) then begin
    Exit;
  end else begin
      Result := FArray[VIndex];
  end;
end;

// SetValue
procedure TBaseList.SetValue(VIndex: Integer; Value: T);
begin
  if (VIndex < 0) or (VIndex >= Count) then begin
    Exit;
  end else begin
      FArray[VIndex] := Value;
  end;
end;






// Clear
procedure TBaseList.Clear;
begin
  SetLength(FArray, 0);
  FCount := 0;

end;

end.



