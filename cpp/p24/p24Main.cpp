/***************************************************************
 * Name:      p24Main.cpp
 * Purpose:   Code for Application Frame
 * Author:    winsphinX (email@)
 * Created:   2015-06-03
 * Copyright: winsphinX (http://)
 * License:
 **************************************************************/

#include "p24Main.h"
#include <wx/msgdlg.h>
#include <wx/math.h>

const double PRECISION = 1E-6;
const int COUNT = 4;
const int RESULT = 24;
double number[COUNT];
wxString expression[COUNT];
int digit = 0;

bool Test(int n)
{
    if (n == 1)
    {
        if (fabs(number[0] - RESULT) < PRECISION)
            return true;
        else
            return false;
    }
    for (int i = 0; i < n; i++)
    {
        for (int j = i + 1; j < n; j++)
        {
            double a, b;
            wxString expa, expb;
            a = number[i];
            b = number[j];
            number[j] = number[n - 1];
            expa = expression[i];
            expb = expression[j];
            expression[j] = expression[n - 1];
            expression[i] = '(' + expa + '+' + expb + ')';
            number[i] = a + b;
            if (Test(n - 1))
                return true;
            expression[i] = '(' + expa + '-' + expb + ')';
            number[i] = a - b;
            if (Test(n - 1))
                return true;
            expression[i] = '(' + expb + '-' + expa + ')';
            number[i] = b - a;
            if (Test(n - 1))
                return true;
            expression[i] = '(' + expa + '*' + expb + ')';
            number[i] = a * b;
            if (Test(n - 1))
                return true;
            if (b != 0)
            {
                expression[i] = '(' + expa + '/' + expb + ')';
                number[i] = a / b;
                if (Test(n - 1))
                    return true;
            }
            if (a != 0)
            {
                expression[i] = '(' + expb + '/' + expa + ')';
                number[i] = b / a;
                if (Test(n - 1))
                    return true;
            }
            number[i] = a;
            number[j] = b;
            expression[i] = expa;
            expression[j] = expb;
        }
    }
    return false;
}


//(*InternalHeaders(p24Frame)
#include <wx/font.h>
#include <wx/intl.h>
#include <wx/string.h>
//*)

//helper functions
enum wxbuildinfoformat
{
    short_f, long_f
};

wxString wxbuildinfo(wxbuildinfoformat format)
{
    wxString wxbuild(wxVERSION_STRING);
    if (format == long_f)
    {
#if defined(__WXMSW__)
        wxbuild << _T("-Windows");
#elif defined(__UNIX__)
        wxbuild << _T("-Linux");
#endif
#if wxUSE_UNICODE
        wxbuild << _T("-Unicode build");
#else
        wxbuild << _T("-ANSI build");
#endif // wxUSE_UNICODE
    }
    return wxbuild;
}

//(*IdInit(p24Frame)
const long p24Frame::ID_TEXTCTRL1 = wxNewId();
const long p24Frame::ID_BUTTON1 = wxNewId();
const long p24Frame::ID_BUTTON2 = wxNewId();
const long p24Frame::ID_BUTTON3 = wxNewId();
const long p24Frame::ID_BUTTON4 = wxNewId();
const long p24Frame::ID_BUTTON5 = wxNewId();
const long p24Frame::ID_BUTTON6 = wxNewId();
const long p24Frame::ID_BUTTON7 = wxNewId();
const long p24Frame::ID_BUTTON8 = wxNewId();
const long p24Frame::ID_BUTTON9 = wxNewId();
const long p24Frame::ID_BUTTON_NEW = wxNewId();
const long p24Frame::ID_BUTTON_HELP = wxNewId();
const long p24Frame::ID_BUTTON_QUIT = wxNewId();
//*)

BEGIN_EVENT_TABLE(p24Frame, wxFrame)
    //(*EventTable(p24Frame)
    //*)
END_EVENT_TABLE()

