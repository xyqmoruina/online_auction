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
    public partial class UserCenter : System.Web.UI.Page
    {
        protected void checkOrders()
        {
            string TempSql = "select count(*) from [order] where (saler='" + 
                Session["username"].ToString() + "' and state = 1) or (consumer='" + Session["username"].ToString() + "' and (state = 0 or state = 2)) ";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                SqlDataReader dr1 = cmd.ExecuteReader();
                while (dr1.Read())
                {
                    if (dr1[0].ToString() != "0")
                    {
                        newOrder.Visible = true;
                    }
                    else
                    {
                        newOrder.Visible = false;
                    }
                }
                dr1.Close();
                con.Close();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("default.aspx");//保证只有用户登录才可使用，设计很好
            Label1.Visible = false;
            string username = Session["username"].ToString();
            //this.Session["username"] = username;
            urname.Text = username;
            Logo.ImageUrl = "/nya.jpg";
            checkOrders();
            FastView.Visible = false;
        }

        protected void SaleButton_Click(object sender, EventArgs e)
        {
            string newweb = "Sale.aspx";
            Response.Redirect(newweb);
        }

        protected void Info_Click(object sender, EventArgs e)
        {
            string newweb = "UserInfo.aspx";
            Response.Redirect(newweb);
        }
        /// <summary>
        /// 得到订单数目
        /// </summary>
        /// <returns> </returns>
        protected int getOrderID()
        {
            int i = 0;
            string TempSql1 = "select * from [order];";
            string ConStr1 = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(ConStr1);
            SqlCommand cmd1 = new SqlCommand(TempSql1, con1);
            using (con1)
            {
                con1.Open();
                SqlDataReader dr1 = cmd1.ExecuteReader();
                while (dr1.Read())
                    i++;
                dr1.Close();
                con1.Close();
            }
            return i;
        }

        protected void createOrder(string goodid, string saler, string cons, string price)
        {
            int newOrderid = getOrderID();
            string TempSql = "insert into [order] values(" + newOrderid.ToString() + ", '" + saler + "', '"
                + cons + "',1," + goodid + ", 0, null, " + price + ")";//尚不清楚state的作用！！！
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

        /// <summary>
        /// 检查该商品是否有竞拍，并将该商品设为已售出，返回1表示正常售出，0表示无人竞拍
        /// </summary>
        /// <param name="goodid"></param>
        /// <returns>@是否成功
        /// </returns>
        protected int closeGood(string goodid)
        {
            string TempSql = "update goods set issaled=1 where goodnum='" + goodid + "'";
            string t = "select times from goods where goodnum=" + goodid;
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            SqlCommand cmd2 = new SqlCommand(t, con);
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd2.ExecuteReader();
                dr.Read();
                if (int.Parse(dr[0].ToString()) >= 1)
                {
                    con.Close();
                    return 1;
                }
                else
                {
                    //商品出价次数为0
                    con.Close();
                    return 0;
                }
            }
        }

        protected void checkGoods()
        {
            DateTime curTime = DateTime.Now;
            string TempSql = "select * from goods";
            string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand(TempSql, con);
            using (con)
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (DateTime.Parse(dr[8].ToString()) <= curTime && dr[11].ToString() != "1")//订单到期并且最高出价不等于1 ？
                    {
                        if (closeGood(dr[0].ToString()) != 0)
                            createOrder(dr[0].ToString(), dr[1].ToString(), dr[10].ToString(), dr[5].ToString());
                    }
                }
                dr.Close();
                con.Close();
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            GridView2.Visible = false;
            checkGoods();
            if (SearchBox.Text.Length != 0)
            {
                GridView1.DataBind();
                if (GridView1.Rows.Count == 0)
                {
                    Label1.Visible = true;
                }
            }
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            string newweb = "default.aspx";
            Response.Redirect(newweb);
        }

        protected void UserPocket_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyGoods.aspx");
        }

       

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Money.aspx");
        }

        protected void newOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Order.aspx");
        }

      
        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.DataRow:
                    //放置鼠标变色
                    e.Row.Attributes.Add("onmouseover","c=this.style.backgroundColor;this.style.backgroundColor='#999999'");
                    e.Row.Attributes.Add("onmouseout","this.style.backgroundColor=c");
                    e.Row.Attributes.Add("style", "cursor:pointer");
                    #region
                    PostBackOptions myPostBackOptions = new PostBackOptions(this);
                    myPostBackOptions.AutoPostBack = false;
                    myPostBackOptions.PerformValidation = false;
                    myPostBackOptions.RequiresJavaScriptProtocol = true; //加入javascript:头
                    String evt = Page.ClientScript.GetPostBackClientHyperlink(sender as GridView, "Select$" + e.Row.RowIndex.ToString());
                    e.Row.Attributes.Add("onclick", evt);
                    #endregion
                    break;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string id = row.Cells[0].Text.ToString();
            if (id == "商品编号")
                return;
            this.Session["GoodID"] = id;
            Response.Redirect("GoodsView.aspx");
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            string id = row.Cells[0].Text.ToString();
            this.Session["GoodID"] = id;
            FastView.ImageUrl = "~/Image/" + id + ".jpg";
            FastView.Visible = true;
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.DataRow:
                    //放置鼠标变色
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
                    break;
            }
        }

        protected void FastView_Click(object sender, ImageClickEventArgs e)
        {           
            Response.Redirect("GoodsView.aspx");
        }
       
    }
}