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

public partial class Register : System.Web.UI.Page
{

    SqlConnection MyConn = new SqlConnection();
    SqlCommand MyComm = new SqlCommand();
    SqlDataReader dr;
    int S_Id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            MyConn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Nair.ACER\Documents\Visual Studio 2013\WebSites\MyConcordia\App_Data\StudentDB.mdf;Integrated Security=True";
        }
        catch
        {
            LblError.Visible = true;
            LblError.Text = "Connection fails try again later";
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (DrpDwncntry.SelectedItem.Text == "Select Country...")
            {
                LblError.Visible = true;
                LblError.ForeColor = System.Drawing.Color.Red;
                LblError.Text = "Select Country is an invalid option in Select Country";
            }
            else if (DropDownList1.SelectedItem.Text == "Select Code")
            {
                LblError.Visible = true;
                LblError.ForeColor = System.Drawing.Color.Red;
                LblError.Text = "Select Code is an invalid option in Select Code";
            }
            else if(ddlStatus.SelectedItem.Text=="Select Status")
            {
                LblError.Visible = true;
                LblError.ForeColor = System.Drawing.Color.Red;
                LblError.Text = "Select Status is an invalid option in Select Code";
            }
            else if (TxtName.Text != "" && TxtPwd.Text != "" && TxtEmail.Text != "" && TxtQ1.Text != "" && TxtA1.Text != "" && TxtAptNum.Text != "" && TxtPrvnc.Text != "" && TxtPostCod.Text != "" && TxtMobNum.Text != "" && TxtDOB.Text != "")
            {
                checks();
            }
            else
            {
                LblError.Visible = true;
                LblError.Text = "Please Fill Complete Form";
                LblMsg.Visible = false;
            }

        }
        catch
        { }
    }

    public void checks()
    {
        try
        {

            string Email = "";
            string mobnum = "";

            MyConn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Nair.ACER\Documents\Visual Studio 2013\WebSites\MyConcordia\App_Data\StudentDB.mdf;Integrated Security=True";
            MyComm.Connection = MyConn;
            MyComm.CommandType = CommandType.Text;
            MyConn.Open();
            MyComm.CommandText = String.Format("select Email, [Mobile Number] from Registration where Email='" + TxtEmail.Text + "'  ", MyConn);
            dr = MyComm.ExecuteReader();

            dr.Read();
            if (dr.HasRows)
            {
                Email = dr["Email"].ToString();
                mobnum = dr["Mobile Number"].ToString();
            }
            dr.Close();

            if (Email == TxtEmail.Text || mobnum == TxtMobNum.Text)
            {
                LblError.Visible = true;
                LblError.Text = "Record Already Exists";
                LblMsg.Visible = false;
                return;
            }
            else
            {
                LblError.Visible = false;
                inserts();
            }
            MyConn.Close();
        }

        catch
        {
            LblError.Visible = true;
            LblError.Text = "Please: enter correct information";

        }
        finally
        {
            MyConn.Close();
        }
    }

    void inserts()
    {

        try
        {
            MyConn.Close();
            MyConn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Nair.ACER\Documents\Visual Studio 2013\WebSites\MyConcordia\App_Data\StudentDB.mdf;Integrated Security=True";
            MyComm.Connection = MyConn;
            MyComm.CommandType = CommandType.Text;

            Random rnd = new Random();
            S_Id = rnd.Next(0000001, 9999999);
            MyConn.Open();
            string s = "insert into Registration values ('"+S_Id+"','"+TxtName.Text+"','"+TxtEmail.Text+"','"+TxtQ1.Text+"','"+TxtA1.Text+"','"+TxtMobNum.Text+"','"+TxtAptNum.Text+"','"+TxtStreetnum.Text+"','"+TxtPrvnc.Text+"','"+DrpDwncntry.SelectedValue+"','"+TxtPostCod.Text+"','"+DropDownList1.SelectedValue+"', '"+ddlDept.SelectedItem.Text+"', '"+ddlStatus.SelectedItem.Text+"', '"+TxtDOB.Text+"')";
            
            MyComm = new SqlCommand(s, MyConn);
            MyComm.ExecuteNonQuery();

            MyConn.Close();   
            insertlogin();
            

        }

        catch (Exception ex)
        {
            LblError.Visible = true;
            LblError.Text = ex.Message;
        }
        finally
        {
            MyComm.Dispose();
            MyConn.Close();
        }
    }
    
    public void insertlogin()
    {
        try
        {

            MyConn.Close();

            MyConn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Nair.ACER\Documents\Visual Studio 2013\WebSites\MyConcordia\App_Data\StudentDB.mdf;Integrated Security=True";
            MyComm.Connection = MyConn;
            MyComm.CommandType = CommandType.Text;
            string password = Sha1Sum(TxtPwd.Text);
            string s = "insert into Login values ( '" + S_Id + "','" + password + "',"+0+")";

            MyComm = new SqlCommand(s, MyConn);

            MyConn.Open();
            MyComm.ExecuteNonQuery();
            MyConn.Close();

            Response.Write("Successfully Registered. Please note down your ID to Login. ");

            LblMsg.Visible = true;
            LblMsg.Text = "Successfully Registered. Please note down your ID to Login. Your name is "+TxtName.Text + "Your Id is : " + S_Id;
            insertFees(); //Inserting the fees into table tbl_Dues 
            LblError.Visible = false;
        }
        catch (Exception ex)
        {

            LblError.Visible = true;
            LblError.Text = ex.Message;
        }
        finally
        {
            MyComm.Dispose();
            MyConn.Close();
        }


    }
    void clean()
    {
        
        TxtName.Text = "";
        TxtPwd.Text = "";
        TxtEmail.Text = "";
        TxtQ1.Text = "";
        TxtA1.Text = "";
        LblMsg.Text = "";
        TxtAptNum.Text = "";
        TxtStreetnum.Text = "";
        TxtPrvnc.Text = "";
        DrpDwncntry.SelectedIndex = -1;
        TxtPostCod.Text = "";
        TxtMobNum.Text = "";
        DropDownList1.SelectedIndex = -1;
        LblError.Text = "";

    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void TxtMobNum_TextChanged(object sender, EventArgs e)
    {

    }
    protected void ImgBtnReset_Click(object sender, ImageClickEventArgs e)
    {
        clean();
    }
    void insertFees()
    {
        string z = "Dummy";
        MyConn.Close();
        MyConn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Nair.ACER\Documents\Visual Studio 2013\WebSites\MyConcordia\App_Data\StudentDB.mdf;Integrated Security=True";
        MyComm.Connection = MyConn;
        MyComm.CommandType = CommandType.Text;
        MyConn.Open();
        string s = "insert into tbl_Transaction_Fees values (Student_Id, Fees_Paid, Date_When_Paid, Name)  ('" +S_Id+ "','"+0F+"', '"+DateTime.Now.ToShortDateString()+"', '"+z+"') ";
        MyComm = new SqlCommand(s, MyConn);
        MyComm.ExecuteNonQuery();
        MyConn.Close();
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
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        redirect();
    }
void redirect()
{
    Response.Redirect("~/StudentLogin.aspx");
}
protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
{
    if (Calndr.Visible)
        Calndr.Visible = false;
    else
        Calndr.Visible = true;
}
protected void Calndr_SelectionChanged(object sender, EventArgs e)
{
    TxtDOB.Text = Calndr.SelectedDate.ToString("d");
    Calndr.Visible = false;
}
}