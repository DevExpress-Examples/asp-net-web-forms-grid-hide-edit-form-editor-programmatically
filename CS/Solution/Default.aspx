<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Solution.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASPxGridView - How to hide the EditForm editor and column caption programmatically</title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxGridView ID="gv" runat="server" AutoGenerateColumns="False" ClientInstanceName="gv"
            KeyFieldName="CategoryID" OnBeforeGetCallbackResult="gv_BeforeGetCallbackResult">
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="true"/>
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
