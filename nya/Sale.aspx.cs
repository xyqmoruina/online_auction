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
    public partial class Sale : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("default.aspx");
            string username = Session["username"].ToString();
            urname.Text = username ;
            Logo.ImageUrl = "/nya.jpg";
        }

        protected int checkPrice()
        {
            string tex = BottomPriceBox.Text;
            for (int i = 0; i < tex.Length; i++)
            {
                if (tex[i] > '9' || tex[i] < '0')
                {
                    return 1;
                }
            }
            return 0;
        }

        protected void StartSale_Click(object sender, EventArgs e)
        {
            int lea = 1;
            string goodname = GoodNameBox.Text;
            string goodvari = GoodVarietyList.Text;
            string goodprice = BottomPriceBox.Text;
            string time = TimeList.Text;
            string description = DescriptionBox.Text;
            string username = Session["username"].ToString();
            if (goodname.Length == 0)
            {
                IsLe.Text = "请输入商品名称";
                lea = 0;
            }
            else if (goodprice.Length == 0)
            {
                IsLe.Text = "请输入商品底价";
                lea = 0;
            }
            else if(checkPrice() == 1){
                IsLe.Text = "请输入正确的底价";
                lea = 0;
            }
            else if (description.Length == 0)
            {
                IsLe.Text = "请输入商品描述";
                lea = 0;
            }
            else if (GoodImage.ImageUrl == "")
            {
                ImageMsg.Text = "无图无**，你懂得。";
                lea = 0;
            }
            if (lea == 1)
            {
                string TempSql = "select count(*) from goods";
                string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(ConStr);
                SqlCommand cmd = new SqlCommand(TempSql, con);
                string id = "0";
                using (con)
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                        id = dr[0].ToString();
                    dr.Close();
                    con.Close();
                }
                DateTime curntime = DateTime.Now;
                DateTime NNN = curntime.AddDays(double.Parse(TimeList.Text));//TimeList代表拍卖时间
                //curntime = DateTime.Parse(NNN);
                string NyaTime = curntime.ToString();
                //Label1.Text = NyaTime;
                string InsertSql = "insert into goods values(" + id + ",'" + username + "','"
                    + goodvari + "','" + description + "','" + goodprice + "','" + goodprice + "'"
                    + ",'" + goodname + "'," + "1" + ",'" + NNN.ToString() + "','" + NyaTime + "',null, null)";//更改state为待发货
                string ConStr2 = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con2 = new SqlConnection(ConStr2);
                SqlCommand InsertCommand = new SqlCommand(InsertSql, con2);
                int suc;
                using (con2)
                {
                    con2.Open();
                    suc = int.Parse(InsertCommand.ExecuteNonQuery().ToString());
                    con2.Close();
                }
                Label1.Text = suc.ToString();
                this.Session["GoodID"] = id;
                Response.Redirect("GoodsView.aspx");
            }
        }

        protected void UpLoad_Click(object sender, EventArgs e)
        {
            string savepath = @"~/Image/";
            string filetype = string.Empty;
            if (!Directory.Exists(savepath))
            {
                Directory.CreateDirectory(savepath);
            }
            if (ImageUp.HasFile)
            {
                string TempSql = "select count(*) from goods";
                string ConStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(ConStr);
                SqlCommand cmd = new SqlCommand(TempSql, con);
                string id = "0";
                using (con)
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read()) 
                        id = dr[0].ToString();
                    dr.Close();
                    con.Close();
                }

                string filename = ImageUp.FileName;
                filetype = Path.GetExtension(filename).ToLower();
                if (filetype == ".jpg")
                {
                    savepath += id;
                    savepath += ".jpg"; 
                    ImageUp.SaveAs(savepath);
                    GoodImage.ImageUrl = @"~/Image/" + id + ".jpg";
                }
                else
                {
                    ImageMsg.Text = "只允许上传.jpg类型的图片。";
                }

            }
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

        protected void BottomPriceBox_TextChanged(object sender, EventArgs e)
        {

        }
    }
}