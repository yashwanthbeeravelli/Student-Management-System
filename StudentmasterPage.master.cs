using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Text;
using System.Transactions;


public partial class StudentmasterPage : System.Web.UI.MasterPage
{
    SqlConnection MyConn = new SqlConnection();
    SqlCommand MyComm = new SqlCommand();
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        //int S_Id=int.Parse(Session["S_Id"].ToString());
        //string name="";
        //MyConn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Nair.ACER\Documents\Visual Studio 2013\WebSites\MyConcordia\App_Data\StudentDB.mdf;Integrated Security=True";
        //MyComm.Connection = MyConn;
        //MyComm.CommandType = CommandType.Text;
        //MyConn.Open();
        //MyComm.CommandText = String.Format("Select Name from Registration where S_Id='"+S_Id+"' ", MyConn);
        //dr = MyComm.ExecuteReader();
       
        //dr.Read();
        //if (dr.HasRows)
        //{
        //    name = dr["Name"].ToString();
        //}
        //dr.Close();

        //lblUserName.Text = "Welcome  "+name+" ";
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        Session.Abandon();
        Session.Remove("S_Id");
     
        Response.Redirect("~/StudentLogin.aspx");
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {

        Session.Abandon();
        Session.Remove("S_Id");
        Response.Redirect("~/StudentLogin.aspx");


    }
}
