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
    public partial class MyGoods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("default.aspx");
            username.Text = Session["username"].ToString();
            Logo.ImageUrl = "/nya.jpg";
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0)
                Label1.Visible = false;
            GridView2.DataBind();
            if (GridView2.Rows.Count == 0)
                Label2.Visible = false;
            GridView3.DataBind();
            if (GridView3.Rows.Count == 0)
                Label3.Visible = false;
            if (GridView1.Rows.Count == 0 && GridView2.Rows.Count == 0 && GridView3.Rows.Count == 0)
            {
                nogood.Text = "没有物品";
                nogood.Visible = true;
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

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            string id = row.Cells[0].Text.ToString();
            this.Session["GoodID"] = id;
            Response.Redirect("GoodsView.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string id = row.Cells[0].Text.ToString();
            this.Session["GoodID"] = id;
            Response.Redirect("GoodsView.aspx");
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView3.SelectedRow;
            string id = row.Cells[0].Text.ToString();
            this.Session["GoodID"] = id;
            Response.Redirect("GoodsView.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.DataRow:
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

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.DataRow:
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

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.DataRow:
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyOrder.aspx");
        }

    }
}