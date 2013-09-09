using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;


namespace nya
{
    public partial class Money : System.Web.UI.Page
    {
        int oldmoney;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("default.aspx");
            username.Text = Session["username"].ToString();
            Logo.ImageUrl = "/nya.jpg";

            string urname = Session["username"].ToString();
            string TempSql = "select money from users where userid='" + urname + "'";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    dr.Read();
                    Label1.Text = dr[0].ToString();
                    oldmoney = int.Parse(dr[0].ToString());
                    dr.Close();
                }
                con.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserCenter.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            string newweb = "default.aspx";
            Response.Redirect(newweb);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int money;
            if (TextBox1.Text.Length == 0)
                money = 0;
            else
                money = int.Parse(TextBox1.Text);
            money += oldmoney;
            string user = Session["username"].ToString();
            string TempSql = "update users set money=" + money.ToString() + " where userid='" + user + "'";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Response.Redirect("UserCenter.aspx");
        }
    }
}