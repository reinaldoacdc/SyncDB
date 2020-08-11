object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'SyncData'
  ClientHeight = 504
  ClientWidth = 864
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button2: TButton
    Left = 577
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 0
    OnClick = Button2Click
  end
  object JvWizard1: TJvWizard
    Left = 0
    Top = 0
    Width = 864
    Height = 504
    ActivePage = pageStart
    ButtonBarHeight = 42
    ButtonStart.Caption = 'To &Start Page'
    ButtonStart.NumGlyphs = 1
    ButtonStart.Width = 85
    ButtonLast.Caption = 'To &Last Page'
    ButtonLast.NumGlyphs = 1
    ButtonLast.Width = 85
    ButtonBack.Caption = '< &Back'
    ButtonBack.NumGlyphs = 1
    ButtonBack.Width = 75
    ButtonNext.Caption = '&Next >'
    ButtonNext.NumGlyphs = 1
    ButtonNext.Width = 75
    ButtonFinish.Caption = '&Finish'
    ButtonFinish.NumGlyphs = 1
    ButtonFinish.Width = 75
    ButtonCancel.Caption = 'Cancel'
    ButtonCancel.NumGlyphs = 1
    ButtonCancel.ModalResult = 2
    ButtonCancel.Width = 75
    ButtonHelp.Caption = '&Help'
    ButtonHelp.NumGlyphs = 1
    ButtonHelp.Width = 75
    ShowRouteMap = True
    OnFinishButtonClick = JvWizard1FinishButtonClick
    OnCancelButtonClick = JvWizard1CancelButtonClick
    ExplicitWidth = 688
    DesignSize = (
      864
      504)
    object pageWelcome: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Welcome'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'Instructions'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -11
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      ExplicitWidth = 543
      object Memo1: TMemo
        Left = 0
        Top = 70
        Width = 719
        Height = 392
        Align = alClient
        Lines.Strings = (
          'O processo de sincronismo se consiste em: '
          ''
          'Passo1: '#11
          
            'Configurar a conex'#227'o com o servidor e criar um usu'#225'rio SINCRONIZ' +
            'ADOR.'
          
            'Esse usu'#225'rio deve ser o mesmo usado nas trigger para n'#227'o replica' +
            'r registros infinitamente.'
          ''
          'Passo2: '
          'Configurar o caminho da base de dados dos terminais. '
          
            'Se o banco estiver vazio, tem uma op'#231#227'o de '#39'Carga Inicial'#39' com a' +
            's tabelas que devem ser sincronizadas.'
          ''
          'Passo3: '
          
            'Configurar a lista de onde vai trazer os registros para ser disp' +
            'arado')
        TabOrder = 0
        ExplicitWidth = 543
      end
    end
    object pageServer: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Server'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'Configuration'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -11
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      ExplicitWidth = 543
      object Label1: TLabel
        Left = 32
        Top = 96
        Width = 53
        Height = 13
        Caption = 'Database: '
      end
      object Label2: TLabel
        Left = 32
        Top = 123
        Width = 59
        Height = 13
        Caption = 'Caninho DB:'
      end
      object Label3: TLabel
        Left = 32
        Top = 155
        Width = 40
        Height = 13
        Caption = 'Usuario:'
      end
      object Label4: TLabel
        Left = 32
        Top = 182
        Width = 34
        Height = 13
        Caption = 'Senha:'
      end
      object edtDriver: TEdit
        Left = 91
        Top = 93
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
        Text = 'Firebird'
      end
      object edtCaminhoDB: TEdit
        Left = 91
        Top = 120
        Width = 121
        Height = 21
        TabOrder = 1
        OnExit = edtCaminhoDBExit
      end
      object edtSenha: TEdit
        Left = 91
        Top = 174
        Width = 121
        Height = 21
        TabOrder = 2
        OnExit = edtSenhaExit
      end
      object edtUsuario: TEdit
        Left = 91
        Top = 147
        Width = 121
        Height = 21
        TabOrder = 3
        OnExit = edtUsuarioExit
      end
    end
    object pageTables: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Tables'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'Tabelas a serem sincronizaddas (Carga  Inicial)'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -11
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      object memoTables: TMemo
        Left = 0
        Top = 70
        Width = 719
        Height = 392
        Align = alClient
        Lines.Strings = (
          'TESTE'
          'BASICA')
        TabOrder = 0
        ExplicitLeft = 224
        ExplicitTop = 168
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
    end
    object pageTerminal: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Terminals'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'List of terminals'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -11
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      ExplicitWidth = 543
      object DBGrid1: TDBGrid
        Left = 0
        Top = 111
        Width = 719
        Height = 351
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PATHDB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USUARIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SENHA'
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 70
        Width = 719
        Height = 41
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 543
        object Button1: TButton
          Left = 16
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Carga Inicial'
          TabOrder = 0
          OnClick = Button2Click
        end
      end
    end
    object pageStart: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Start'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'Initialization'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -11
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      EnabledButtons = [bkStart, bkLast, bkBack, bkFinish, bkCancel, bkHelp]
      VisibleButtons = [bkBack, bkNext, bkFinish, bkCancel]
      ExplicitWidth = 543
      object RadioGroup1: TRadioGroup
        Left = 6
        Top = 72
        Width = 185
        Height = 105
        Caption = 'Method'
        Items.Strings = (
          'Automatic'
          'Manual')
        TabOrder = 0
      end
    end
    object routeNodes: TJvWizardRouteMapNodes
      Left = 0
      Top = 0
      Width = 145
      Height = 462
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 704
    Top = 72
    object ClientDataSet1CODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object ClientDataSet1NOME: TStringField
      FieldName = 'NOME'
      Size = 10
    end
    object ClientDataSet1IP: TStringField
      FieldName = 'IP'
    end
    object ClientDataSet1PATHDB: TStringField
      FieldName = 'PATHDB'
      Size = 50
    end
    object ClientDataSet1USUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 10
    end
    object ClientDataSet1SENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 752
    Top = 72
  end
  object TrayIcon1: TTrayIcon
    BalloonHint = 'Running in background'
    OnDblClick = TrayIcon1DblClick
    Left = 17
    Top = 104
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 72
    Top = 104
  end
end
