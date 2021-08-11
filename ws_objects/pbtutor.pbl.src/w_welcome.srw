﻿$PBExportHeader$w_welcome.srw
$PBExportComments$This is the login window. It requires the application user to enter an ID and a password before continuing.
forward
global type w_welcome from window
end type
type cb_cancel from commandbutton within w_welcome
end type
type cb_ok from commandbutton within w_welcome
end type
type sle_password from singlelineedit within w_welcome
end type
type sle_userid from singlelineedit within w_welcome
end type
type st_password from statictext within w_welcome
end type
type st_userid from statictext within w_welcome
end type
type st_welcome from statictext within w_welcome
end type
type p_sports from picture within w_welcome
end type
end forward

global type w_welcome from window
integer width = 2309
integer height = 1080
boolean titlebar = true
string title = "Hello"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean contexthelp = true
boolean center = true
cb_cancel cb_cancel
cb_ok cb_ok
sle_password sle_password
sle_userid sle_userid
st_password st_password
st_userid st_userid
st_welcome st_welcome
p_sports p_sports
end type
global w_welcome w_welcome

on w_welcome.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.sle_password=create sle_password
this.sle_userid=create sle_userid
this.st_password=create st_password
this.st_userid=create st_userid
this.st_welcome=create st_welcome
this.p_sports=create p_sports
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.sle_password,&
this.sle_userid,&
this.st_password,&
this.st_userid,&
this.st_welcome,&
this.p_sports}
end on

on w_welcome.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.sle_password)
destroy(this.sle_userid)
destroy(this.st_password)
destroy(this.st_userid)
destroy(this.st_welcome)
destroy(this.p_sports)
end on

type cb_cancel from commandbutton within w_welcome
integer x = 1710
integer y = 496
integer width = 402
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;
HALT
end event

type cb_ok from commandbutton within w_welcome
integer x = 1705
integer y = 352
integer width = 402
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OK"
boolean default = true
end type

event clicked;// 1) Instantiate the Transaction object
// 2) Close login window if connection successful

gnv_connect = CREATE &
			n_pbtutor_connectservice

//Local variable declarations
string ls_database, ls_userid, ls_password

//Assignment statements
ls_userid = Trim ( sle_userid.text )
ls_password = Trim ( sle_password.text )
ls_database = "ConnectString='PB Demo DB V2018;"			

//Instantiate with user-entry values
SQLCA.userid = ls_userid
SQLCA.dbpass = ls_password
SQLCA.dbparm = ls_database + "UID=" + &
			ls_userid + ";PWD=" + ls_password + "'"			
			
IF gnv_connect.of_ConnectDB ( ) = 0 THEN
			Close (parent)
END IF			
end event

type sle_password from singlelineedit within w_welcome
integer x = 942
integer y = 504
integer width = 731
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event help;ShowPopupHelp("pbtutor.chm", this, 200)
end event

type sle_userid from singlelineedit within w_welcome
integer x = 942
integer y = 352
integer width = 727
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event help;ShowPopupHelp("pbtutor.chm", this, 100)
end event

type st_password from statictext within w_welcome
integer x = 553
integer y = 516
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Password:"
boolean focusrectangle = false
end type

type st_userid from statictext within w_welcome
integer x = 553
integer y = 360
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "User ID:"
boolean focusrectangle = false
end type

type st_welcome from statictext within w_welcome
integer x = 553
integer y = 64
integer width = 1563
integer height = 164
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Welcome to Way, Inc."
boolean focusrectangle = false
end type

type p_sports from picture within w_welcome
integer x = 41
integer y = 52
integer width = 302
integer height = 252
string picturename = "..\tutsport.bmp"
boolean focusrectangle = false
end type

