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
    public partial class MyOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("default.aspx");
            username.Text = Session["username"].ToString();
            Logo.ImageUrl = "/nya.jpg";
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0)
                Label2.Visible = false;
            GridView2.DataBind();
            if (GridView2.Rows.Count == 0)
                Label3.Visible = false;
            if (GridView1.Rows.Count == 0 && GridView2.Rows.Count == 0)
            {
                Label1.Text = "没有订单";
                Label1.Visible = true;
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#999999'");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
                e.Row.Attributes.Add("style", "cursor:pointer");
                #region
                PostBackOptions myPostBackOptions = new PostBackOptions(this);
                myPostBackOptions.AutoPostBack = false;
                myPostBackOptions.PerformValidation = false;
                myPostBackOptions.RequiresJavaScriptProtocol = true; //加入javascript:头
                String evt = Page.ClientScript.GetPostBackClientHyperlink(sender as GridView, "Select$" + e.Row.RowIndex.ToString());
                e.Row.Attributes.Add("onclick", evt);
                #endregion
                switch (e.Row.Cells[6].Text.Trim())
                {
                    case "0":
                        e.Row.Cells[6].Text = "等待付款";
                        break;
                    case "1":
                        e.Row.Cells[6].Text = "等待发货";
                        break;
                    case "2":
                        e.Row.Cells[6].Text = "等待确认收货";
                        break;
                    case "3":
                        e.Row.Cells[6].Text = "交易成功";
                        break;
                }
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#999999'");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
                e.Row.Attributes.Add("style", "cursor:pointer");
                #region
                PostBackOptions myPostBackOptions = new PostBackOptions(this);
                myPostBackOptions.AutoPostBack = false;
                myPostBackOptions.PerformValidation = false;
                myPostBackOptions.RequiresJavaScriptProtocol = true; //加入javascript:头
                String evt = Page.ClientScript.GetPostBackClientHyperlink(sender as GridView, "Select$" + e.Row.RowIndex.ToString());
                e.Row.Attributes.Add("onclick", evt);
                #endregion
                switch (e.Row.Cells[6].Text.Trim())
                {
                    case "0":
                        e.Row.Cells[6].Text = "等待付款";
                        break;
                    case "1":
                        e.Row.Cells[6].Text = "等待发货";
                        break;
                    case "2":
                        e.Row.Cells[6].Text = "等待确认收货";
                        break;
                    case "3":
                        e.Row.Cells[6].Text = "交易成功";
                        break;
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyGoods.aspx");
        }

        protected void changeOrderState()
        {
            string insaddr = "update [order] set state = '3' where ordernum=" + Session["order"];
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(insaddr, con);
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            return;
        }

        protected string getSaler(string orderID)
        {
            string sql = "select saler from [order] where ordernum = " + orderID;
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            string x;
            using (con)
            {
                con.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    dr.Read();
                    x = dr[0].ToString();
                    dr.Close();
                }
                con.Close();
            }
            return x;
        }

        protected void giveMoneyToSaler(string money, string odID)
        {
            string saler = getSaler(odID);
            string TempSql = "update users set money = money + " + money + " where userid = '" + saler + "'";
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string id = row.Cells[0].Text.ToString();
            this.Session["order"] = id;
            string state = row.Cells[6].Text.ToString();
            switch (state)
            {
                case "交易成功":
                case "等待发货":
                    this.Session["GoodID"] = row.Cells[1].Text.ToString();
                    Response.Redirect("GoodsView.aspx");
                    break;
                case "等待确认收货":
                    changeOrderState();
                    giveMoneyToSaler(row.Cells[3].Text.ToString(), id);
                    Response.Write("<script language='javascript'>alert('收货成功。。');</script>");
                    Response.Write("<script>top.location.reload()</script>");
                    break;
                default:
                    Response.Redirect("completeOrder.aspx");
                    break;
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            string id = row.Cells[0].Text.ToString();
            this.Session["order"] = id;
            string state = row.Cells[6].Text.ToString();
            switch (state)
            {
                case "交易成功":
                case "等待付款":
                case "等待确认收货":
                    this.Session["GoodID"] = row.Cells[1].Text.ToString();
                    Response.Redirect("GoodsView.aspx");
                    break;
                default:
                    Response.Redirect("saleCompleteOrder.aspx");
                    break;
            }
        }
    }
}