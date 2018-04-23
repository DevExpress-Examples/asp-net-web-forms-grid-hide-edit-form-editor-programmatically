<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>ASPxGridView - How to hide the EditForm editor and column caption programmatically</title>
</head>
<body>
	<form id="form1" runat="server">
		<dx:ASPxGridView ID="gv" runat="server" AutoGenerateColumns="False" ClientInstanceName="gv"
			KeyFieldName="CategoryID" OnBeforeGetCallbackResult="gv_BeforeGetCallbackResult">
			<Columns>
				<dx:GridViewCommandColumn>
					<EditButton Visible="true"></EditButton>
				</dx:GridViewCommandColumn>
				<dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True"
					VisibleIndex="1">
					<EditFormSettings Visible="False" />
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="2">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="3">
				</dx:GridViewDataTextColumn>
			</Columns>
			<SettingsEditing Mode="EditForm"></SettingsEditing>
			<SettingsPager PageSize="5"></SettingsPager>
		</dx:ASPxGridView>
		<dx:ASPxButton ID="postBackBtn" runat="server" Text="PastBack"></dx:ASPxButton>
		<dx:ASPxButton ID="callbackBtn" runat="server" Text="Callback" AutoPostBack="false">
			<ClientSideEvents Click="function(s, e) { gv.PerformCallback(); }" />
		</dx:ASPxButton>
	</form>
</body>
</html>