using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using DevExpress.Utils;

public partial class _Default : System.Web.UI.Page {
    private string[] values = new string[] { "CategoryName1", "CategoryName3", "CategoryName5", "CategoryName7" };

    protected void Page_Load(object sender, EventArgs e) {
        gv.DataSource = Enumerable.Range(0, 9).Select(i => new {
            CategoryID = i,
            CategoryName = "CategoryName" + i,
            Description = "Description" + i
        });
        gv.DataBind();
        HideEditor(gv);
    }

    protected void gv_BeforeGetCallbackResult(object sender, EventArgs e) {
        HideEditor(sender as ASPxGridView);
    }

    private void HideEditor(ASPxGridView gv) {
        if (gv.IsEditing && !gv.IsNewRowEditing) {
            string value = gv.GetRowValues(gv.EditingRowVisibleIndex, "CategoryName").ToString();
            gv.DataColumns["Description"].EditFormSettings.Visible = values.Contains(value) ? DefaultBoolean.False : DefaultBoolean.True;
        }
    }
}