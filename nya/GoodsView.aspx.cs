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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("default.aspx");
            username.Text = Session["username"].ToString();
            string goodid = Session["GoodID"].ToString();
            MiaoImage.ImageUrl = @"~/Image/" + goodid + ".jpg";
            string TempSql = "select * from goods where goodnum = " + goodid;
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read()){
                    Saler.Text = dr[1].ToString();
                    Variety.Text = dr[2].ToString();
                    desc.Text = dr[3].ToString();
                    CurrentPrice.Text = "现价：" + dr[5].ToString();
                    GoodName.Text = dr[6].ToString();
                    Times.Text = "现在共有" + dr[7].ToString() + "次出价";
                    DeadLine.Text = dr[8].ToString();
                    if (dr[11].ToString() == "1")
                    {
                        Buy.Text = "该商品已下架";
                        Buy.Enabled = false;
                    }
                }
                dr.Close();
                con.Close();
            }
            Logo.ImageUrl = "/nya.jpg";
        }

        protected void Buy_Click(object sender, EventArgs e)
        {
            string newweb = "buy.aspx";
            Response.Redirect(newweb);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            string newweb = "default.aspx";
            Response.Redirect(newweb);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserCenter.aspx");
        }     

    }
}