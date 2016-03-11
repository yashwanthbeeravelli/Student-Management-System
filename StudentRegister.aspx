<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StudentRegister.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br/>
    <table class="nav-justified" id="Registration">
     <tr> 
        <td colspan="2" style="font-family: 'Arial Rounded MT Bold'; background-color: #FFFFFF; color: #008000; font-size: larger; font-weight: bolder;">Student Registration</td>
    </tr>
    <tr>
        <td style="width: 290px">&nbsp;</td>
        <td style="margin-left: 40px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" />
        </td>
    </tr>
    <tr>
        <td style="width: 290px">&nbsp;</td>
        <td><asp:Label ID="LblError" runat="server" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label> &nbsp; 
                <asp:Label ID="LblMsg" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Blue" Text="Label" Visible="False"></asp:Label>
            &nbsp;
       </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 37px;">Name</td>
        <td style="height: 37px">
            <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>&nbsp;
            <asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="TxtName" 
       ValidationExpression="^[a-zA-Z'.\s]{1,50}"
       Text="Name should contain only Alphabets" Forecolor="Red"/> 
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 42px;">Password</td>
        <td style="height: 42px">
            <asp:TextBox ID="TxtPwd" runat="server" TextMode="Password"></asp:TextBox>
             <asp:RegularExpressionValidator ID="RegExpPwd" runat="server" ControlToValidate="TxtPwd"
        ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,10}"
        ErrorMessage="Password must contain: Minimum 8 and Maximum 10 characters atleast 1 UpperCase Alphabet, 1 LowerCase Alphabet, 1 Number and 1 Special Character"
        ForeColor="Red" />
    <br />
   
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 49px;">Email</td>
        <td style="height: 49px">
            <asp:TextBox ID="TxtEmail" runat="server" TextMode="Email"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TxtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 49px;">Select Status</td>
        <td style="height: 49px">
            <asp:DropDownList ID="ddlStatus" runat="server">
                <asp:ListItem>Select Status</asp:ListItem>
                <asp:ListItem>Full Time</asp:ListItem>
                <asp:ListItem>Part Time</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 49px;">Select Department</td>
        <td style="height: 49px">
            <asp:DropDownList ID="ddlDept" runat="server" DataSourceID="SqlDataSource1" DataTextField="Department" DataValueField="Department">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Department] FROM [DepartmentList]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 49px;">Select Date of Birth</td>
        <td style="height: 49px">
            <asp:TextBox ID="TxtDOB" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ImageUrl="~/Images/Calender.jpg" OnClick="ImageButton2_Click" />
            <asp:Calendar ID="Calndr" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calndr_SelectionChanged" Width="220px" Visible="False">
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <WeekendDayStyle BackColor="#CCCCFF" />
            </asp:Calendar>
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 47px;">Security Q1</td>
        <td style="height: 47px">
            <asp:TextBox ID="TxtQ1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 39px;">Security Answer 1</td>
        <td style="height: 39px">
            <asp:TextBox ID="TxtA1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 37px;">Address</td>
        <td style="height: 37px">
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 44px;">H.No / Apartment No / Unit No</td>
        <td style="height: 44px">
                <asp:TextBox ID="TxtAptNum" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 43px;">Street Name / Number</td>
        <td style="height: 43px">
                <asp:TextBox ID="TxtStreetnum" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 33px;">Province / State</td>
        <td style="height: 33px">
                <asp:TextBox ID="TxtPrvnc" runat="server" ToolTip="State or Province"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 36px;">Country</td>
        <td style="height: 36px">
                <asp:DropDownList ID="DrpDwncntry" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
