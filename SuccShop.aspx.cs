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

public partial class SuccShop : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = " 网上购物系统";
        if (!IsPostBack)
        {
            BinderMenber();
            BinderOrder();

        }
    }
    public void gvDataBind(GridView gv, string sqlstr)
    {
        sqlconn.Open();
        SqlDataAdapter myda = new SqlDataAdapter(sqlstr, sqlconn);
        DataSet myds = new DataSet();
        myda.Fill(myds);
        gv.DataSource = myds;
        gv.DataBind();
        sqlconn.Close();
    }
    private void BinderOrder()
    {
        string sqlstr = "select IsYuDing,shuliang,OrderID,ShangPinName,ShangPinTypeName,ShangPinPrice from tb_OrderInfo where OrderMember='" + Convert.ToString(Session["UserName"]) + "' and IsCheckout='否'";
        gvOrderInfo.DataKeyNames = new string[] { "OrderID" };
        gvDataBind(gvOrderInfo, sqlstr);

        SqlHelper data = new SqlHelper();
        SqlDataReader dr1;
        dr1 = data.GetDataReader("select OrderID from tb_OrderInfo where OrderMember='" + Convert.ToString(Session["UserName"]) + "' and IsCheckout='否'");
        if (dr1.Read())
        {

            string sqlstrtprice = "select sum(ShangPinPrice*shuliang) as tprice, sum(ShangPinJiFen*shuliang) as zongjifen from tb_OrderInfo"
                + " where OrderMember='" + Convert.ToString(Session["UserName"]) + "' and IsCheckout='否'";

            SqlDataReader dr;
            dr = data.GetDataReader(sqlstrtprice);
            dr.Read();
            labMoney.Text = Convert.ToString(float.Parse(dr["tprice"].ToString()));

            Label6.Text = Convert.ToString(float.Parse(dr["zongjifen"].ToString()));
        }
        else
        {
            labMoney.Text = "0";

        }
    }

    private void BinderMenber()
    {

        SqlDataReader dr = data.GetDataReader("select * from Users where UserName='" + Request.QueryString["OrderMember"].ToString() + "'");
        dr.Read();
        Label2.Text = dr["XingMing"].ToString();
        Label3.Text = dr["Address"].ToString();
        Label4.Text = dr["Tel"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlstrshop2 = "update tb_OrderInfo set IsCheckout='是' ,QinShi='" + TextBox2.Text + "'  where OrderMember='" + Session["UserName"].ToString() + "'";
        data.RunSql(sqlstrshop2);
        string sqlstrshop1 = "update tb_Order set IsCheckout='是'  where Ordeuser='" + Session["UserName"].ToString() + "'";
        data.RunSql(sqlstrshop1);
       

        data.RunSql("update  Users set JiFen=JiFen+" + Label6.Text + " where id='" + Session["UserId"].ToString()+ "'");
        data.RunSql("insert into  JiFen(Userid,UserName,JiFenType,jiFenNum,JiFenName)values('" + Session["UserId"].ToString() + "','" + Session["UserName"].ToString() + "','增加积分','" + Label6.Text + "','购买商品获取积分')");

        Alert.AlertAndRedirect("操作成功！", "MyOrder.aspx");
    }
}

