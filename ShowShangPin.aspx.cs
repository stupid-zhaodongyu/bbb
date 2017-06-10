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
using System.IO;
using System.Data.SqlClient;

public partial class ShowShangPin : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = " 网上购物系统";
        if (!IsPostBack)
        {
            BinderReplay();
            data.RunSql("update ShangPinInfo set ShangPinClick=ShangPinClick+1 where ShangPinID=" + Request.QueryString["id"].ToString());
            string sql = "select * from ShangPinInfo where ShangPinID=" + Request.QueryString["id"].ToString();
            getdata(sql);

         
        }
    }
    private void getdata(string sql)
    {
        SqlDataReader dr = data.GetDataReader(sql);
        if (dr.Read())
        {
        
            Label2.Text = dr["ShangPinName"].ToString();
            Label4.Text = dr["ShangPinPrice"].ToString();
            Label5.Text = dr["ShangPinNum"].ToString();
            DIV1.InnerHtml = dr["ShangPinIntroduce"].ToString();
            Label6.Text = dr["ShangPinClick"].ToString();
            iGPhoto.ImageUrl = "files/" + dr["ShangPinPhoto"].ToString();
            Label3.Text = dr["ShangPinTypeName"].ToString();
            Hidden1.Value = dr["ShangPinTypeID"].ToString();

            Label1.Text = dr["ShangPinKuanshi"].ToString();
            Label7.Text = dr["ShangPinJiFen"].ToString();
            Hidden2.Value = dr["ShangPinJiFen"].ToString();
            
        }
    }
    protected void btnShop_Click(object sender, EventArgs e)
    {

        if (float.Parse(Label5.Text) < float.Parse(TextBox1.Text))
        {
            Alert.AlertAndRedirect("对不起您购买的商品不能大于库存数量", "ShowShangPin.aspx?id=" + Request.QueryString["id"].ToString());

        }
        else
        {
            string Orderid;
            if (Session["UserName"] == null)
            {
                Alert.AlertAndRedirect("您还没有登录，请登录后再购买，谢谢合作！", "Default.aspx");

            }
            else
            {
                SqlDataReader dr = data.GetDataReader("select top 1 * from tb_Order where IsCheckout='否' and  Ordeuser='" + Session["UserName"].ToString() + "' order by id desc  ");
                if (dr.Read())
                {
                    Orderid = dr["Orderid"].ToString();
                }
                else
                {

                    Orderid = DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString();
                    string sqlOrder = "insert into tb_Order(Orderid,Ordeuser,OrderStite)values('" + Orderid + "','" + Session["UserName"].ToString() + "','未发货')";
                    data.RunSql(sqlOrder);
                }
                sqlconn.Open();
                string strid = Page.Request.QueryString["id"].ToString();

                SqlDataReader drDD = data.GetDataReader("select * from  tb_OrderInfo where  ShangPinID='" + strid + "' and  IsCheckout='否' and OrderMember='" + Session["UserName"].ToString() + "'  and OrderID='" + Orderid + "'  ");

                if (drDD.Read())
                {
                    data.RunSql("update  tb_OrderInfo set shuliang=shuliang+" + TextBox1.Text + "   where  ShangPinID='" + strid + "' and  IsCheckout='否' and OrderMember='" + Session["UserName"].ToString() + "'  and OrderID='" + Orderid + "'   ");
                    Response.Redirect("Shopping.aspx");
                }
                else
                {
                    string sqlstr = "insert into tb_OrderInfo"
                        + "(OrderID,OrderMember,ShangPinID,ShangPinName,ShangPinTypeID,ShangPinTypeName,ShangPinPrice,IsCheckout,shuliang,ShangPinJiFen)"
                        + " values('" + Orderid + "','" + Session["UserName"].ToString() + "','" + Request.QueryString["id"].ToString() + "','"
                        + Label2.Text + "','" + Hidden1.Value + "','" + Label3.Text
                        + "','" + Label4.Text + "','否','" + TextBox1.Text + "','" + Label7.Text+ "')";
                    data.RunSql(sqlstr);
                    Response.Redirect("Shopping.aspx");
                }
            }
        }
    }
    private void BinderReplay()
    {
        int id = int.Parse(Request.QueryString["id"].ToString());
        string sql = "select * from  Comment where ShangPinID=" + id;
        SqlConnection con = new SqlConnection(SqlHelper.connstring);
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(sql, con);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        PagedDataSource objPds = new PagedDataSource();
        objPds.DataSource = ds.Tables[0].DefaultView;

        objPds.AllowPaging = true;
        objPds.PageSize = 5;

        int CurPage;
        if (Request.QueryString["Page"] != null)
            CurPage = Convert.ToInt32(Request.QueryString["Page"]);
        else
            CurPage = 1;

        objPds.CurrentPageIndex = CurPage - 1;
        lblCurrentPage.Text = CurPage.ToString();
        lblSumPage.Text = objPds.PageCount.ToString();

        if (!objPds.IsFirstPage)
        {
            this.hyfirst.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + 1 + "&id=" + id;
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage - 1) + "&id=" + id;
        }

        if (!objPds.IsLastPage)
        {
            hylastpage.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + objPds.PageCount + "&id=" + id;

            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage + 1) + "&id=" + id;
        }

        this.DataList2.DataSource = objPds;
        this.DataList2.DataBind();
        con.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Alert.AlertAndRedirect("对不起您还没有登录", "Default.aspx");
        }
        else
        {
            SqlDataReader dr = data.GetDataReader("select * from ShangPinInfo where ShangPinID=" + Request.QueryString["id"].ToString());
            dr.Read();
           string  ShangPinName = dr["ShangPinName"].ToString();
            string id = Page.Request.QueryString["id"];

            SqlDataReader dr1 = data.GetDataReader("select * from   ShouCang where UserId='" + Session["UserId"].ToString() + "' and  ShangPinID='" + id + "'");

            if (dr1.Read())
            {
                Alert.AlertAndRedirect("不能重复收藏！", "ShowShangPin.aspx?id=" + id);
            }
            else
            {
                data.RunSql("insert into ShouCang(UserId,ShangPinID,ShangPinName)values('" + Session["UserId"].ToString() + "','" + id + "','" + ShangPinName + "')");
                Alert.AlertAndRedirect("收藏成功！", "MyShouCang.aspx");
            }
        }
    }
}