<asp:ListItem Value="">Select Country...</asp:ListItem>
<asp:ListItem Value="Afganistan">Afghanistan</asp:ListItem>
<asp:ListItem Value="Albania">Albania</asp:ListItem>
<asp:ListItem Value="Algeria">Algeria</asp:ListItem>
<asp:ListItem Value="American Samoa">American Samoa</asp:ListItem>
<asp:ListItem Value="Andorra">Andorra</asp:ListItem>
<asp:ListItem Value="Angola">Angola</asp:ListItem>
<asp:ListItem Value="Anguilla">Anguilla</asp:ListItem>
<asp:ListItem Value="Antigua &amp; Barbuda">Antigua &amp; Barbuda</asp:ListItem>
<asp:ListItem Value="Argentina">Argentina</asp:ListItem>
<asp:ListItem Value="Armenia">Armenia</asp:ListItem>
<asp:ListItem Value="Aruba">Aruba</asp:ListItem>
<asp:ListItem Value="Australia">Australia</asp:ListItem>
<asp:ListItem Value="Austria">Austria</asp:ListItem>
<asp:ListItem Value="Azerbaijan">Azerbaijan</asp:ListItem>
<asp:ListItem Value="Bahamas">Bahamas</asp:ListItem>
<asp:ListItem Value="Bahrain">Bahrain</asp:ListItem>
<asp:ListItem Value="Bangladesh">Bangladesh</asp:ListItem>
<asp:ListItem Value="Barbados">Barbados</asp:ListItem>
<asp:ListItem Value="Belarus">Belarus</asp:ListItem>
<asp:ListItem Value="Belgium">Belgium</asp:ListItem>
<asp:ListItem Value="Belize">Belize</asp:ListItem>
<asp:ListItem Value="Benin">Benin</asp:ListItem>
<asp:ListItem Value="Bermuda">Bermuda</asp:ListItem>
<asp:ListItem Value="Bhutan">Bhutan</asp:ListItem>
<asp:ListItem Value="Bolivia">Bolivia</asp:ListItem>
<asp:ListItem Value="Bonaire">Bonaire</asp:ListItem>
<asp:ListItem Value="Bosnia &amp; Herzegovina">Bosnia &amp; Herzegovina</asp:ListItem>
<asp:ListItem Value="Botswana">Botswana</asp:ListItem>
<asp:ListItem Value="Brazil">Brazil</asp:ListItem>
<asp:ListItem Value="British Indian Ocean Ter">British Indian Ocean Ter</asp:ListItem>
<asp:ListItem Value="Brunei">Brunei</asp:ListItem>
<asp:ListItem Value="Bulgaria">Bulgaria</asp:ListItem>
<asp:ListItem Value="Burkina Faso">Burkina Faso</asp:ListItem>
<asp:ListItem Value="Burundi">Burundi</asp:ListItem>
<asp:ListItem Value="Cambodia">Cambodia</asp:ListItem>
<asp:ListItem Value="Cameroon">Cameroon</asp:ListItem>
<asp:ListItem Value="Canada">Canada</asp:ListItem>
<asp:ListItem Value="Canary Islands">Canary Islands</asp:ListItem>
<asp:ListItem Value="Cape Verde">Cape Verde</asp:ListItem>
<asp:ListItem Value="Cayman Islands">Cayman Islands</asp:ListItem>
<asp:ListItem Value="Central African Republic">Central African Republic</asp:ListItem>
<asp:ListItem Value="Chad">Chad</asp:ListItem>
<asp:ListItem Value="Channel Islands">Channel Islands</asp:ListItem>
<asp:ListItem Value="Chile">Chile</asp:ListItem>
<asp:ListItem Value="China">China</asp:ListItem>
<asp:ListItem Value="Christmas Island">Christmas Island</asp:ListItem>
<asp:ListItem Value="Cocos Island">Cocos Island</asp:ListItem>
<asp:ListItem Value="Colombia">Colombia</asp:ListItem>
<asp:ListItem Value="Comoros">Comoros</asp:ListItem>
<asp:ListItem Value="Congo">Congo</asp:ListItem>
<asp:ListItem Value="Cook Islands">Cook Islands</asp:ListItem>
<asp:ListItem Value="Costa Rica">Costa Rica</asp:ListItem>
<asp:ListItem Value="Cote DIvoire">Cote D'Ivoire</asp:ListItem>
<asp:ListItem Value="Croatia">Croatia</asp:ListItem>
<asp:ListItem Value="Cuba">Cuba</asp:ListItem>
<asp:ListItem Value="Curaco">Curacao</asp:ListItem>
<asp:ListItem Value="Cyprus">Cyprus</asp:ListItem>
<asp:ListItem Value="Czech Republic">Czech Republic</asp:ListItem>
<asp:ListItem Value="Denmark">Denmark</asp:ListItem>
<asp:ListItem Value="Djibouti">Djibouti</asp:ListItem>
<asp:ListItem Value="Dominica">Dominica</asp:ListItem>
<asp:ListItem Value="Dominican Republic">Dominican Republic</asp:ListItem>
<asp:ListItem Value="East Timor">East Timor</asp:ListItem>
<asp:ListItem Value="Ecuador">Ecuador</asp:ListItem>
<asp:ListItem Value="Egypt">Egypt</asp:ListItem>
<asp:ListItem Value="El Salvador">El Salvador</asp:ListItem>
<asp:ListItem Value="Equatorial Guinea">Equatorial Guinea</asp:ListItem>
<asp:ListItem Value="Eritrea">Eritrea</asp:ListItem>
<asp:ListItem Value="Estonia">Estonia</asp:ListItem>
<asp:ListItem Value="Ethiopia">Ethiopia</asp:ListItem>
<asp:ListItem Value="Falkland Islands">Falkland Islands</asp:ListItem>
<asp:ListItem Value="Faroe Islands">Faroe Islands</asp:ListItem>
<asp:ListItem Value="Fiji">Fiji</asp:ListItem>
<asp:ListItem Value="Finland">Finland</asp:ListItem>
<asp:ListItem Value="France">France</asp:ListItem>
<asp:ListItem Value="French Guiana">French Guiana</asp:ListItem>
<asp:ListItem Value="French Polynesia">French Polynesia</asp:ListItem>
<asp:ListItem Value="French Southern Ter">French Southern Ter</asp:ListItem>
<asp:ListItem Value="Gabon">Gabon</asp:ListItem>
<asp:ListItem Value="Gambia">Gambia</asp:ListItem>
<asp:ListItem Value="Georgia">Georgia</asp:ListItem>
<asp:ListItem Value="Germany">Germany</asp:ListItem>
<asp:ListItem Value="Ghana">Ghana</asp:ListItem>
<asp:ListItem Value="Gibraltar">Gibraltar</asp:ListItem>
<asp:ListItem Value="Great Britain">Great Britain</asp:ListItem>
<asp:ListItem Value="Greece">Greece</asp:ListItem>
<asp:ListItem Value="Greenland">Greenland</asp:ListItem>
<asp:ListItem Value="Grenada">Grenada</asp:ListItem>
<asp:ListItem Value="Guadeloupe">Guadeloupe</asp:ListItem>
<asp:ListItem Value="Guam">Guam</asp:ListItem>
<asp:ListItem Value="Guatemala">Guatemala</asp:ListItem>
<asp:ListItem Value="Guinea">Guinea</asp:ListItem>
<asp:ListItem Value="Guyana">Guyana</asp:ListItem>
<asp:ListItem Value="Haiti">Haiti</asp:ListItem>
<asp:ListItem Value="Hawaii">Hawaii</asp:ListItem>
<asp:ListItem Value="Honduras">Honduras</asp:ListItem>
<asp:ListItem Value="Hong Kong">Hong Kong</asp:ListItem>
<asp:ListItem Value="Hungary">Hungary</asp:ListItem>
<asp:ListItem Value="Iceland">Iceland</asp:ListItem>
<asp:ListItem Value="India">India</asp:ListItem>
<asp:ListItem Value="Indonesia">Indonesia</asp:ListItem>
<asp:ListItem Value="Iran">Iran</asp:ListItem>
<asp:ListItem Value="Iraq">Iraq</asp:ListItem>
<asp:ListItem Value="Ireland">Ireland</asp:ListItem>
<asp:ListItem Value="Isle of Man">Isle of Man</asp:ListItem>
<asp:ListItem Value="Israel">Israel</asp:ListItem>
<asp:ListItem Value="Italy">Italy</asp:ListItem>
<asp:ListItem Value="Jamaica">Jamaica</asp:ListItem>
<asp:ListItem Value="Japan">Japan</asp:ListItem>
<asp:ListItem Value="Jordan">Jordan</asp:ListItem>
<asp:ListItem Value="Kazakhstan">Kazakhstan</asp:ListItem>
<asp:ListItem Value="Kenya">Kenya</asp:ListItem>
<asp:ListItem Value="Kiribati">Kiribati</asp:ListItem>
<asp:ListItem Value="Korea North">Korea North</asp:ListItem>
<asp:ListItem Value="Korea Sout">Korea South</asp:ListItem>
<asp:ListItem Value="Kuwait">Kuwait</asp:ListItem>
<asp:ListItem Value="Kyrgyzstan">Kyrgyzstan</asp:ListItem>
<asp:ListItem Value="Laos">Laos</asp:ListItem>
<asp:ListItem Value="Latvia">Latvia</asp:ListItem>
<asp:ListItem Value="Lebanon">Lebanon</asp:ListItem>
<asp:ListItem Value="Lesotho">Lesotho</asp:ListItem>
<asp:ListItem Value="Liberia">Liberia</asp:ListItem>
<asp:ListItem Value="Libya">Libya</asp:ListItem>
<asp:ListItem Value="Liechtenstein">Liechtenstein</asp:ListItem>
<asp:ListItem Value="Lithuania">Lithuania</asp:ListItem>
<asp:ListItem Value="Luxembourg">Luxembourg</asp:ListItem>
<asp:ListItem Value="Macau">Macau</asp:ListItem>
<asp:ListItem Value="Macedonia">Macedonia</asp:ListItem>
<asp:ListItem Value="Madagascar">Madagascar</asp:ListItem>
<asp:ListItem Value="Malaysia">Malaysia</asp:ListItem>
<asp:ListItem Value="Malawi">Malawi</asp:ListItem>
<asp:ListItem Value="Maldives">Maldives</asp:ListItem>
<asp:ListItem Value="Mali">Mali</asp:ListItem>
<asp:ListItem Value="Malta">Malta</asp:ListItem>
<asp:ListItem Value="Marshall Islands">Marshall Islands</asp:ListItem>
<asp:ListItem Value="Martinique">Martinique</asp:ListItem>
<asp:ListItem Value="Mauritania">Mauritania</asp:ListItem>
<asp:ListItem Value="Mauritius">Mauritius</asp:ListItem>
<asp:ListItem Value="Mayotte">Mayotte</asp:ListItem>
<asp:ListItem Value="Mexico">Mexico</asp:ListItem>
<asp:ListItem Value="Midway Islands">Midway Islands</asp:ListItem>
<asp:ListItem Value="Moldova">Moldova</asp:ListItem>
<asp:ListItem Value="Monaco">Monaco</asp:ListItem>
<asp:ListItem Value="Mongolia">Mongolia</asp:ListItem>
<asp:ListItem Value="Montserrat">Montserrat</asp:ListItem>
<asp:ListItem Value="Morocco">Morocco</asp:ListItem>
<asp:ListItem Value="Mozambique">Mozambique</asp:ListItem>
<asp:ListItem Value="Myanmar">Myanmar</asp:ListItem>
<asp:ListItem Value="Nambia">Nambia</asp:ListItem>
<asp:ListItem Value="Nauru">Nauru</asp:ListItem>
<asp:ListItem Value="Nepal">Nepal</asp:ListItem>
<asp:ListItem Value="Netherland Antilles">Netherland Antilles</asp:ListItem>
<asp:ListItem Value="Netherlands">Netherlands (Holland, Europe)</asp:ListItem>
<asp:ListItem Value="Nevis">Nevis</asp:ListItem>
<asp:ListItem Value="New Caledonia">New Caledonia</asp:ListItem>
<asp:ListItem Value="New Zealand">New Zealand</asp:ListItem>
<asp:ListItem Value="Nicaragua">Nicaragua</asp:ListItem>
<asp:ListItem Value="Niger">Niger</asp:ListItem>
<asp:ListItem Value="Nigeria">Nigeria</asp:ListItem>
<asp:ListItem Value="Niue">Niue</asp:ListItem>
<asp:ListItem Value="Norfolk Island">Norfolk Island</asp:ListItem>
<asp:ListItem Value="Norway">Norway</asp:ListItem>
<asp:ListItem Value="Oman">Oman</asp:ListItem>
<asp:ListItem Value="Pakistan">Pakistan</asp:ListItem>
<asp:ListItem Value="Palau Island">Palau Island</asp:ListItem>
<asp:ListItem Value="Palestine">Palestine</asp:ListItem>
<asp:ListItem Value="Panama">Panama</asp:ListItem>
<asp:ListItem Value="Papua New Guinea">Papua New Guinea</asp:ListItem>
<asp:ListItem Value="Paraguay">Paraguay</asp:ListItem>
<asp:ListItem Value="Peru">Peru</asp:ListItem>
<asp:ListItem Value="Phillipines">Philippines</asp:ListItem>
<asp:ListItem Value="Pitcairn Island">Pitcairn Island</asp:ListItem>
<asp:ListItem Value="Poland">Poland</asp:ListItem>
<asp:ListItem Value="Portugal">Portugal</asp:ListItem>
<asp:ListItem Value="Puerto Rico">Puerto Rico</asp:ListItem>
<asp:ListItem Value="Qatar">Qatar</asp:ListItem>
<asp:ListItem Value="Republic of Montenegro">Republic of Montenegro</asp:ListItem>
<asp:ListItem Value="Republic of Serbia">Republic of Serbia</asp:ListItem>
<asp:ListItem Value="Reunion">Reunion</asp:ListItem>
<asp:ListItem Value="Romania">Romania</asp:ListItem>
<asp:ListItem Value="Russia">Russia</asp:ListItem>
<asp:ListItem Value="Rwanda">Rwanda</asp:ListItem>
<asp:ListItem Value="St Barthelemy">St Barthelemy</asp:ListItem>
<asp:ListItem Value="St Eustatius">St Eustatius</asp:ListItem>
<asp:ListItem Value="St Helena">St Helena</asp:ListItem>
<asp:ListItem Value="St Kitts-Nevis">St Kitts-Nevis</asp:ListItem>
<asp:ListItem Value="St Lucia">St Lucia</asp:ListItem>
<asp:ListItem Value="St Maarten">St Maarten</asp:ListItem>
<asp:ListItem Value="St Pierre &amp; Miquelon">St Pierre &amp; Miquelon</asp:ListItem>
<asp:ListItem Value="St Vincent &amp; Grenadines">St Vincent &amp; Grenadines</asp:ListItem>
<asp:ListItem Value="Saipan">Saipan</asp:ListItem>
<asp:ListItem Value="Samoa">Samoa</asp:ListItem>
<asp:ListItem Value="Samoa American">Samoa American</asp:ListItem>
<asp:ListItem Value="San Marino">San Marino</asp:ListItem>
<asp:ListItem Value="Sao Tome &amp; Principe">Sao Tome &amp; Principe</asp:ListItem>
<asp:ListItem Value="Saudi Arabia">Saudi Arabia</asp:ListItem>
<asp:ListItem Value="Senegal">Senegal</asp:ListItem>
<asp:ListItem Value="Serbia">Serbia</asp:ListItem>
<asp:ListItem Value="Seychelles">Seychelles</asp:ListItem>
<asp:ListItem Value="Sierra Leone">Sierra Leone</asp:ListItem>
<asp:ListItem Value="Singapore">Singapore</asp:ListItem>
<asp:ListItem Value="Slovakia">Slovakia</asp:ListItem>
<asp:ListItem Value="Slovenia">Slovenia</asp:ListItem>
<asp:ListItem Value="Solomon Islands">Solomon Islands</asp:ListItem>
<asp:ListItem Value="Somalia">Somalia</asp:ListItem>
<asp:ListItem Value="South Africa">South Africa</asp:ListItem>
<asp:ListItem Value="Spain">Spain</asp:ListItem>
<asp:ListItem Value="Sri Lanka">Sri Lanka</asp:ListItem>
<asp:ListItem Value="Sudan">Sudan</asp:ListItem>
<asp:ListItem Value="Suriname">Suriname</asp:ListItem>
<asp:ListItem Value="Swaziland">Swaziland</asp:ListItem>
<asp:ListItem Value="Sweden">Sweden</asp:ListItem>
<asp:ListItem Value="Switzerland">Switzerland</asp:ListItem>
<asp:ListItem Value="Syria">Syria</asp:ListItem>
<asp:ListItem Value="Tahiti">Tahiti</asp:ListItem>
<asp:ListItem Value="Taiwan">Taiwan</asp:ListItem>
<asp:ListItem Value="Tajikistan">Tajikistan</asp:ListItem>
<asp:ListItem Value="Tanzania">Tanzania</asp:ListItem>
<asp:ListItem Value="Thailand">Thailand</asp:ListItem>
<asp:ListItem Value="Togo">Togo</asp:ListItem>
<asp:ListItem Value="Tokelau">Tokelau</asp:ListItem>
<asp:ListItem Value="Tonga">Tonga</asp:ListItem>
<asp:ListItem Value="Trinidad &amp; Tobago">Trinidad &amp; Tobago</asp:ListItem>
<asp:ListItem Value="Tunisia">Tunisia</asp:ListItem>
<asp:ListItem Value="Turkey">Turkey</asp:ListItem>
<asp:ListItem Value="Turkmenistan">Turkmenistan</asp:ListItem>
<asp:ListItem Value="Turks &amp; Caicos Is">Turks &amp; Caicos Is</asp:ListItem>
<asp:ListItem Value="Tuvalu">Tuvalu</asp:ListItem>
<asp:ListItem Value="Uganda">Uganda</asp:ListItem>
<asp:ListItem Value="Ukraine">Ukraine</asp:ListItem>
<asp:ListItem Value="United Arab Erimates">United Arab Emirates</asp:ListItem>
<asp:ListItem Value="United Kingdom">United Kingdom</asp:ListItem>
<asp:ListItem Value="United States of America">United States of America</asp:ListItem>
<asp:ListItem Value="Uraguay">Uruguay</asp:ListItem>
<asp:ListItem Value="Uzbekistan">Uzbekistan</asp:ListItem>
<asp:ListItem Value="Vanuatu">Vanuatu</asp:ListItem>
<asp:ListItem Value="Vatican City State">Vatican City State</asp:ListItem>
<asp:ListItem Value="Venezuela">Venezuela</asp:ListItem>
<asp:ListItem Value="Vietnam">Vietnam</asp:ListItem>
<asp:ListItem Value="Virgin Islands (Brit)">Virgin Islands (Brit)</asp:ListItem>
<asp:ListItem Value="Virgin Islands (USA)">Virgin Islands (USA)</asp:ListItem>
<asp:ListItem Value="Wake Island">Wake Island</asp:ListItem>
<asp:ListItem Value="Wallis &amp; Futana Is">Wallis &amp; Futana Is</asp:ListItem>
<asp:ListItem Value="Yemen">Yemen</asp:ListItem>
<asp:ListItem Value="Zaire">Zaire</asp:ListItem>
<asp:ListItem Value="Zambia">Zambia</asp:ListItem>
<asp:ListItem Value="Zimbabwe">Zimbabwe</asp:ListItem>
</asp:DropDownList>

          
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 38px;">Postal Code</td>
        <td style="height: 38px">
                <asp:TextBox ID="TxtPostCod" runat="server" MaxLength="7" ToolTip="Postal Code"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 290px; height: 39px;">Mobile Number</td>
        <td style="height: 39px">
                <asp:TextBox ID="TxtMobNum" runat="server" MaxLength="10" ToolTip="Mobile number" OnTextChanged="TxtMobNum_TextChanged"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
      ControlToValidate="TxtMobNum" ErrorMessage="The Mobile Number should be 10 digits like 1234567890" 
    ValidationExpression="[0-9]{10}" Font-Bold="True" ForeColor="#FF6600"></asp:RegularExpressionValidator>
        &nbsp; &nbsp; 
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>Select Code</asp:ListItem>
       <asp:ListItem value="1">USA (+1)</asp:ListItem>
		<asp:ListItem value="213">Algeria (+213)</asp:ListItem>
		<asp:ListItem value="376">Andorra (+376)</asp:ListItem>
		<asp:ListItem value="244">Angola (+244)</asp:ListItem>
		<asp:ListItem  value="1264">Anguilla (+1264)</asp:ListItem>
		<asp:ListItem  value="1268">Antigua &amp; Barbuda (+1268)</asp:ListItem>
		<asp:ListItem  value="54">Argentina (+54)</asp:ListItem>
		<asp:ListItem  value="374">Armenia (+374)</asp:ListItem>
		<asp:ListItem  value="297">Aruba (+297)</asp:ListItem>
		<asp:ListItem  value="61">Australia (+61)</asp:ListItem>
		<asp:ListItem  value="43">Austria (+43)</asp:ListItem>
		<asp:ListItem  value="994">Azerbaijan (+994)</asp:ListItem>
		<asp:ListItem  value="1242">Bahamas (+1242)</asp:ListItem>
		<asp:ListItem  value="973">Bahrain (+973)</asp:ListItem>
		<asp:ListItem  value="880">Bangladesh (+880)</asp:ListItem>
		<asp:ListItem  value="1246">Barbados (+1246)</asp:ListItem>
		<asp:ListItem  value="375">Belarus (+375)</asp:ListItem>
		<asp:ListItem  value="32">Belgium (+32)</asp:ListItem>
		<asp:ListItem  value="501">Belize (+501)</asp:ListItem>
		<asp:ListItem  value="229">Benin (+229)</asp:ListItem>
		<asp:ListItem  value="1441">Bermuda (+1441)</asp:ListItem>
		<asp:ListItem  value="975">Bhutan (+975)</asp:ListItem>
		<asp:ListItem  value="591">Bolivia (+591)</asp:ListItem>
		<asp:ListItem  value="387">Bosnia Herzegovina (+387)</asp:ListItem>
		<asp:ListItem  value="267">Botswana (+267)</asp:ListItem>
		<asp:ListItem  value="55">Brazil (+55)</asp:ListItem>
		<asp:ListItem  value="673">Brunei (+673)</asp:ListItem>
		<asp:ListItem  value="359">Bulgaria (+359)</asp:ListItem>
		<asp:ListItem  value="226">Burkina Faso (+226)</asp:ListItem>
		<asp:ListItem  value="257">Burundi (+257)</asp:ListItem>
		<asp:ListItem  value="855">Cambodia (+855)</asp:ListItem>
		<asp:ListItem  value="237">Cameroon (+237)</asp:ListItem>
		<asp:ListItem  value="1">Canada (+1)</asp:ListItem>
		<asp:ListItem  value="238">Cape Verde Islands (+238)</asp:ListItem>
		<asp:ListItem  value="1345">Cayman Islands (+1345)</asp:ListItem>
		<asp:ListItem  value="236">Central African Republic (+236)</asp:ListItem>
		<asp:ListItem  value="56">Chile (+56)</asp:ListItem>
		<asp:ListItem  value="86">China (+86)</asp:ListItem>
		<asp:ListItem  value="57">Colombia (+57)</asp:ListItem>
		<asp:ListItem  value="269">Comoros (+269)</asp:ListItem>
		<asp:ListItem  value="242">Congo (+242)</asp:ListItem>
		<asp:ListItem  value="682">Cook Islands (+682)</asp:ListItem>
		<asp:ListItem  value="506">Costa Rica (+506)</asp:ListItem>
		<asp:ListItem  value="385">Croatia (+385)</asp:ListItem>
		<asp:ListItem  value="53">Cuba (+53)</asp:ListItem>
		<asp:ListItem  value="90392">Cyprus North (+90392)</asp:ListItem>
		<asp:ListItem  value="357">Cyprus South (+357)</asp:ListItem>
		<asp:ListItem  value="42">Czech Republic (+42)</asp:ListItem>
		<asp:ListItem  value="45">Denmark (+45)</asp:ListItem>
		<asp:ListItem  value="253">Djibouti (+253)</asp:ListItem>
		<asp:ListItem  value="1809">Dominica (+1809)</asp:ListItem>
		<asp:ListItem  value="1809">Dominican Republic (+1809)</asp:ListItem>
		<asp:ListItem  value="593">Ecuador (+593)</asp:ListItem>
		<asp:ListItem  value="20">Egypt (+20)</asp:ListItem>
		<asp:ListItem  value="503">El Salvador (+503)</asp:ListItem>
		<asp:ListItem  value="240">Equatorial Guinea (+240)</asp:ListItem>
		<asp:ListItem  value="291">Eritrea (+291)</asp:ListItem>
		<asp:ListItem  value="372">Estonia (+372)</asp:ListItem>
		<asp:ListItem  value="251">Ethiopia (+251)</asp:ListItem>
		<asp:ListItem  value="500">Falkland Islands (+500)</asp:ListItem>
		<asp:ListItem  value="298">Faroe Islands (+298)</asp:ListItem>
		<asp:ListItem  value="679">Fiji (+679)</asp:ListItem>
		<asp:ListItem  value="358">Finland (+358)</asp:ListItem>
		<asp:ListItem  value="33">France (+33)</asp:ListItem>
		<asp:ListItem  value="594">French Guiana (+594)</asp:ListItem>
		<asp:ListItem  value="689">French Polynesia (+689)</asp:ListItem>
		<asp:ListItem  value="241">Gabon (+241)</asp:ListItem>
		<asp:ListItem  value="220">Gambia (+220)</asp:ListItem>
		<asp:ListItem  value="7880">Georgia (+7880)</asp:ListItem>
		<asp:ListItem  value="49">Germany (+49)</asp:ListItem>
		<asp:ListItem  value="233">Ghana (+233)</asp:ListItem>
		<asp:ListItem  value="350">Gibraltar (+350)</asp:ListItem>
		<asp:ListItem  value="30">Greece (+30)</asp:ListItem>
		<asp:ListItem  value="299">Greenland (+299)</asp:ListItem>
		<asp:ListItem  value="1473">Grenada (+1473)</asp:ListItem>
		<asp:ListItem  value="590">Guadeloupe (+590)</asp:ListItem>
		<asp:ListItem  value="671">Guam (+671)</asp:ListItem>
		<asp:ListItem  value="502">Guatemala (+502)</asp:ListItem>
		<asp:ListItem  value="224">Guinea (+224)</asp:ListItem>
		<asp:ListItem  value="245">Guinea - Bissau (+245)</asp:ListItem>
		<asp:ListItem  value="592">Guyana (+592)</asp:ListItem>
		<asp:ListItem  value="509">Haiti (+509)</asp:ListItem>
		<asp:ListItem  value="504">Honduras (+504)</asp:ListItem>
		<asp:ListItem  value="852">Hong Kong (+852)</asp:ListItem>
		<asp:ListItem  value="36">Hungary (+36)</asp:ListItem>
		<asp:ListItem  value="354">Iceland (+354)</asp:ListItem>
		<asp:ListItem  value="91">India (+91)</asp:ListItem>
		<asp:ListItem  value="62">Indonesia (+62)</asp:ListItem>
		<asp:ListItem  value="98">Iran (+98)</asp:ListItem>
		<asp:ListItem  value="964">Iraq (+964)</asp:ListItem>
		<asp:ListItem  value="353">Ireland (+353)</asp:ListItem>
		<asp:ListItem  value="972">Israel (+972)</asp:ListItem>
		<asp:ListItem  value="39">Italy (+39)</asp:ListItem>
		<asp:ListItem  value="1876">Jamaica (+1876)</asp:ListItem>
		<asp:ListItem  value="81">Japan (+81)</asp:ListItem>
		<asp:ListItem  value="962">Jordan (+962)</asp:ListItem>
		<asp:ListItem  value="7">Kazakhstan (+7)</asp:ListItem>
		<asp:ListItem  value="254">Kenya (+254)</asp:ListItem>
		<asp:ListItem  value="686">Kiribati (+686)</asp:ListItem>
		<asp:ListItem  value="850">Korea North (+850)</asp:ListItem>
		<asp:ListItem  value="82">Korea South (+82)</asp:ListItem>
		<asp:ListItem  value="965">Kuwait (+965)</asp:ListItem>
		<asp:ListItem  value="996">Kyrgyzstan (+996)</asp:ListItem>
		<asp:ListItem  value="856">Laos (+856)</asp:ListItem>
		<asp:ListItem  value="371">Latvia (+371)</asp:ListItem>
		<asp:ListItem  value="961">Lebanon (+961)</asp:ListItem>
		<asp:ListItem  value="266">Lesotho (+266)</asp:ListItem>
		<asp:ListItem  value="231">Liberia (+231)</asp:ListItem>
		<asp:ListItem  value="218">Libya (+218)</asp:ListItem>
		<asp:ListItem  value="417">Liechtenstein (+417)</asp:ListItem>
		<asp:ListItem  value="370">Lithuania (+370)</asp:ListItem>
		<asp:ListItem  value="352">Luxembourg (+352)</asp:ListItem>
		<asp:ListItem  value="853">Macao (+853)</asp:ListItem>
		<asp:ListItem  value="389">Macedonia (+389)</asp:ListItem>
		<asp:ListItem  value="261">Madagascar (+261)</asp:ListItem>
		<asp:ListItem  value="265">Malawi (+265)</asp:ListItem>
		<asp:ListItem  value="60">Malaysia (+60)</asp:ListItem>
		<asp:ListItem  value="960">Maldives (+960)</asp:ListItem>
		<asp:ListItem  value="223">Mali (+223)</asp:ListItem>
		<asp:ListItem  value="356">Malta (+356)</asp:ListItem>
		<asp:ListItem  value="692">Marshall Islands (+692)</asp:ListItem>
		<asp:ListItem  value="596">Martinique (+596)</asp:ListItem>
		<asp:ListItem  value="222">Mauritania (+222)</asp:ListItem>
		<asp:ListItem  value="269">Mayotte (+269)</asp:ListItem>
		<asp:ListItem  value="52">Mexico (+52)</asp:ListItem>
		<asp:ListItem  value="691">Micronesia (+691)</asp:ListItem>
		<asp:ListItem  value="373">Moldova (+373)</asp:ListItem>
		<asp:ListItem  value="377">Monaco (+377)</asp:ListItem>
		<asp:ListItem  value="976">Mongolia (+976)</asp:ListItem>
		<asp:ListItem  value="1664">Montserrat (+1664)</asp:ListItem>
		<asp:ListItem  value="212">Morocco (+212)</asp:ListItem>
		<asp:ListItem  value="258">Mozambique (+258)</asp:ListItem>
		<asp:ListItem  value="95">Myanmar (+95)</asp:ListItem>
		<asp:ListItem  value="264">Namibia (+264)</asp:ListItem>
		<asp:ListItem  value="674">Nauru (+674)</asp:ListItem>
		<asp:ListItem  value="977">Nepal (+977)</asp:ListItem>
		<asp:ListItem  value="31">Netherlands (+31)</asp:ListItem>
		<asp:ListItem  value="687">New Caledonia (+687)</asp:ListItem>
		<asp:ListItem  value="64">New Zealand (+64)</asp:ListItem>
		<asp:ListItem  value="505">Nicaragua (+505)</asp:ListItem>
		<asp:ListItem  value="227">Niger (+227)</asp:ListItem>
		<asp:ListItem  value="234">Nigeria (+234)</asp:ListItem>
		<asp:ListItem  value="683">Niue (+683)</asp:ListItem>
		<asp:ListItem  value="672">Norfolk Islands (+672)</asp:ListItem>
		<asp:ListItem  value="670">Northern Marianas (+670)</asp:ListItem>
		<asp:ListItem  value="47">Norway (+47)</asp:ListItem>
		<asp:ListItem  value="968">Oman (+968)</asp:ListItem>
		<asp:ListItem  value="680">Palau (+680)</asp:ListItem>
		<asp:ListItem  value="507">Panama (+507)</asp:ListItem>
		<asp:ListItem  value="675">Papua New Guinea (+675)</asp:ListItem>
		<asp:ListItem  value="595">Paraguay (+595)</asp:ListItem>
		<asp:ListItem  value="51">Peru (+51)</asp:ListItem>
		<asp:ListItem  value="63">Philippines (+63)</asp:ListItem>
		<asp:ListItem  value="48">Poland (+48)</asp:ListItem>
		<asp:ListItem  value="351">Portugal (+351)</asp:ListItem>
		<asp:ListItem  value="1787">Puerto Rico (+1787)</asp:ListItem>
		<asp:ListItem  value="974">Qatar (+974)</asp:ListItem>
		<asp:ListItem  value="262">Reunion (+262)</asp:ListItem>
		<asp:ListItem  value="40">Romania (+40)</asp:ListItem>
		<asp:ListItem  value="7">Russia (+7)</asp:ListItem>
		<asp:ListItem  value="250">Rwanda (+250)</asp:ListItem>
		<asp:ListItem  value="378">San Marino (+378)</asp:ListItem>
		<asp:ListItem  value="239">Sao Tome &amp; Principe (+239)</asp:ListItem>
		<asp:ListItem  value="966">Saudi Arabia (+966)</asp:ListItem>
		<asp:ListItem  value="221">Senegal (+221)</asp:ListItem>
		<asp:ListItem  value="381">Serbia (+381)</asp:ListItem>
		<asp:ListItem  value="248">Seychelles (+248)</asp:ListItem>
		<asp:ListItem  value="232">Sierra Leone (+232)</asp:ListItem>
		<asp:ListItem  value="65">Singapore (+65)</asp:ListItem>
		<asp:ListItem  value="421">Slovak Republic (+421)</asp:ListItem>
		<asp:ListItem  value="386">Slovenia (+386)</asp:ListItem>
		<asp:ListItem  value="677">Solomon Islands (+677)</asp:ListItem>
		<asp:ListItem  value="252">Somalia (+252)</asp:ListItem>
		<asp:ListItem  value="27">South Africa (+27)</asp:ListItem>
		<asp:ListItem  value="34">Spain (+34)</asp:ListItem>
		<asp:ListItem  value="94">Sri Lanka (+94)</asp:ListItem>
		<asp:ListItem  value="290">St. Helena (+290)</asp:ListItem>
		<asp:ListItem  value="1869">St. Kitts (+1869)</asp:ListItem>
		<asp:ListItem  value="1758">St. Lucia (+1758)</asp:ListItem>
		<asp:ListItem  value="249">Sudan (+249)</asp:ListItem>
		<asp:ListItem  value="597">Suriname (+597)</asp:ListItem>
		<asp:ListItem  value="268">Swaziland (+268)</asp:ListItem>
		<asp:ListItem  value="46">Sweden (+46)</asp:ListItem>
		<asp:ListItem  value="41">Switzerland (+41)</asp:ListItem>
		<asp:ListItem  value="963">Syria (+963)</asp:ListItem>
		<asp:ListItem  value="886">Taiwan (+886)</asp:ListItem>
		<asp:ListItem  value="7">Tajikstan (+7)</asp:ListItem>
		<asp:ListItem  value="66">Thailand (+66)</asp:ListItem>
		<asp:ListItem  value="228">Togo (+228)</asp:ListItem>
		<asp:ListItem  value="676">Tonga (+676)</asp:ListItem>
		<asp:ListItem  value="1868">Trinidad &amp; Tobago (+1868)</asp:ListItem>
		<asp:ListItem  value="216">Tunisia (+216)</asp:ListItem>
		<asp:ListItem  value="90">Turkey (+90)</asp:ListItem>
		<asp:ListItem  value="7">Turkmenistan (+7)</asp:ListItem>
		<asp:ListItem  value="993">Turkmenistan (+993)</asp:ListItem>
		<asp:ListItem  value="1649">Turks &amp; Caicos Islands (+1649)</asp:ListItem>
		<asp:ListItem  value="688">Tuvalu (+688)</asp:ListItem>
		<asp:ListItem  value="256">Uganda (+256)</asp:ListItem>
		<asp:ListItem  value="380">Ukraine (+380)</asp:ListItem>
		<asp:ListItem  value="971">United Arab Emirates (+971)</asp:ListItem>
		<asp:ListItem  value="598">Uruguay (+598)</asp:ListItem>
		<asp:ListItem  value="7">Uzbekistan (+7)</asp:ListItem>
		<asp:ListItem  value="678">Vanuatu (+678)</asp:ListItem>
		<asp:ListItem  value="379">Vatican City (+379)</asp:ListItem>
		<asp:ListItem  value="58">Venezuela (+58)</asp:ListItem>
		<asp:ListItem  value="84">Vietnam (+84)</asp:ListItem>
		<asp:ListItem  value="84">Virgin Islands - British (+1284)</asp:ListItem>
		<asp:ListItem  value="84">Virgin Islands - US (+1340)</asp:ListItem>
		<asp:ListItem  value="681">Wallis &amp; Futuna (+681)</asp:ListItem>
		<asp:ListItem  value="969">Yemen (North)(+969)</asp:ListItem>
		<asp:ListItem  value="967">Yemen (South)(+967)</asp:ListItem>
		<asp:ListItem  value="260">Zambia (+260)</asp:ListItem>
		<asp:ListItem  value="263">Zimbabwe (+263)</asp:ListItem>


                </asp:DropDownList>
                        </td>
    </tr>
    <tr>
        <td style="width: 290px">&nbsp;</td>
        <td>
                &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 290px">&nbsp;</td>
        <td>
                
                <asp:ImageButton ID="ImageButton1" runat="server" Height="33px" ImageUrl="~/Images/Submit.png" OnClick="ImageButton1_Click" Width="100px" />
            &nbsp;&nbsp; &nbsp; &nbsp;    
            <asp:ImageButton ID="ImgBtnReset" runat="server" Height="33px" ImageUrl="~/Images/Reset Button.png" OnClick="ImgBtnReset_Click" />
                
        </td>
    </tr>
    <tr>
        <td style="width: 290px">&nbsp;</td>
        <td>
             
                </td>
    </tr>
</table>
</asp:Content>

