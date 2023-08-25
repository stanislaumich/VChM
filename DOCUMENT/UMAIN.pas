unit UMAIN;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
    System.Actions, Vcl.ActnList, inifiles, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
    FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
    FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait,
    FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
    FireDAC.Comp.DataSet, FireDAC.Comp.Client, ustr, Vcl.ComCtrls;

type
    TForm1 = class(TForm)
        BitBtn1: TBitBtn;
        BitBtn2: TBitBtn;
        Label1: TLabel;
        Edit1: TEdit;
        ActionList1: TActionList;
        Action1: TAction;
        Action2: TAction;
        Label2: TLabel;
        Memo1: TMemo;
        BitBtn3: TBitBtn;
        GroupBox1: TGroupBox;
        GroupBox2: TGroupBox;
        Action3: TAction;
        BitBtn4: TBitBtn;
        BitBtn5: TBitBtn;
        FDC: TFDConnection;
        QLog: TFDQuery;
        ProgressBar1: TProgressBar;
        QGetSQL: TFDQuery;
        QWork: TFDQuery;
        procedure Action1Execute(Sender: TObject);
        procedure Action2Execute(Sender: TObject);
        procedure Action3Execute(Sender: TObject);
        procedure BitBtn4Click(Sender: TObject);
        procedure BitBtn5Click(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure log(tip: integer; s: string);
        procedure createcurrdir(s: string);
        procedure BitBtn1Click(Sender: TObject);
        procedure BitBtn2Click(Sender: TObject);
        function WorkFile(s: string): integer;
        function trytofindnum(s: string): string;
        function getsql(s: string): string;
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    Form1: TForm1;

    // settings
    uselogin: boolean;
    infolder, arcfolder, scaner, currdir: string;

    // settings

implementation

{$R *.dfm}

uses USett, UArc, UNomer;

function TForm1.getsql(s: string): string;
begin
    // QGetsql.Close;
    QGetSQL.Open('select value from sql where name=' + Quotedstr(s));
    getsql := QGetSQL.FieldByName('value').AsString;
end;

procedure TForm1.log(tip: integer; s: string);
begin
    QLog.ParamByName('tip').AsInteger := tip;
    QLog.ParamByName('text').AsString := s;
    QLog.ExecSQL;
end;

procedure TForm1.createcurrdir(s: string);
var
    s1, s2, s3, ds: string;
begin
    ds := datetostr(date);
    s1 := mypos(ds, '.', 1);
    s2 := mypos(ds, '.', 2);
    s3 := mypos(ds, '.', 3);
    ds := s + '\' + s3 + '\' + s2 + '\' + s1;
    createdirex(ds);
    currdir := ds;
end;

procedure TForm1.Action1Execute(Sender: TObject);
begin
    BitBtn1.Click;
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
    BitBtn2.Click;
end;

procedure TForm1.Action3Execute(Sender: TObject);
begin
    BitBtn3.Click;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
    createcurrdir(arcfolder);
end;

function TForm1.trytofindnum(s: string): string;
begin

    trytofindnum := '0000000';
end;

function TForm1.WorkFile(s: string): integer;
var
    i: integer;
    f: file;
    num: string;
begin
    // ���������� ���� ���� - ���� ������
    // ��������� ������, ���������� ����� ���������,
    // �������� �� �����, ��������� ��� �� �� �����,
    // �������� ��� � ������ ��� ��� ����������

    assignfile(f, s);
    reset(f);
    i := filesize(f);
    if i = 0 then
    begin
        WorkFile := 1;
        Closefile(f);
        exit;
    end
    else
        Closefile(f);
    // ���� �� �������� �������, ���������� ���������
    num := trytofindnum(s);

    WorkFile := 0;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
    sl, sr: tstringlist;
    s, qs, lastnum: string;
    f: file;
    i, err, merr: integer;
    lastid: longint;
    j: longint;
begin
    // ������� �� �����, ��� ����� ����������
    // ���� ���� ����������� � ������������ ������
    // ����� ��������� � ������ ������ � ���� ������
    // ����������� ����� � ����� ������, ���� ������ -
    // ��������� ����� ��, ��� ��������� ������ ��������
    // ��������
    sl := tstringlist.Create;
    sr := tstringlist.Create;
    Edit1.Text := '';
    err := 0;
    ProgressBar1.Position := 0;
    ProgressBar1.Step := 1;
    // Memo1.lines.Clear;
    listfiledir(infolder + '\', sl, '*.*');
    sl.Delete(0);
    sl.Delete(0);
    // for i := 0 to memo1.lines.count-1 do
    // sl.add(Memo1.lines[i]);
    if sl.Count=0 then
     begin
      ShowMessage('�� ������� �������������� ������!');
      Exit;
     end;
    // ��� ����� �������������� ����� � ������ ������ ��� �������������
    // � ���������� �������� ����� ��������� ���� ������� ��� ������

    FNomer.Edit1.Text:='123456789';

    FNomer.Showmodal;
    Edit1.Text:=Fnomer.Edit1.Text;
    // ���������� ���������
    ProgressBar1.Max := sl.Count;
    for i := 0 to sl.Count - 1 do
    begin
        if WorkFile(sl[i]) > 0 then
        begin
            err := err + 1;
        end;;
        ProgressBar1.StepIt;
    end;
    ProgressBar1.Position := ProgressBar1.Max;
    if err = 0 then
    begin
        // ������ ��� ��������� �� ����
        // ����� ��� ����� ������
        // ��������� ����� �� �����
        merr := 0;
        for i := 0 to sl.Count - 1 do
        begin
            // ���������
            s := sl[i];
            if MoveFile(PChar(s), PChar(currdir + '\'+Edit1.Text+ '_' + extractfilename(s)))=false then
             begin
              ShowMessage('���� ��� ����� ��������� ��� ���������� � �������� �����');
              merr :=merr + 1;
             end;
            // ���������
            assignfile(f, currdir + '\'+Edit1.Text+ '_' + extractfilename(s));
            reset(f);
            j := filesize(f);
            if j = 0 then
            begin
                merr := merr + 1;
                Closefile(f);
            end
            else
            begin
                sr.Add(currdir + '\'+Edit1.Text+ '_' + extractfilename(s));
                Closefile(f);
            end;
        end;
        if merr = 0 then
        begin // ����� �� �����, ������ � ����   SR
            Memo1.lines := sr;
            // ������ ������ ���������
            QWork.Close;
            QWork.SQL.Clear;
            QWork.SQL.Add(getsql('insertnewnak'));
            //memo1.lines.add( getsql('insertnewnak'));
            QWork.ParamByName('num').AsString := Edit1.Text;
            QWork.ParamByName('dop').AsString := '';

            QWork.ExecSQL;
            QWork.Close;
            QWork.SQL.Clear;
            QWork.SQL.Add(getsql('getlastnak'));
            QWork.Open();
            lastid := QWork.FieldByName('id').AsInteger;
            lastnum := QWork.FieldByName('num').AsString;
            // ������ �������, ������ ��������
{INSERT INTO VCM.FILES (   ID, IDNAK, FNAME,   DOP) VALUES ( null, :IDNAK,  :FNAME,  :DOP);}
            // ������ ����� ��� ���� ������
            QWork.Close;
            QWork.SQL.Clear;
            QWork.SQL.Add(Getsql('insertnewfile'));
            for i := 0 to sr.Count - 1 do
            begin
             QWork.ParamByName('idnak').Asinteger:=lastid;
             QWork.ParamByName('fname').AsString:=sr[i];
             QWork.ParamByName('dop').AsString:='';
             QWork.ExecSQL;
            end;

            ShowMessage('�������!!');
        end
        else
        begin // �� ������� ��������� ����� ������ � �������
            ShowMessage('�� ������� �������� ����� � �������� �����');
        end;
    end
    else
    begin // ���� ����� � ������� �������� ��� ������ ������
        ShowMessage('��� ��������� ������ ���������� ������ �����');
    end;

    sl.Free;
    sr.Free;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
    FSett.Edit1.Text := infolder;
    FSett.Edit2.Text := arcfolder;
    FSett.Edit3.Text := scaner;
    FSett.CheckBox1.Checked := uselogin;
    FSett.ShowModal;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin

    FArc.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
    ini: tinifile;
    rlogin: boolean;
begin
    ini := tinifile.Create(Extractfilepath(paramstr(0)) + 'settings.ini');
    uselogin := ini.ReadBool('MAIN', 'UseLogin', false);
    infolder := ini.ReadString('MAIN', 'InFolder', '');
    arcfolder := ini.ReadString('MAIN', 'ArcFolder', '');
    scaner := ini.ReadString('MAIN', 'Scaner', '');

    ini.Free;

    createcurrdir(arcfolder);
    log(0, '������ ���������');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
    ini: tinifile;
begin
    ini := tinifile.Create(Extractfilepath(paramstr(0)) + 'settings.ini');
    ini.WriteBool('MAIN', 'UseLogin', uselogin);
    ini.WriteString('MAIN', 'InFolder', infolder);
    ini.WriteString('MAIN', 'ArcFolder', arcfolder);
    ini.WriteString('MAIN', 'Scaner', scaner);

    ini.Free;
    log(0, '���������� ���������');
end;

end.
