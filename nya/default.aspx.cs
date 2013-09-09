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

namespace nya
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Logo.ImageUrl = "/nya.jpg";
        }

        protected int LoginCheck(string name, string pwd)
        {
            int i = 0;
            string TempSql = "select * from users where userid = '" + name + "'";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        string temppwd = dr[1].ToString();
                        if (temppwd == pwd)
                        {
                            i = 1;
                        }
                        else
                        {
                            i = 2;
                        }
                    }
                    dr.Close();
                }
                con.Close();
            }
            return i;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            string name = UserNameBox.Text;
            string pwd = PassWordBox.Text;

            if (name.Length != 0 && pwd.Length != 0)
            {
                int i = LoginCheck(name, pwd);
                if (i == 0)
                {
                    CanLogin.Text = "用户名不存在";
                }
                else if (i == 1)
                {
                    string newweb = "UserCenter.aspx";
                    this.Session["username"] = name;
                    Response.Redirect(newweb);
                }
                else if (i == 2)
                {
                    CanLogin.Text = "密码错误！";
                }
            }
            else
                CanLogin.Text = "请检查用户名和密码格式！";
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("register.aspx");
        }

    }
}