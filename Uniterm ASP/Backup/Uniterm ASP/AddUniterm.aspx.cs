using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniterm_ASP
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DataBase db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataBase();

            if (!IsPostBack)
            {
                for (int i = 12; i <= 20; i++)
                    ddlSize.Items.Add(i.ToString());

                ddlFont.Items.Add("Times New Roman");
                ddlFont.Items.Add("Arial");
                ddlFont.Items.Add("Tahoma");
                ddlFont.Items.Add("Courier");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string podst = cbPodstawienie.SelectedValue.ToString();

            if (podst == "NONE") podst = "";

            string sql = "insert into uniterms values('" + tbName.Text + "','" + tbDescription.Text + "','" +
                          tbSA.Text + "','" + tbSB.Text + "','" + rblOperator.SelectedValue.ToString() +
                          "','" + tbA.Text + "','" + tbB.Text + "','" + tbC.Text + "'," +
                          ddlSize.SelectedValue + ",'" + ddlFont.SelectedValue + "','" +
                          podst + "');";
            try
            {
                db.RunQuery(sql);
            }
            catch
            {
                lbError.Text = "Wystąpił błąd podczas dodawania unitermu!";
                return;
            }

            lbError.Text = "Dodano uniterm!";
        }
    }
}
