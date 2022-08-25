Imports DevExpress.Utils
Imports DevExpress.Web
Imports System
Imports System.Linq

Namespace Solution

    Public Partial Class [Default]
        Inherits Web.UI.Page

        Private values As String() = New String() {"CategoryName1", "CategoryName3", "CategoryName5", "CategoryName7"}

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
            gv.DataSource = Enumerable.Range(0, 9).[Select](Function(i) New With {.CategoryID = i, .CategoryName = "CategoryName" & i, .Description = "Description" & i})
            gv.DataBind()
            Me.HideEditor(gv)
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
End Namespace
