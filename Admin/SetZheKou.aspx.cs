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
public partial class Admin_SetZheKou : System.Web.UI.Page
{

    public string sql, dID;

    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        dID = Request.QueryString["id"].ToString().Trim();
        if (!IsPostBack)
        {

            sql = "select * from Users where id=" + dID;
            getdata(sql);
        }
    }
    private void getdata(string sql)
    {
        SqlDataReader dr = data.GetDataReader(sql);
        if (dr.Read())
        {
            title.Text = dr["ZheKou"].ToString();
           
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        sql = "update Users set ZheKou='" + title.Text.ToString().Trim() + "'  where id=" + dID;
        data.RunSql(sql);
        Alert.AlertAndRedirect("设置成功", "UserZKList.aspx");
    }
}
