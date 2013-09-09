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
    public partial class UserInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("default.aspx");
            username.Text = Session["username"].ToString();
            Logo.ImageUrl = "/nya.jpg";
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
            string old = oldpwd.Text;
            string oldp;
            string urname=Session["username"].ToString();
            string TempSql = "select userpwd from users where userid='" + urname + "'";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    dr.Read(); 
                   oldp = dr[0].ToString();
                    dr.Close();
                }
                con.Close();
            }
            string pwd1 = PassWordBox.Text;
            string pwd2 = TextBox1.Text;
            int sucflag = 0;
            if (pwd1.Length == 0 || pwd2.Length == 0)
            {
                IsFinishLabal.Text = "请输入新密码";
                sucflag = 1;
            }
            else if (pwd1 != pwd2)
            {
                IsFinishLabal.Text = "新密码输入不一致";
                sucflag = 1;
            }
            else if (old != oldp)
            {
                IsFinishLabal.Text = "旧密码输入错误";
                sucflag = 1;
            }
            if (sucflag == 0)
            {
                string TempSql1 = "update users set userpwd ='" + pwd1 + "' where userid='" + Session["username"].ToString() + "'";
                string ConStr1 = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(ConStr1);
                SqlCommand cmd1 = new SqlCommand(TempSql1, con1);
                using (con1)
                {
                    con1.Open();
                    cmd1.ExecuteNonQuery().ToString();
                    con1.Close();
                }
                Response.Redirect("UserCenter.aspx");
            }
        }
    }
}