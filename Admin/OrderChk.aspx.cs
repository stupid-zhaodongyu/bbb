using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
public partial class AdminManger_OrderChk : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    public string OrderStite;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["Orderid"].ToString();
 


            SqlHelper data = new SqlHelper();
            SqlDataReader dr;
            string sql = "select * from tb_Order where Orderid='" + id + "'";
            dr = data.GetDataReader(sql);
            dr.Read();
            OrderStite = dr["OrderStite"].ToString();
            TextBox1.Text = dr["WuLiu"].ToString();

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["Orderid"].ToString();

    


        SqlHelper data = new SqlHelper();
        SqlDataReader dr;
        string sql = "select * from tb_Order where Orderid='" + id + "'";
        dr = data.GetDataReader(sql);
        dr.Read();
        OrderStite = dr["OrderStite"].ToString();
        TextBox1.Text = dr["WuLiu"].ToString();
        if (OrderStite == "已经发货")
        {
            Alert.AlertAndRedirect("该订单已经发货", "OrderManger.aspx");

        }
        else
        {
            string sql1 = "select * from dbo.tb_OrderInfo where OrderID='" + id + "'";
            SqlDataReader drKuCun = data.GetDataReader(sql1);
            while (drKuCun.Read())
            {
                data.RunSql("update  ShangPinInfo set ShangPinNum=ShangPinNum-" + drKuCun["shuliang"].ToString() + ",ZongXiaoLiang=ZongXiaoLiang+" + drKuCun["shuliang"].ToString() + "  where ShangPinID='" + drKuCun["ShangPinID"].ToString() + "'");
 
            }
            data.RunSql("update tb_Order set OrderStite='已经发货',WuLiu='"+TextBox1.Text+"' where Orderid='" + id + "'");
            Alert.AlertAndRedirect("操作成功", "OrderManger.aspx");

        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["Orderid"].ToString();
        data.RunSql("update tb_Order set  WuLiu='" + TextBox1.Text + "' where Orderid='" + id + "'");
        Alert.AlertAndRedirect("操作成功", "OrderManger.aspx");
    }
}
