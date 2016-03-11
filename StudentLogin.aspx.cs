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



public partial class StudentLogin : System.Web.UI.Page
{
    LoginDAL loginDAL = new LoginDAL();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            //if (Session["Password_Reset"] != null)
            //{
            //    lblMessage.Text = Session["Password_Reset"].ToString();
            //    Session.Remove("Password_Reset");



            //}
        }

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        if (txtStudentId.Text == "")
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Please enter your Student Id";
        }
        else if (txtPassword.Text == "")
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Please enter the password";
        }
            string password = Sha1Sum(txtPassword.Text);

            int checkUser = loginDAL.CheckUserCredentials(txtStudentId.Text, password);
            int loginFlag = loginDAL.GetLoginFlag(txtStudentId.Text);
       
       if (checkUser != 0 && loginFlag < 5)
            {
                DataTable dt = loginDAL.GetUserInformation(txtStudentId.Text);
                if (dt.Rows.Count > 0)
                {
                   int LoginFlagUpdate = loginDAL.UpdateLoginFlagandLoginTime(txtStudentId.Text, 0);

                    Session["S_Id"] = dt.Rows[0][0].ToString();
                    Session["Student_Name"] = dt.Rows[0][1].ToString();
                    Response.Redirect("~/Student/StudentMenu.aspx", false);

                }


            }
            else if (loginFlag < 5 && checkUser == 0)
            {
                int LoginFlagUpdate = loginDAL.UpdateLoginFlag(txtStudentId.Text, (Convert.ToInt16(loginFlag) + 1));
                if (LoginFlagUpdate > 0)
                {
                    lblMessage.Text = "User Name OR Password do not match.";
                }
            }
            else
            {
                lblMessage.Text = "Your Account is Locked!.Please Contact Admin at 'yashwanth@gmail.com'.";

            }
        


    }


    public string Sha1Sum(string strToEncrypt)
    {

        UTF8Encoding ue = new UTF8Encoding();

        byte[] bytes = ue.GetBytes(strToEncrypt);



        // encrypt bytes

        SHA1 sha = new SHA1CryptoServiceProvider();

        byte[] hashBytes = sha.ComputeHash(bytes);



        // Convert the encrypted bytes back to a string (base 16)

        string hashString = "";



        for (int i = 0; i < hashBytes.Length; i++)
        {

            hashString += Convert.ToString(hashBytes[i], 16).PadLeft(2, '0');

        }



        return hashString.PadLeft(32, '0');

    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtPassword.Text = "";
        txtStudentId.Text = "";
        lblMessage.Visible = false;
    }
}
//    SqlConnection MyConn = new SqlConnection();
//    SqlCommand MyComm = new SqlCommand();
//    SqlDataReader dr;
//    protected void Page_Load(object sender, EventArgs e)
//    {
//        try
//        {
//            MyConn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Nair.ACER\Documents\Visual Studio 2013\WebSites\MyConcordia\App_Data\StudentDB.mdf;Integrated Security=True";
//        }
//        catch
//        {
//            LblError.Visible = true;
//            LblError.Text = "Connection fails try again later";
//        }
//    }
//    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
//    {
//        try
//        {

//            string id = "";
//            string pwd = "";
//            MyConn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Nair.ACER\Documents\Visual Studio 2013\WebSites\MyConcordia\App_Data\StudentDB.mdf;Integrated Security=True";
//            MyComm.Connection = MyConn;
//            MyComm.CommandType = CommandType.Text;
//            MyConn.Open();
//            MyComm.CommandText = String.Format("select S_Id, Password from Login where S_Id='" + TxtStudentId.Text + "' and Password = '" + TxtPassword.Text + "'  ", MyConn);
//            dr = MyComm.ExecuteReader();

//            dr.Read();
//             if (dr.HasRows)
//            {
//                id = dr["S_Id"].ToString();
//                pwd = dr["Password"].ToString();

//            }
//            dr.Close();

//            if (id == "" && pwd == "")
//            {
//                LblError.Visible = true;
//                LblError.Text = "Please: enter right Student Id and password";
//                return;
//            }
//            else
//            {
//                LblError.Visible = false;
//                Session["S_Id"] = TxtStudentId.Text;
//            }




//            MyConn.Close();


//            //MyComm.ExecuteNonQuery();


//            Response.Redirect("~/Student/StudentMenu.aspx", false);



//        }
//        catch 
//        {
//            LblError.Visible = true;
//            LblError.Text = "Please Enter right Student Id and password";

//        }
//        finally
//        {
//            MyConn.Close();
//        }
//    }

//    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
//    {
//        clean();
//    }
//void clean()
//    {
//        TxtStudentId.Text = "";
//        TxtPassword.Text = "";
//        LblError.Visible = false;
//    }
//}