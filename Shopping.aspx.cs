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
public partial class Shopping : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = " 网上购物系统";
        if (!IsPostBack)
        {
            if (Session["UserName"] == null)
            {
                Response.Write("<script>alert('您还没有登录，请登录后再使用该功能!');location='javascript:history.go(-1)';</script>");
            }
            else
            {

                SqlDataReader dr = data.GetDataReader("select top 1 * from tb_Order where IsCheckout='否' and  Ordeuser='" + Session["UserName"].ToString() + "' order by id desc  ");
                if (dr.Read())
                {
                    Label5.Text = dr["Orderid"].ToString();
                }
                BinderOrder();
                
                SqlDataReader dr1;
                dr1 = data.GetDataReader("select * from Users where UserName='" + Session["UserName"].ToString() + "'");
                dr1.Read();


                Label6.Text = dr1["JiFen"].ToString();
            }
        }
    }
    protected void lbtnCheck_Click(object sender, EventArgs e)
    {
        if (labMoney.Text == "0")
        {
            Alert.AlertAndRedirect("您的购物车中没有任何物品", "Shopping.aspx");
        }
        else
        {

            if (float.Parse(TextBox2.Text) > float.Parse(Label6.Text))
            {
                Label7.Text = "输入的积分不能大于目前积分！";
                return;
            }
            else
            {
                SqlHelper data = new SqlHelper();
                SqlDataReader dr;
                dr = data.GetDataReader("select * from Users where UserName='" + Session["UserName"].ToString() + "'");
                dr.Read();
                string MPrice = dr["MemberMoney"].ToString();

                Label6.Text = dr["JiFen"].ToString();
                if (Convert.ToDecimal(MPrice) < Convert.ToDecimal(labMoney.Text.Trim()))
                {

                    Alert.AlertAndRedirect("您的余额不足，请重新充值后再购买", "AddMoney.aspx");

                }
                else
                {
                    float jifenjine = float.Parse(TextBox2.Text) / 100;
                    float fukuan = float.Parse(labMoney.Text)- jifenjine;
                    string sqlstrshop1 = "update Users set MemberMoney=MemberMoney-" + fukuan + " where UserName='" + Session["UserName"].ToString() + "'";
                    data.RunSql(sqlstrshop1);

                    data.RunSql("update Users set JiFen=JiFen-" + Convert.ToDecimal(TextBox2.Text) + "  where id='" + Session["UserId"].ToString() + "'");

                    data.RunSql("insert into dbo.JiFen (Userid,UserName,JiFenType,jiFenNum,JiFenName)values('" + Session["UserId"].ToString() + "','" + Session["UserName"].ToString() + "','扣除积分','" + TextBox2.Text + "','购买商品消耗积分')");

                    Response.Redirect("SuccShop.aspx?OrderMember=" + Session["UserName"].ToString());
                }
            }
        }
    }
    protected void lbtnClear_Click(object sender, EventArgs e)
    {
        string sqlstr = "delete from tb_OrderInfo where OrderMember='"
            + Session["UserName"].ToString() + "' and IsCheckout='否'";
        data.RunSql(sqlstr);
        Response.Redirect("Shopping.aspx");
    }
    protected void gvOrderInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvOrderInfo.PageIndex = e.NewPageIndex;
        gvOrderInfo.DataBind();
    }
    protected void gvOrderInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void gvOrderInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string sqlstr = "delete from tb_OrderInfo where id='" + gvOrderInfo.DataKeys[e.RowIndex].Value + "'";
        data.RunSql(sqlstr);
        Response.Redirect("Shopping.aspx");
    }

    public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
    {
    }

    protected void gvOrderInfo_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlHelper mydata = new SqlHelper();
        string ID = gvOrderInfo.DataKeys[e.RowIndex].Values[0].ToString();
        try
        {
            mydata.RunSql("update tb_OrderInfo  set shuliang ='" + ((TextBox)gvOrderInfo.Rows[e.RowIndex].FindControl("TextBox1")).Text + "'  where id=" + ID);




            gvOrderInfo.EditIndex = -1;
            BinderOrder();
        }
        catch
        {

        }
    }
    protected void gvOrderInfo_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvOrderInfo.EditIndex = e.NewEditIndex;
        BinderOrder();
    }
    protected void gvOrderInfo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvOrderInfo.EditIndex = -1;
        BinderOrder();
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
        string sqlstr = "select id,IsYuDing,shuliang,OrderID,ShangPinName,ShangPinTypeName,ShangPinPrice from tb_OrderInfo where OrderMember='" + Convert.ToString(Session["UserName"]) + "' and IsCheckout='否'";
        gvOrderInfo.DataKeyNames = new string[] { "id" };
        gvDataBind(gvOrderInfo, sqlstr);

        SqlHelper data = new SqlHelper();
        SqlDataReader dr1;
        dr1 = data.GetDataReader("select OrderID from tb_OrderInfo where OrderMember='" + Convert.ToString(Session["UserName"]) + "' and IsCheckout='否'");
        if (dr1.Read())
        {

            string sqlstrtprice = "select sum(ShangPinPrice*shuliang) as tprice from tb_OrderInfo"
                + " where OrderMember='" + Convert.ToString(Session["UserName"]) + "' and IsCheckout='否'";

            SqlDataReader dr;
            dr = data.GetDataReader(sqlstrtprice);
            dr.Read();
            labMoney.Text = Convert.ToString( float.Parse(dr["tprice"].ToString()));


        }
        else
        {
            labMoney.Text = "0";

        }
    }
}