p24Frame::p24Frame(wxWindow* parent, wxWindowID id)
{
    //(*Initialize(p24Frame)
    wxGridSizer* GridSizer1;
    wxBoxSizer* BoxSizer1;
    Create(parent, id, wxEmptyString, wxDefaultPosition, wxDefaultSize, wxDEFAULT_DIALOG_STYLE, _T("id"));
    BoxSizer1 = new wxBoxSizer(wxVERTICAL);
    TextCtrl1 = new wxTextCtrl(this, ID_TEXTCTRL1, wxEmptyString, wxDefaultPosition, wxSize(280, 40), wxTE_RIGHT, wxDefaultValidator, _T("ID_TEXTCTRL1"));
    wxFont TextCtrl1Font(20, wxFONTFAMILY_SWISS, wxFONTSTYLE_NORMAL, wxFONTWEIGHT_NORMAL, false, _T("Monaco"), wxFONTENCODING_DEFAULT);
    TextCtrl1->SetFont(TextCtrl1Font);
    BoxSizer1->Add(TextCtrl1, 1, wxALL | wxALIGN_CENTER_HORIZONTAL, 5);
    GridSizer1 = new wxGridSizer(4, 3, 0, 0);
    Button1 = new wxButton(this, ID_BUTTON1, _("1"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON1"));
    GridSizer1->Add(Button1, 1, wxALL | wxALIGN_CENTER_VERTICAL, 5);
    Button2 = new wxButton(this, ID_BUTTON2, _("2"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON2"));
    GridSizer1->Add(Button2, 1, wxALL | wxALIGN_CENTER_VERTICAL, 5);
    Button3 = new wxButton(this, ID_BUTTON3, _("3"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON3"));
    GridSizer1->Add(Button3, 1, wxALL | wxALIGN_CENTER_VERTICAL, 5);
    Button4 = new wxButton(this, ID_BUTTON4, _("4"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON4"));
    GridSizer1->Add(Button4, 1, wxALL | wxALIGN_CENTER_VERTICAL, 5);
    Button5 = new wxButton(this, ID_BUTTON5, _("5"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON5"));
    GridSizer1->Add(Button5, 1, wxALL | wxALIGN_CENTER_VERTICAL, 5);
    Button6 = new wxButton(this, ID_BUTTON6, _("6"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON6"));
    GridSizer1->Add(Button6, 1, wxALL | wxALIGN_CENTER_VERTICAL, 5);
    Button7 = new wxButton(this, ID_BUTTON7, _("7"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON7"));
    GridSizer1->Add(Button7, 1, wxALL | wxALIGN_CENTER_VERTICAL, 5);
    Button8 = new wxButton(this, ID_BUTTON8, _("8"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON8"));
    GridSizer1->Add(Button8, 1, wxALL | wxALIGN_CENTER_VERTICAL, 5);
    Button9 = new wxButton(this, ID_BUTTON9, _("9"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON9"));
    GridSizer1->Add(Button9, 1, wxALL | wxALIGN_CENTER_VERTICAL, 5);
    ButtonNew = new wxButton(this, ID_BUTTON_NEW, _("New"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON_NEW"));
    GridSizer1->Add(ButtonNew, 1, wxALL | wxALIGN_CENTER_VERTICAL, 5);
    ButtonHelp = new wxButton(this, ID_BUTTON_HELP, _("Help"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON_HELP"));
    GridSizer1->Add(ButtonHelp, 1, wxALL | wxALIGN_CENTER_VERTICAL, 5);
    ButtonQuit = new wxButton(this, ID_BUTTON_QUIT, _("Quit"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON_QUIT"));
    GridSizer1->Add(ButtonQuit, 1, wxALL | wxALIGN_CENTER_VERTICAL, 5);
    BoxSizer1->Add(GridSizer1, 3, wxALL | wxALIGN_CENTER_HORIZONTAL, 5);
    SetSizer(BoxSizer1);
    BoxSizer1->Fit(this);
    BoxSizer1->SetSizeHints(this);
    Connect(ID_BUTTON1, wxEVT_COMMAND_BUTTON_CLICKED, (wxObjectEventFunction)&p24Frame::OnButton1Click);
    Connect(ID_BUTTON2, wxEVT_COMMAND_BUTTON_CLICKED, (wxObjectEventFunction)&p24Frame::OnButton2Click);
    Connect(ID_BUTTON3, wxEVT_COMMAND_BUTTON_CLICKED, (wxObjectEventFunction)&p24Frame::OnButton3Click);
    Connect(ID_BUTTON4, wxEVT_COMMAND_BUTTON_CLICKED, (wxObjectEventFunction)&p24Frame::OnButton4Click);
    Connect(ID_BUTTON5, wxEVT_COMMAND_BUTTON_CLICKED, (wxObjectEventFunction)&p24Frame::OnDigitClick);
    Connect(ID_BUTTON6, wxEVT_COMMAND_BUTTON_CLICKED, (wxObjectEventFunction)&p24Frame::OnDigitClick);
    Connect(ID_BUTTON7, wxEVT_COMMAND_BUTTON_CLICKED, (wxObjectEventFunction)&p24Frame::OnDigitClick);
    Connect(ID_BUTTON8, wxEVT_COMMAND_BUTTON_CLICKED, (wxObjectEventFunction)&p24Frame::OnDigitClick);
    Connect(ID_BUTTON9, wxEVT_COMMAND_BUTTON_CLICKED, (wxObjectEventFunction)&p24Frame::OnDigitClick);
    Connect(ID_BUTTON_NEW, wxEVT_COMMAND_BUTTON_CLICKED, (wxObjectEventFunction)&p24Frame::OnNew);
    Connect(ID_BUTTON_HELP, wxEVT_COMMAND_BUTTON_CLICKED, (wxObjectEventFunction)&p24Frame::OnAbout);
    Connect(ID_BUTTON_QUIT, wxEVT_COMMAND_BUTTON_CLICKED, (wxObjectEventFunction)&p24Frame::OnQuit);
    //*)
}

p24Frame::~p24Frame()
{
    //(*Destroy(p24Frame)
    //*)
}

void p24Frame::OnQuit(wxCommandEvent& event)
{
    Close();
}

void p24Frame::OnAbout(wxCommandEvent& event)
{
    wxString msg = "Select 4 digits to get 24 points";
    wxMessageBox(msg, _("Welcome"));
}

void p24Frame::OnNew(wxCommandEvent& event)
{
    digit = 0;
    TextCtrl1->SetLabel(wxString(""));
    ButtonNew->SetLabel(wxString("New"));
}

void p24Frame::OnDigitClick(wxCommandEvent& event)
{
//    this->SetForegroundColour(wxSystemSettings::GetColour(wxSYS_COLOUR_HIGHLIGHTTEXT));
//    Refresh();
    wxString str = this->GetLabel();
    TextCtrl1->SetLabel(str);
}

void p24Frame::OnButton1Click(wxCommandEvent& event)
{
    if (digit < COUNT)
    {
        number[digit] = 1;
        digit++;
        wxString str = Button1->GetLabel();
        TextCtrl1->SetLabel(TextCtrl1->GetLabel() + str);
    }
    else
    {
        ButtonNew->SetLabel(wxString("Calc"));
    }
}

void p24Frame::OnButton2Click(wxCommandEvent& event)
{
    if (digit < COUNT)
    {
        number[digit] = 2;
        digit++;
        wxString str = Button2->GetLabel();
        TextCtrl1->SetLabel(TextCtrl1->GetLabel() + str);
    }
    else
    {
        ButtonNew->SetLabel(wxString("Calc"));
    }
}

void p24Frame::OnButton3Click(wxCommandEvent& event)
{
    if (digit < COUNT)
    {
        number[digit] = 3;
        digit++;
        wxString str = Button3->GetLabel();
        TextCtrl1->SetLabel(TextCtrl1->GetLabel() + str);
    }
    else
    {
        ButtonNew->SetLabel(wxString("Calc"));
    }
}

void p24Frame::OnButton4Click(wxCommandEvent& event)
{
    if (digit < COUNT)
    {
        number[digit] = 4;
        digit++;
        wxString str = Button4->GetLabel();
        TextCtrl1->SetLabel(TextCtrl1->GetLabel() + str);
    }
    else
    {
        ButtonNew->SetLabel(wxString("Calc"));
    }
}
