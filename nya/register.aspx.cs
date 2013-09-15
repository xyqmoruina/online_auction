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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Logo.ImageUrl = "/nya.jpg";
        }
        protected int IDCheck(string urname)
        {
            int i = 0;
            string TempSql = "select userid from users where userid='" + urname + "'";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        i++;
                    }
                    dr.Close();
                }
                con.Close();
            }
            return i;
        }
        protected void CheckID_Click(object sender, EventArgs e)
        {
            string TempUserID = UserIDBox.Text;
            if (TempUserID.Length != 0)
            {
                int i = IDCheck(TempUserID);
                if (i == 0)
                {
                    SuccessLable.Text = "恭喜！用户名可以使用";
                    SuccessLable.Visible = true;
                }
                else
                {
                    SuccessLable.Text = "用户名重复，请重新输入";
                    SuccessLable.Visible = true;
                }
            }
            else
            {
                SuccessLable.Text = "请输入用户名！";
                SuccessLable.Visible = true;
            }
        }

        protected int RegisterUr(string name, string nickname, string pwd)
        {
            int IsSuc = 0;
            string TempSql = "insert into users values('";
            if (nickname.Length == 0)
            {
                TempSql = TempSql + name + "','" + pwd + "',null, 0,null)";
            }
            else
            {
                TempSql = TempSql + name + "','" + pwd + "','" + nickname + "', 0,null)";
            }
            
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                IsSuc = int.Parse(cmd.ExecuteNonQuery().ToString());
                con.Close();
            }
            return IsSuc;
        }

        protected void SubmitButton_Click1(object sender, ImageClickEventArgs e)
        {
            int i;
            int Lea = 1;
            int IsF = 0;
            string userid = UserIDBox.Text;
            if (userid.Length == 0)
            {
                IsFinishLabal.Text = "请输入用户名！";
                Lea = 0;
            }
            else
            {
                i = IDCheck(userid);
                if (i == 1)
                {
                    IsFinishLabal.Text = "用户名重复，请重新输入";
                    Lea = 0;
                }
            }
            string nickname = UserNickNameBox.Text;
            string pwd1 = PassWordBox.Text;
            string pwd2 = TextBox1.Text;
            if (pwd1.Length == 0 || pwd2.Length == 0)
            {
                IsFinishLabal.Text = "请输入密码";
                Lea = 0;
            }
            else if (pwd1 != pwd2)
            {
                IsFinishLabal.Text = "密码输入不一致";
                Lea = 0;
            }
            string nyaboxx = NyaBox.Text;
            if (nyaboxx != "2")
            {
                IsFinishLabal.Text = "验证问题回答错误";
                Lea = 0;
            }
            if (CheckAgree.Checked && Lea == 1)
            {
                IsF = RegisterUr(userid, nickname, pwd1);
            }
            else if (!CheckAgree.Checked)
            {
                IsFinishLabal.Text = "请阅读用户许可协议！";
            }
            if (IsF == 1)
            {
                Response.Write("<script language='javascript'>alert('注册成功！');</script>");
                Response.Redirect("default.aspx");
            }
            else
            {
                SuccessLable.Visible = false;
            }
        }
    }
}