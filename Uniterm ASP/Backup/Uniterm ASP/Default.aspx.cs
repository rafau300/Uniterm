using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Media;
using System.Drawing;
using System.Drawing.Imaging;


namespace Uniterm_ASP
{
    public partial class _Default : System.Web.UI.Page
    {
        private const string BASE_URL = "~/UnitermImage.ashx";
        DataBase db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataBase();
            if (!IsPostBack)
            {
                DataTable dt = db.CreateDataTable("select name from uniterms;");
                lbUniterms.DataSource = dt;
                lbUniterms.DataBind();

                if (lbUniterms.Items.Count > 0)
                {
                    Refresh(lbUniterms.Items[0].Value.ToString());
                }
            }

        }

        protected void btnreload_Click(object sender, EventArgs e)
        {
            DataTable dt = db.CreateDataTable("select name from uniterms;");
            lbUniterms.DataSource = dt;
            lbUniterms.DataBind();
        }
        private string ParseRequest(string name)
        {
            return BASE_URL + "?name=" + name;
        }
        private void Refresh(string name)
        {
            Image1.ImageUrl = ParseRequest(name);
            Image1.DataBind();
        }

        protected void lbUniterms_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Refresh(lbUniterms.SelectedValue.ToString());
        }

    }
}
