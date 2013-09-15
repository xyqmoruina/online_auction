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
    public partial class WebForm456 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("default.aspx");
            int flag = 0;
            username.Text = Session["username"].ToString();
            string goodid = Session["GoodID"].ToString();
            GoodImage.ImageUrl = "~/image/" + goodid + ".jpg";
            Logo.ImageUrl = "/nya.jpg";
            string TempSql = "select * from goods where goodnum = " + goodid;
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    GoodName.Text = dr[6].ToString();
                    if (dr[1].ToString() == Session["username"].ToString())
                        flag = 1;
                    else if (dr[10].ToString() == Session["username"].ToString())
                        flag = 2;
                }
                dr.Close();
                con.Close();
            }
            if (flag == 1)
            {
                Response.Write("<script language='javascript'>alert('不能竞拍自己上架的物品！');</script>");
                Response.Write("<script language='javascript'>window.location.href=\"GoodsView.aspx\";</script>");
            }
            else if (flag == 2)
            {
                Response.Write("<script language='javascript'>alert('您的出价目前最高，不能重复出价！');</script>");
                Response.Write("<script language='javascript'>window.location.href=\"GoodsView.aspx\";</script>");
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

        protected void updateGood(int price, string consumer, int times)
        {
            string goodid = Session["GoodID"].ToString();
            times++;
            string TempSql = "update goods set currentprice=" + price.ToString() + ", nowhighest='" + consumer + "', times=" + times + " where goodnum='" + goodid + "'";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        void cutM(int i)
        {
            string TempSql = "update users set money = " + i.ToString() + " where userid = '" + Session["username"].ToString()+"'";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        protected string getLastUser()
        {
            string goodid = Session["GoodID"].ToString();
            string ans;
            string TempSql = "select nowhighest from goods where goodnum = " + goodid;
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                ans = dr[0].ToString();
                dr.Close();
                con.Close();
                return ans;
            }
        }

        protected void retM(string a)
        {
            string temp = "20";
            string TempSql = "update users set money = money+" + temp + " where userid = '" + a + "'";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        protected int moneyCut()
        {
            string TempSql = "select [money] from users where userid = '" + Session["username"].ToString() + "'";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            int i;
            using (con)
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                i = int.Parse(dr[0].ToString());
                if (i >= 20)
                {
                    
                    retM(getLastUser());

                    cutM(i - 20);
                    dr.Close();
                    con.Close();
                    return 1;
                }
                else
                {
                    Response.Write("<script language='javascript'>alert('您的余额不足，请点击确定后转向充值界面');</script>");
                    Response.Write("<script language='javascript'>window.location.href=\"Money.aspx\";</script>");
                    return 0;
                }

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string goodid = Session["GoodID"].ToString();
            int pr = int.Parse(priceBox.Text);
            string TempSql = "select * from goods where goodnum = " + goodid;
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                int curPrice = int.Parse(dr[5].ToString());
                int times = int.Parse(dr[7].ToString());
                if (curPrice >= pr - 1)
                {
                    Response.Write("<script language='javascript'>alert('出价不能小于现价+￥1！');</script>");
                    dr.Close();
                    con.Close();
                    return;
                }
                dr.Close();
                con.Close();
                if (moneyCut() == 1)
                {
                    updateGood(pr, Session["username"].ToString(), times);

                    Response.Write("<script language='javascript'>alert('恭喜您！竞拍成功！');</script>");
                    Response.Write("<script language='javascript'>window.location.href=\"GoodsView.aspx\";</script>");
                }
            }
        }
    }
}