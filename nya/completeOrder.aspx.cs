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
    public partial class completeOrder : System.Web.UI.Page
    {
        int price;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("default.aspx");
            string username = Session["username"].ToString();
            urname.Text = username;
            Logo.ImageUrl = "/nya.jpg";
            string TempSql = "select goods.goodname,goods.goodnum,[order].price from goods,[order] where [order].ordernum = " + Session["order"] + "and goods.goodnum = [order].goodnum";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                Label1.Text = "您正在为商品 " + dr[0].ToString() + " 填写订单";
                goodimage.ImageUrl = "image/" + dr[1].ToString() + ".jpg";
                price = int.Parse(dr[2].ToString());
                Label2.Text = "应付款：" + dr[2].ToString() + "元";
                dr.Close();
                con.Close();
            }
        }

        protected int checkMoney()
        {
            string TempSql = "select money from users where userid = '" + Session["username"] + "'";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                int curMoney = int.Parse(dr[0].ToString());
                dr.Close();
                con.Close();
                if (price > curMoney)
                    return 1;
                else
                    return 0;
            }
        }

        protected void subMoney()
        {
            string sqlSubMoney = "update users set money = money - " + price.ToString() + "where userid = '" + Session["username"] + "'";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(sqlSubMoney, con);
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void insAddr(string a)
        {
            string insaddr = "update [order] set address = '" + a + "' where ordernum=" + Session["order"];
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(insaddr, con);
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void changeOrderState()
        {
            string insaddr = "update [order] set state = '1' where ordernum=" + Session["order"];
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(insaddr, con);
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string address = addr.Text;
            int mm = checkMoney();
            if (mm == 1)
            {
                Response.Write("<script language='javascript'>alert('您的余额不足，请点击确定后转向充值界面');</script>");
                Response.Write("<script language='javascript'>window.location.href=\"Money.aspx\";</script>");
            }
            else
            {
                if (address.Length != 0)
                {
                    subMoney();
                    insAddr(address);
                    changeOrderState();
                    Response.Write("<script language='javascript'>alert('付款成功！');</script>");
                    Response.Redirect("Order.aspx");
                }
                else
                {
                    Response.Write("<script language='javascript'>alert('请填写收货地址！');</script>");
                }
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
    }
}