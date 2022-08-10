Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Utils

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Private values() As String = { "CategoryName1", "CategoryName3", "CategoryName5", "CategoryName7" }

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		gv.DataSource = Enumerable.Range(0, 9).Select(Function(i) New With {
			Key .CategoryID = i,
			Key .CategoryName = "CategoryName" & i,
			Key .Description = "Description" & i
		})
		gv.DataBind()
		HideEditor(gv)
	End Sub

	Protected Sub gv_BeforeGetCallbackResult(ByVal sender As Object, ByVal e As EventArgs)
		HideEditor(TryCast(sender, ASPxGridView))
	End Sub

	Private Sub HideEditor(ByVal gv As ASPxGridView)
		If gv.IsEditing AndAlso Not gv.IsNewRowEditing Then
			Dim value As String = gv.GetRowValues(gv.EditingRowVisibleIndex, "CategoryName").ToString()
			gv.DataColumns("Description").EditFormSettings.Visible = If(values.Contains(value), DefaultBoolean.False, DefaultBoolean.True)
		End If
	End Sub
End Class