


<script type="text/javascript" src="/Common/Javascript/jquery-latest.js"></script>

    
	
<!--link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" -->	
<link rel="stylesheet" type="text/css" href="/Common/CSS/bootstrap-4.4.1-dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="/jqwidgets/jqwidgets/jqwidgets/styles/jqx.base.css" type="text/css" />

    
    <script type="text/javascript" src="/jqwidgets/jqwidgets/scripts/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqwidgets3.8.2/jqwidgets/jqxcore.js"></script>
	<script type="text/javascript" src="/jqwidgets/jqwidgets/jqwidgets/jqxwindow.js"></script>
	<script type="text/javascript" src="/jqwidgets/jqwidgets/jqwidgets/jqxbuttons.js"></script>
	<script type="text/javascript" src="/jqwidgets/jqwidgets/jqwidgets/jqxdropdownlist.js"></script>
	<script type="text/javascript" src="/jqwidgets/jqwidgets/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqwidgets/jqwidgets/jqxsplitter.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqwidgets/jqwidgets/jqxlistbox.js"></script>
	<script type="text/javascript" src="/jqwidgets/jqwidgets3.8.2/jqwidgets/jqxinput.js"></script>
	<script type="text/javascript" src="/jqwidgets/jqwidgets/jqwidgets/jqxdata.js"></script>
	<script type="text/javascript" src="/jqwidgets/jqwidgets/scripts/gettheme.js"></script>

	<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
    
	<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
	<!-- Javascript -->
	<script>
	$(function() {
            
            $( "#EmployerName" ).autocomplete({
               source: function (request, response) {
                $.getJSON("source.asp?term=" + request.term, function (data) {
                    
                    var newObj =[]
                    for ( var i =0; i < data.length; i++) {
                        newObj.push({
                            label: data[i].EmployerName,
                            value: data[i].EmployerName
                        })
                    }

                response(newObj);
                    });
                },
                minLength: 2,
                delay: 100
                        });
         });


		   function newWindow() {
                $('#jqwindow').jqxWindow({
					showCollapseButton: false, 
					showCloseButton: false, 
					height: 600, 
					width: 1000, 
					position: { x: 100, y: 100 },
					theme: 'energyblue',
					isModal: true,
					okButton: $("#ok")
                });
            };
  	</script>
<%
'Grab the referring url
Referer = Request.ServerVariables("HTTP_REFERER")

'If the referrer is vicidial, or ccs server then allow to proceed
IF INSTR(Referer, "/agc2/vicidial.php") > 0 OR INSTR(Referer, "vicidial.intellicell.local") > 0 OR INSTR(Referer, "goautodial.intellicell.local") > 0  OR INSTR(Referer, "192.168.1.92") > 0  OR INSTR(Referer, "192.168.1.91") > 0THEN
	ValidEntry = "Yes"
	NewSale = "Yes"
	ELSEIF INSTR(Referer, "192.168.1.99") > 0 OR INSTR(Referer, "ccs.intellicell.local") > 0 THEN
	ValidEntry = "Yes"
	NewSale = "Yes"
END IF

ValidEntry = "Yes"
NewSale = "Yes"

IF ValidEntry = "Yes" AND NewSale = "Yes" THEN 'NEW application
	Header = "No"
	SessionControl = "No"
	%>
	<!--#include virtual="/common/Header2.asp"-->

	<script>
	

	var basicDemo = (function () {
            //Adding event listeners
            function _addEventListeners() {
                $('#resizeCheckBox').bind('change', function (event) {
                    if (event.args.checked) {
                        $('#window').jqxWindow('resizable', true);
                    } else {
                        $('#window').jqxWindow('resizable', false);
                    }
                });
                $('#dragCheckBox').bind('change', function (event) {
                    if (event.args.checked) {
                        $('#window').jqxWindow('draggable', true);
                    } else {
                        $('#window').jqxWindow('draggable', false);
                    }
                });
                $('#showWindowButton').click(function () {
                    $('#window').jqxWindow('open');
                });
                $('#hideWindowButton').click(function () {
                    $('#window').jqxWindow('close');
                });
            };

            //Creating all page elements which are jqxWidgets
            function _createElements() {
				
                //$('#hideWindowButton').jqxButton({ theme: basicDemo.config.theme, width: '65px' });
                //$('#resizeCheckBox').jqxCheckBox({ theme: basicDemo.config.theme, width: '185px', checked: true });
                //$('#dragCheckBox').jqxCheckBox({ theme: basicDemo.config.theme, width: '185px', checked: true });
                //$('#restrictParentCheckBox').jqxCheckBox({ theme: basicDemo.config.theme, width: '185px', checked: true });
            };

            //Creating the demo window
            function _createWindow() {
                $('#jqwindow').jqxWindow({
					autoOpen: false, 
                    showCollapseButton: false, 
					showCloseButton: false, 
					isModal: true, 
					resizable: false,
					modalOpacity: 0.3,
					maxHeight: 1000, 
					maxWidth: 1200, 
					minHeight: 200, 
					minWidth: 200, 
					height: 600, 
					width: 1000, 
					position: { x: 100, y: 100 },
					okButton: $('#ok'),
					theme: basicDemo.config.theme,
                    initContent: function () {
                        $('#tab').jqxTabs({ height: '100%', width:  '100%', theme: basicDemo.config.theme });
                    }
                });
            };

            return {
                config: {
                    dragArea: null,
                    theme: null
                },
                init: function () {
                    //Creating all jqxWindgets except the window
                    //_createElements();
                    //Attaching event listeners
                    //_addEventListeners();
                    //Adding jqxWindow
					//_createWindow();
					
                }
            };
        } ());

        $(document).ready(function () {
            var theme = 'energyblue';

            //Setting demo's theme
           // basicDemo.config.theme = theme;
            //Initializing the demo
		   // basicDemo.init();
		   $('#jqwindow').hide();
        });
	
	
	
	</script>

	<!--#include virtual="/Common/Database.asp"-->
	
	<%
	user = REQUEST("user")
	vendor_lead_code = REQUEST("vlc")
	source_id = REQUEST("si")
	list_id = REQUEST("li")
	called_since_last_reset = REQUEST("called_since_last_reset")
	phone_code = REQUEST("pc")
	phone_number = REQUEST("pn")
	title = REQUEST("t")
	first_name = REQUEST("fn")
	middle_initial = REQUEST("mi")
	last_name = REQUEST("ln")
	address1 = REQUEST("a1")
	address2 = REQUEST("a2")
	address3 = REQUEST("a3")
	city = REQUEST("c")
	state = REQUEST("s")
	province = REQUEST("p")
	postal_code = REQUEST("plc")
	country_code = REQUEST("cc")
	gender = REQUEST("g")
	date_of_birth = REQUEST("dob")
	alt_phone = REQUEST("ap")
	email = REQUEST("e")
	security_phrase = REQUEST("sp")
	IDNo = REQUEST("sp")
	lead_id = REQUEST("ldi")
	campaign = REQUEST("cam")
	phone_login = REQUEST("pl")
	group = REQUEST("group")
	channel_group = REQUEST("channel_group")
	uniqueid = REQUEST("ui")
	customer_zap_channel = REQUEST("customer_zap_channel")
	server_ip = REQUEST("server_ip")
	SIPexten = REQUEST("se")
	session_id = REQUEST("sesi")
	dialed_number = REQUEST("dn")
	dialed_label = REQUEST("dialed_label")
	rank = REQUEST("rank")
	owner = REQUEST("owner")
	camp_script = REQUEST("camp_script")
	in_script = REQUEST("in_script")
	script_width = REQUEST("script_width")
	script_height = REQUEST("script_height")
	recording_filename = REQUEST("rf")
	recording_id = REQUEST("ri")
	
	'IF len(security_phrase) = 13 THEN
	'	PossibleIDNo = security_phrase
	'END IF
	
	IF gender = "M" THEN
		gender = "Male"
		ELSEIF gender = "F" THEN
		gender = "Female"
		ELSE	
		gender = ""
	END IF
	
	AccessPage = "NewApplications"
	AppType = "New"
	
	MyConn.Open ConnectionString
	
	'*****************************************
	'Get Sales Agent ID info
	'*****************************************
	IF user & "x" = "x" THEN
		response.write "ERROR: Sales agent could not be detected!"
		response.end
		ELSE
		
		SET RS = MyConn.Execute("SELECT UserID, (FirstName + ' ' + LastName) AS SalesAgentName, Username FROM Users WHERE UPPER(VicidialLogin) = '" & UCASE(user) & "'")
		IF RS.EOF = false THEN
			UserID = RS("UserID")
			SalesAgentName = RS("SalesAgentName")
			Username = RS("Username")
			ELSE
			UserID = "0"
			SalesAgentName = "<font color=red>Unknown</font>"
		END IF
		RS.Close
	END IF
	'*****************************************
	'response.write "SELECT UserID, (FirstName + ' ' + LastName) AS SalesAgentName FROM Users WHERE UPPER(VicidialLogin) = '" & UCASE(user) & "'"
	'*****************************************
	'Get all deals
	'*****************************************
	SQLQuery = "SELECT Deals.DealID, Deals.DealStatus, (Plans.PlanName + ' - ' + Plans.Network) AS PlanName, Deals.DealDescription FROM Deals" & _
				" LEFT JOIN Plans ON Plans.PlanID = Deals.PlanID" & _
				" ORDER BY Deals.DealDescription, Deals.DealID DESC"

	SET RS = MyConn.Execute(SQLQuery)
	IF RS.EOF = false THEN	
		DealsArrData = RS.getRows()
		ThereAreDeals = "Yes"
	END IF
	RS.Close
	'*****************************************
	
	'*****************************************
	'Get all Credit Questions
	'*****************************************
	SQLQuery = "SELECT CreditQuestionID, CreditQuestion, CreditQuestionOptions FROM CreditQuestions WHERE QuestionStatus = 'Active' AND QuestionType = 'CreditVetting' ORDER BY QuestionOrder"

	SET RS = MyConn.Execute(SQLQuery)
	IF RS.EOF = false THEN	
		CreditQuestionsArrData = RS.getRows()
		ThereAreCreditQuestions = "Yes"
	END IF
	RS.Close
	'*****************************************
	
	'*****************************************
	'Get all Affordability Questions
	'*****************************************
	SQLQuery = "Exec getAffordabilityQuestions 0"

	SET RS = MyConn.Execute(SQLQuery)
	IF RS.EOF = false THEN	
		AffordabilityQuestionsArrData = RS.getRows()
		ThereAreAffordabilityQuestions = "Yes"
	END IF
	RS.Close
	'*****************************************

	'*****************************************
	'Get all language options
	'*****************************************
	SQLQuery = "EXEC getLanguages"

	SET RS = MyConn.Execute(SQLQuery)
	IF RS.EOF = false THEN	
		LanguagesArrData = RS.getRows()		
	END IF
	RS.Close
	'*****************************************

	'MyConn.Close
	
	
	ELSE
	
	response.write "Invalid entry!"
	response.end
	
END IF

%>



<!--#include virtual="/common/Banks.asp"-->


<title>IntelliCell CCS</title>

<body onLoad="CheckIDNo();CheckBankAccount();" bgcolor="#F4F4F4;" class="Gray">



<table align="center" width="900" cellspacing="0" cellpadding="0" border="0" class="table table-borderless">
<tr>
	<td align="center">
		<table width="750" class="table table-bordered">
			<tr>
				<td class="Gray" width="201"><img src="/Images/IntelliCell-Logo.png" width="200" height="70" border="0" alt=""></td>
				<td class="Gray" valign="Middle" align="right" width="400"><a class="Header">New Application</a><br><b>Sales Agent:</b> <%=SalesAgentName%></td>
			</tr>
		</table>
	</td>
</tr>
</table>
<p>
<table align="center" cellspacing="0" width="900" cellpadding="0" border="0" class="table table-borderless">
<!-- <tr class="Container">
    <td width="4" height="4" class="Container" background="/images/tl_corner.png"></td>
    <td colspan="3" class="Container" background="/images/t_border.png"></td>
    <td width="4" height="4" class="Container" background="/images/tr_corner.png"></td>
</tr>
<tr>
	<td width="4" class="Container" background="/images/l_border.png"></td>
	<td colspan="3" height="10"></td>
	<td width="4" class="Container" background="/images/r_border.png"></td>
</tr> -->
<tr>
    <!-- <td width="4" class="Container" background="/images/l_border.png"></td>
	<td width="10"></td> -->
    <td align="center">




<p>
<form name="NewApplicationForm" method="post" action="/Application/Actions/NewApplication_Action2EmpDev.asp" onSubmit="return checkMinRequired(this)">
<%
'UserID = 333

IF NewSale = "Yes" THEN
IF UserID = 0 THEN UserID = 333 END IF

	%>
	<input type="hidden" name="AgentID" value="<%=UserID%>">
	<input type="hidden" name="lead_id" value="<%=lead_id%>">
	<input type="hidden" name="campaign" value="<%=campaign%>">
	<input type="hidden" name="phone_login" value="<%=phone_login%>">
	<input type="hidden" name="vendor_lead_code" value="<%=vendor_lead_code%>">
	<input type="hidden" name="source_id" value="<%=source_id%>">
	<input type="hidden" name="list_id" value="<%=list_id%>">
	<input type="hidden" name="called_since_last_reset" value="<%=called_since_last_reset%>">
	<input type="hidden" name="group" value="<%=group%>">
	<input type="hidden" name="channel_group" value="<%=channel_group%>">
	<input type="hidden" name="uniqueid" value="<%=uniqueid%>">
	<input type="hidden" name="customer_zap_channel" value="<%=customer_zap_channel%>">
	<input type="hidden" name="server_ip" value="<%=server_ip%>">
	<input type="hidden" name="SIPexten" value="<%=SIPexten%>">
	<input type="hidden" name="session_id" value="<%=session_id%>">
	<input type="hidden" name="dialed_number" value="<%=dialed_number%>">
	<input type="hidden" name="dialed_label" value="<%=dialed_label%>">
	<input type="hidden" name="recording_filename" value="<%=recording_filename%>">
	<input type="hidden" name="recording_id" value="<%=recording_id%>">
	<%
END IF
%>
<input type="hidden" name="IDNo">
<table width="750" class="table table-bordered">
<caption style="background-color: #477EB7;color:White;font-size: 13px;font-weight:bold;">Customer Information</caption>
<tbody>
<tr>
	<th>ID No</th>
	<td><input type="text" name="CurrentIDNo" value="<%=PossibleIDNo%>" size="13" maxlength="13" onBlur="CheckIDNo(this.value);">&nbsp;<a id="IDNoValidation"></a></td>
	<th>Language Preference</th>
	<td><select name="LanguagePreference">
			<option value="0">--Language Preference--</option>
			<%
				
				FOR i = 0 to UBOUND(LanguagesArrData,2)
					%>
					<option value="<%=LanguagesArrData(0,i)%>"><%=LanguagesArrData(1,i)%></option>
					<%
				NEXT
				%>
		</select>
	</td>
</tr>
<tr>
	<th>Are you working during the lockdown?</th>
	<td>
		<input type="radio" id="yes" name="lockdown" value="1">
  		<label for="yes">Yes</label>&nbsp;
  		<input type="radio" id="no" name="lockdown" value="0">
  		<label for="No">No</label><br>  
	</td>
</tr>
<tr>
	<th>First Name</th>
	<td><input type="text" name="FirstName" maxlength="25" value="<%=first_name%>" onBlur="ValidateField('Text','FirstNameValidation',this.value)">&nbsp;<a id="FirstNameValidation"></a></td>
	<th>Last Name</th>
	<td><input type="text" name="LastName" maxlength="25" value="<%=last_name%>" onBlur="ValidateField('Text','LastNameValidation',this.value)">&nbsp;<a id="LastNameValidation"></a></td>
</tr>
<tr>
	<th>Middle Name</th>
	<td><input type="text" name="MiddleName" maxlength="25" onBlur="ValidateField('Text','MiddleNameValidation',this.value)">&nbsp;<a id="MiddleNameValidation"></a></td>
	<th>Known As</th>
	<td><input type="text" name="KnownAs" maxlength="25" onBlur="ValidateField('Text','KnownAsValidation',this.value)">&nbsp;<a id="KnownAsValidation"></a></td>
</tr>
<tr>
	<th>Cell No</th>
	<td><input type="text" name="CellNo" value="<%=phone_number%>" size="10" maxlength="10" onBlur="ValidateField('Number','CellNoValidation',this.value)">&nbsp;<a id="CellNoValidation"></a></td>
	<th>Email Address</th>
	<td><input type="text" name="EmailAddress" value="<%=email%>" onBlur="ValidateField('Text','EmailAddressValidation',this.value)">&nbsp;<a id="EmailAddressValidation"></a></td>
</tr>
<tr>
	<th>Home Tel No</th>
	<td><input type="text" name="TelNo"  size="10" maxlength="10" value="<%=alt_phone%>" onBlur="ValidateField('Number','TelNoValidation',this.value)">&nbsp;<a id="TelNoValidation"></a></td>
	<th>Fax No</th>
	<td><input type="text" name="FaxNo"  size="10" maxlength="10" value="<%=FaxNo%>" onBlur="ValidateField('Number','FaxNoValidation',this.value)">&nbsp;<a id="FaxNoValidation"></a></td>
</tr>
<tr>
	<th>Alt. Contact No</th>
	<td><input type="text" name="AlternateContactNo" size="10" maxlength="10" onBlur="ValidateField('Number','AlternateContactNoValidation',this.value)">&nbsp;<a id="AlternateContactNoValidation"></a></td>
	<th>Work No</th>
	<td><input type="text" name="EmployeeWorkNo" size="10" maxlength="10" onBlur="ValidateField('Number','EmployeeWorkNoValidation',this.value)">&nbsp;<a id="EmployeeWorkNoValidation"></a></td>
</tr>
<tr>
	<th>Alt. Contact Name</th>
	<td><input type="text" name="AlternateContactName" onBlur="ValidateField('Text','AlternateContactNameValidation',this.value)">&nbsp;<a id="AlternateContactNameValidation"></a></td>
	<th>Gender</th>
	<td>
		<select name="Gender">
			<option value="<%=gender%>" SELECTED><%=gender%></option>
			<option value="Male">Male</option>
			<option value="Female">Female</option>
		</select>&nbsp;<a id="GenderValidation"></a>
	</td>
</tr>
<tr>
	<th>Married</th>
	<td>Yes<input type="radio" id="mr" name="MaritalStatus" value="Married" size="10" maxlength="10" >
		No<input type="radio" id="sgl" name="MaritalStatus" value="Single" size="10" maxlength="10" >
	</td>
	<th>Number of dependants</th>
	<td><input type="text" name="numberofDependants" size="10" maxlength="10"></td>

</tr>
<tr>
	<td colspan="4"><iframe name="GoogleMapFrame" id="GoogleMapFrame" width="99%" height="300" marginwidth="0" marginheight="0" scrolling="no" style="display:none"></iframe></td>
</tr>
<tr>
	<th valign="top"><a onClick="ShowGoogleMap();" style="cursor:hand" title="Show/Hide Google Maps"><img src="/Images/icons/map.png" width="16" height="16" border="0" alt=""></a> RICA Address<br><br><a onClick="CopyGoogleAddress('Home');ValidateForm();" style="cursor:hand;font-size:10px;color:navy"><em>(Copy Google Address)</em></th>
	<td>
		<input type="text" name="HomeAddress1" maxlength="41" value="<%=address1%>" onBlur="ValidateField('Text','HomeAddress1Validation',this.value)">&nbsp;<a id="HomeAddress1Validation"></a><br>
		<input type="text" name="HomeAddress2" maxlength="41" value="<%=address2%>" onBlur="ValidateField('Text','HomeAddress2Validation',this.value)">&nbsp;<a id="HomeAddress2Validation"></a><br>
		<input type="text" name="HomeAddress3" maxlength="41" value="<%=address3%>" onBlur="ValidateField('Text','HomeAddress3Validation',this.value)">&nbsp;<a id="HomeAddress3Validation"></a><br>
		<strong>Suburb</strong><br> <input type="text" name="HomeSuburb" maxlength="41" value="<%=HomeSuburb%>" onBlur="ValidateField('Text','HomeSuburbValidation',this.value)">&nbsp;<a id="HomeSuburbValidation"></a><br>
		<strong>City</strong><br> <input type="text" name="HomeCity" maxlength="31" value="<%=city%>"  onBlur="ValidateField('Text','HomeCityValidation',this.value)">&nbsp;<a id="HomeCityValidation"></a><br>
		<strong>Province</strong><br> <select name="HomeProvince">
					<option value="<%=state%>" SELECTED><%=state%></option>
					<option value="Eastern Cape">Eastern Cape</option>
					<option value="Free State">Free State</option>
					<option value="Gauteng">Gauteng</option>
					<option value="Kwazulu Natal">Kwazulu Natal</option>
					<option value="Mpumalanga">Mpumalanga</option>
					<option value="Northern Cape">Northern Cape</option>
					<option value="Limpopo">Limpopo</option>
					<option value="North West">North West</option>
					<option value="Western Cape">Western Cape</option>
				</select>&nbsp;<a id="HomeProvinceValidation"></a><br>
		<strong>Postal Code</strong><br> <input type="text" name="HomePostCode" value="<%=postal_code%>" size="4" maxlength="4" onBlur="ValidateField('Number','HomePostCodeValidation',this.value)">&nbsp;<a id="HomePostCodeValidation"></a>			
	</td>
	<th valign="top"><a onClick="ShowGoogleMap();" style="cursor:hand" title="Show/Hide Google Maps"><img src="/Images/icons/map.png" width="16" height="16" border="0" alt=""style="cursor:hand"></a> Delivery Address<br><br><a onClick="CopyGoogleAddress('Delivery');ValidateForm();" style="cursor:hand;font-size:10px;color:navy"><em>(Copy Google Address)</em><br><br><a onClick="CopyAddress();ValidateForm();" style="cursor:hand;font-size:10px;color:navy"><em>(Copy RICA Address)</em></a></th>
	<td>
		<input type="text" name="DeliveryAddress1" maxlength="41" value="<%=DeliveryAddress1%>" onBlur="ValidateField('Text','DeliveryAddress1Validation',this.value)">&nbsp;<a id="DeliveryAddress1Validation"></a><br>
		<input type="text" name="DeliveryAddress2" maxlength="41" value="<%=DeliveryAddress2%>" onBlur="ValidateField('Text','DeliveryAddress2Validation',this.value)">&nbsp;<a id="DeliveryAddress2Validation"></a><br>
		<input type="text" name="DeliveryAddress3" maxlength="41" value="<%=DeliveryAddress3%>" onBlur="ValidateField('Text','DeliveryAddress3Validation',this.value)">&nbsp;<a id="DeliveryAddress3Validation"></a><br>
		<strong>Suburb</strong><br> <input type="text" name="DeliverySuburb" maxlength="41" value="<%=DeliverySuburb%>" onBlur="ValidateField('Text','DeliverySuburbValidation',this.value)">&nbsp;<a id="DeliverySuburbValidation"></a><br>
		<strong>City</strong><br> <input type="text" name="DeliveryCity" maxlength="31" value="<%=DeliveryCity%>"  onBlur="ValidateField('Text','DeliveryCityValidation',this.value)">&nbsp;<a id="DeliveryCityValidation"></a><br>
		<strong>Province</strong><br> <select name="DeliveryProvince">
					<option value="<%=DeliveryProvince%>" SELECTED><%=DeliveryProvince%></option>
					<option value="Eastern Cape">Eastern Cape</option>
					<option value="Free State">Free State</option>
					<option value="Gauteng">Gauteng</option>
					<option value="Kwazulu Natal">Kwazulu Natal</option>
					<option value="Mpumalanga">Mpumalanga</option>
					<option value="Northern Cape">Northern Cape</option>
					<option value="Limpopo">Limpopo</option>
					<option value="North West">North West</option>
					<option value="Western Cape">Western Cape</option>
				</select>&nbsp;<a id="DeliveryProvinceValidation"></a><br>
		<strong>Postal Code</strong><br> <input type="text" name="DeliveryPostCode" value="<%=DeliveryPostCode%>" size="4" maxlength="4"  onBlur="ValidateField('Number','DeliveryPostCodeValidation',this.value)">&nbsp;<a id="DeliveryPostCodeValidation"></a>
	</td>
</tr>
</tbody>
</table>

<p>
<table width="750" class="table table-bordered">
<caption style="background-color: #477EB7;color:White;font-size: 13px;font-weight:bold;" class="general_caption"><div class="caption_text">Employment Information</div></caption>
<tr>
	<th>Employer Name</th>
	<td>
	<div class = "ui-widget">
	<input type="text" name="EmployerName" id="EmployerName" value="<%=EmployerName%>" onBlur="ValidateField('Text','EmployerNameValidation',this.value)">&nbsp;<a id="EmployerNameValidation"></a></td>
	</div>
	<th>
	Employer Branch / Details
	</th>
	<td>
	<Input type="text" name="EmployerBranch" id="EmployerBranch">
	</td>
	
</tr>
<tr>
	<th>Start Date</th>
	<td><select name="EmploymentStartDate" id="EmploymentStartDate">
		<option value=""></option>
		<option value="6">Less than 6 Months</option>
		<option value="1">6 Months to 1 Year</option>
		<option value="2">1 to 2 Years</option>
		<option value="5">2 to 5 Years</option>
		<option value="10">5 to 10 Years</option>
		<option value="15">10 to 15 Years</option>
		<option value="16">More than 15 Years</option>
		</select>
	</td>
	<!-- <td><input type="text" name="EmploymentStartDate" id="EmploymentStartDate" value="<%=EmploymentStartDate%>" READONLY size="8">&nbsp;<a id="EmploymentStartDateValidation"></a></td> -->
</tr>
<tr>
	<th>Contact Person</th>
	<td><input type="text" name="EmployerContact" value="<%=EmployerContact%>" onBlur="ValidateField('Text','EmployerContactValidation',this.value)">&nbsp;<a id="EmployerContactValidation"></a></td>
	<th>Contact Tel No</th>
	<td><input type="text" name="EmployerContactNumber" value="<%=EmployerContactNumber%>" onBlur="ValidateField('Number','EmployerContactNumberValidation',this.value)">&nbsp;<a id="EmployerContactNumberValidation"></a></td>
</tr>
<tr>
	<th>Employee No</th>
	<td><input type="text" name="EmployeeNo" onBlur="ValidateField('Text','EmployeeNoValidation',this.value)">&nbsp;<a id="EmployeeNoValidation"></a></td>
	<th>Job Description</th>
	<td><input type="text" name="JobDescription" value="<%=JobDescription%>" onBlur="ValidateField('Text','JobDescriptionValidation',this.value)" size="25">&nbsp;<a id="JobDescriptionValidation"></a></td>
</tr>
<tr>
	<th>Number of Employee</th>
	<td>
		<Select name="NumberOfEmployee">
			<option value="">Select Number of Employee</option>
			<option value="Less than 20">0 to 20</option>
			<option value="20 and above">greater then 20</option>
		</Select>
	</td>
</tr>
<tr>
	<th>Industry</th>
	<td colspan="3">
		<select name="Industry">
			<option value="">Select Industry</option>
		<%
		SQLQuery = "SELECT SectorID, Sector FROM EmploymentSectors"
		Set RSS = MyConn.Execute(SQLQuery)
		IF NOT RSS.EOF THEN
			arrS = RSS.getRows()
			FOR i = 0 TO Ubound(arrS, 2)
				%>
				<option value="<%=arrS(0,i)%>"><%=arrS(1, i)%></option>
				<%
			NEXT
		END IF
		RSS.close
		MyConn.Close
		%>
		</select>
	</td>
</tr>
<tr>
	<th>Payroll Frequency</th>
	<td>
	<select name="PayrollFrequency" onClick="SetPayrollFrequency();">
		<option value="<%=PayrollFrequency%>" SELECTED><%=PayrollFrequency%></option>
		<option value="Monthly">Monthly</option>
		<option value="Weekly">Weekly</option>
		<option value="Fortnightly">Fortnightly</option>
	</select>&nbsp;<a id="PayrollFrequencyValidation"></a>
	</td>
	<th>Gross <a id="GrossPayrollFrequencyType"></a>Income</th>

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text">R</span>
  </div>
  <input type="text" class="form-control" aria-label="Amount (to the nearest rand)" 
  	value="<%=GrossPayrollIncome%>" onBlur="ValidateField('Number','GrossPayrollIncomeValidation',this.value)">>
  <div class="input-group-append">
    <span class="input-group-text">.00</span>
  </div>
</div>
</tr>
<tr>
	<th>Pay Day</th>
	<td><a id="PayDayDates">
	<select name="PayDay">
		<option value="<%=PayDay%>" SELECTED><%=PayDay%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
	</select></a>
	 &nbsp;<a id="PayDayValidation"></a>
	</td>
	<th>Net <a id="NetPayrollFrequencyType"></a>Income (After expenses)</th>
	<td>R<input type="text" name="NetPayrollIncome" ID="NetPayrollIncome" value="<%=NetPayrollIncome%>" size="8" onBlur="ValidateField('Number','NetPayrollIncomeValidation',this.value)">&nbsp;<a id="NetPayrollIncomeValidation"></a></td>
</tr>
</table>
<p>
		
<table width="750" class="table table-bordered">
<caption style="background-color: #477EB7;color:White;font-size: 13px;font-weight:bold;"><div class="caption_text">Credit Reports</div></caption>
<tr>
	<td id="CreditReportTable" colspan="2"></td>
</tr>
<tr>
	<td width="400" colspan="2">Complete below to generate the credit report:</td>
</tr>
<tr>
	<td width="400">
		</br>
		<b>Username:</b> <input type="text" id="Username" value="<%=Username%>" READONLY><br>
		<b>Password:</b> <input type="password" id="Password" value="">
		
	</td>
	<td valign="bottom"><input type="button" onClick="GenerateCreditReport();" value="Generate >>>>>" id="GenerateCreditReportButton"> <img src="/Images/icons/Refresh.png" width="16" height="16" border="0" alt="Refresh" id="CreditReportRefresh" style="cursor:hand" onClick="RefreshCreditReport();"></td>
</tr>
</table>

<p>
<%
IF ThereAreCreditQuestions = "Yes" THEN
	
	%>
	<table width="750" class="table table-bordered">
	<caption style="background-color: #477EB7;color:White;font-size: 13px;font-weight:bold;"><div class="caption_text">Credit Vetting Questions</div></caption>
	<%
	FOR i = 0 to UBOUND(CreditQuestionsArrData,2)
		%>
		<tr>
			<th><%=i+1 & ". " & CreditQuestionsArrData(1,i)%></th>
		</tr>
		<tr>
			<td>
				<select name="CreditQuestion<%=CreditQuestionsArrData(0,i)%>" id="CreditQuestion<%=CreditQuestionsArrData(0,i)%>" class="small-input" onChange="CheckOther<%=CreditQuestionsArrData(0,i)%>(this.value)">
					<option value=""></option>
					<%
					CreditQuestionsOptions = CreditQuestionsArrData(2,i) & VBCRLF  & "Other"
					CreditQuestionsOptions = Split(CreditQuestionsOptions, VBCRLF, -1, 0) 'Create an array
					
					FOR n = LBOUND(CreditQuestionsOptions) TO UBOUND(CreditQuestionsOptions)
						%>
						<option value="<%=CreditQuestionsOptions(n)%>"><%=CreditQuestionsOptions(n)%></option>
						<%
					NEXT
					%>
				</select>&nbsp;<a id="CreditQuestion<%=CreditQuestionsArrData(0,i)%>Validation"></a><br><a id="CreditQuestionOtherDisplay<%=CreditQuestionsArrData(0,i)%>" style="display:none">Other: <input type="text" name="CreditQuestionOther<%=CreditQuestionsArrData(0,i)%>" id="CreditQuestionOther<%=CreditQuestionsArrData(0,i)%>" size="100" class="small-input" DISABLED onBlur="ValidateField('Text','CreditQuestionOther<%=CreditQuestionsArrData(0,i)%>Validation',this.value)"></a>&nbsp;<a id="CreditQuestionOther<%=CreditQuestionsArrData(0,i)%>Validation"></a><br>
			</td>
		</tr>
		<%
		QuestionIDs = QuestionIDs & Comma & CreditQuestionsArrData(0,i)
		Comma = ","
		
	NEXT
	%>
	</table>
	<input type="hidden" name="QuestionIDs" value="<%=QuestionIDs%>">
	<p>
	<script>
	<%
	QuestionIDsArray = Split(QuestionIDs, ",", -1, 0) 'Create an array

	FOR i = LBOUND(QuestionIDsArray) TO UBOUND(QuestionIDsArray)
		%>
		function CheckOther<%=QuestionIDsArray(i)%>(QuestionAnswer){
			if (QuestionAnswer == "Other"){
				document.getElementById('CreditQuestionOther<%=QuestionIDsArray(i)%>').disabled = false;
				document.getElementById('CreditQuestionOtherDisplay<%=QuestionIDsArray(i)%>').style.display = '';
				}
				else{
				document.getElementById('CreditQuestionOther<%=QuestionIDsArray(i)%>').value = '';
				document.getElementById('CreditQuestionOther<%=QuestionIDsArray(i)%>').disabled = true;
				document.getElementById('CreditQuestionOtherDisplay<%=QuestionIDsArray(i)%>').style.display = 'none';
				}
				
		}
		<%
	NEXT
	%>
	</script>

	<%
	END IF
%>


<table width="750" class="table table-bordered">
<caption style="background-color: #477EB7;color:White;font-size: 13px;font-weight:bold;"><div class="caption_text">Bank Information</div></caption>
<tr>
	<th>Bank Name</th>
	<td>
	<select name="BankName" onChange="GetBranchCode();QuestionAccountNo();">
		<option value="<%=BankName%>" SELECTED><%=BankName%></option>
		<%
		FOR p = LBound(BankNames) to UBound(BankNames)
			%>
			<option value="<%=BankNames(p)%>"><%=BankNames(p)%></option>
			<%
		NEXT
		%>
	</select>&nbsp;<a id="BankNameValidation"></a>
	</td>
	<th>Account Holder Name</th>
	<td><input type="text" name="BankAccountName" value="<%=BankAccountName%>" onBlur="ValidateField('Text','BankAccountNameValidation',this.value)">&nbsp;<a id="BankAccountNameValidation"></a></td>
</tr>
<tr>
	<th>Account Type</th>
	<td>
	<select name="BankAccountType" onBlur="GetBranchCode();QuestionAccountNo();">
		<option value="<%=BankAccountType%>" SELECTED><%=BankAccountType%></option>
		<option value="Savings">Savings</option>
		<option value="Current">Current</option>
	</select>&nbsp;<a id="BankAccountTypeValidation"></a>
	</td>
	<th>Branch Code</th>
	<td><input type="text" name="BankBranchCode" value="<%=BankBranchCode%>" id="BankBranchCode" size="6" maxlength="6" READONLY>&nbsp;<a id="BankBranchCodeValidation"></a></td>
</tr>
<tr>
	<th>Account No</th>
	<td><input type="text" name="BankAccountNo" value="<%=BankAccountNo%>" onBlur="CheckBankAccount();" size="13" maxlength="11">&nbsp;<a id="BankAccountNoValidation"><input type=hidden name=ValidAccountNo value=No></a></td>
</tr>
</table>

<p>

<table width="750" class="table table-bordered">
<caption style="background-color: #477EB7;color:White;font-size: 13px;font-weight:bold;"><div class="caption_text">Product Information</div></caption>
<tr>
	<th>Contract Type</th>
	<td><input type="text" name="ContractType" value="New" maxlength="10" size="9" READONLY></td>
	<th>Keeping Cell No</th>
	<td>
	<select name="KeepingCellNo" OnChange="KeepingCell(value);">
		<option value="<%=KeepingCellNo%>" SELECTED><%=KeepingCellNo%></option>
		<option value="No">No</option>
		<option value="Yes">Yes</option>
	</select>&nbsp;<a id="KeepingCellNoValidation"></a>
	</td>
	<!-- <th>Interested in Insurance</th>
	<td colspan="3"><select name="Insurance">
			<option value="No" SELECTED>No</option>
			<option value="Yes">Yes</option>
		</select>**
	</td> -->
</tr>
<tr>
	<th>1st Debit Order Date</th>
	<td><input type="text" name="FirstDebitOrder" id="FirstDebitOrder" value="<%=FirstDebitOrder%>" READONLY size="8" onChange="ValidateFirstDebitOrderDate()">&nbsp;<a id="FirstDebitOrderValidation"></a></td>
	<th>Cell Number to Keep</th>
	<td><input type="text" name="CellNoToKeep" value="<%=CellNoToKeep%>" maxlength="10" size="9" onBlur="ValidateField('Number','CellNoToKeepValidation',this.value)">&nbsp;<a id="CellNoToKeepValidation"></a></td>
</tr>
<tr>
	<th>Activation Month</th>
	<td>
	<select name="ActivationMonth">
		<option value="<%=ActivationMonth%>" SELECTED><%=ActivationMonth%></option>
		<option value="<%=LEFT(MonthName(Month(DateAdd("m",-1,Date()))), 3) & "-" & Year(DateAdd("m",-1,Date()))%>"><%=LEFT(MonthName(Month(DateAdd("m",-1,Date()))), 3) & "-" & Year(DateAdd("m",-1,Date()))%></option>
		<option value="<%=LEFT(MonthName(Month(DateAdd("m",0,Date()))), 3) & "-" & Year(DateAdd("m",0,Date()))%>"><%=LEFT(MonthName(Month(DateAdd("m",0,Date()))), 3) & "-" & Year(DateAdd("m",0,Date()))%></option>
		<option value="<%=LEFT(MonthName(Month(DateAdd("m",1,Date()))), 3) & "-" & Year(DateAdd("m",1,Date()))%>"><%=LEFT(MonthName(Month(DateAdd("m",1,Date()))), 3) & "-" & Year(DateAdd("m",1,Date()))%></option>
		<option value="<%=LEFT(MonthName(Month(DateAdd("m",2,Date()))), 3) & "-" & Year(DateAdd("m",2,Date()))%>"><%=LEFT(MonthName(Month(DateAdd("m",2,Date()))), 3) & "-" & Year(DateAdd("m",2,Date()))%></option>
	</select>&nbsp;<a id="ActivationMonthValidation"></a>
	</td>
</tr>
<tr>	
	<th valign="top">Deal</th>
	<td colspan="3">
	<div id="DealsDropDownList"></div>
	<a id="DealsDummy">----SELECT PAYDAY FIRST----</a>
	&nbsp;<a id="DealIDValidation"></a>
	<input type="hidden" name="DealID" id="DealID">
	<input type="hidden" name="DealValue" id="DealValue">
	</td>
</tr>
</table>

<P>
<%
IF ThereAreAffordabilityQuestions = "Yes" THEN
	
	%>
<table width="750" class="table table-bordered">
	<caption style="background-color: #477EB7;color:White;font-size: 13px;font-weight:bold;"><div class="caption_text">Affordability Questions</div></caption>
	<tr>
		<td></td>
		<td rowspan="11">
		<div>
			
			<img src="/images/approve.png" id="affordApprove" alt="" style="display: none" />
			<img src="/images/decline.png" id="affordDecline" alt="" style="display: none"/>
			
		</div>
			<div id="affordabilityTotal" style="float:right; width:100px; color:blue "></div>
			<input type="button" value="Calculate" onclick="calculateAffordability()">
		</td>	
	</tr>
	
	<%
	
	FOR i = 0 to UBOUND(AffordabilityQuestionsArrData,2)
		%>
		<tr>
			<th><%=i+1 & ". " & AffordabilityQuestionsArrData(1,i)%></th>
		</tr>
		<tr>
			<td><input type="text" value="" name="AffordabilityQuestion<%=AffordabilityQuestionsArrData(0,i)%>" id="AffordabilityQuestion<%=AffordabilityQuestionsArrData(0,i)%>" class="small-input"></td>
			
		</tr>

		<%
		AffordabilityQuestionIDs = AffordabilityQuestionIDs & CommaAfford & AffordabilityQuestionsArrData(0,i)
		CommaAfford = ","
		
	NEXT
	%>
	<input type="hidden" ID="affordabilityQuestionIds" name="affordabilityQuestionIds" value="<%=AffordabilityQuestionIDs%>">
	</table>
	<input type="hidden" name="QuestionIDs" value="<%=QuestionIDs%>">
	<input type="hidden" name="calculationChanges" ID="calculationChanges">
	<input type="hidden" name="affordabilityPercentageToSave" ID="affordabilityPercentageToSave">
	<p>
	<script>
	<%
	QuestionIDsArray = Split(QuestionIDs, ",", -1, 0) 'Create an array

	FOR i = LBOUND(QuestionIDsArray) TO UBOUND(QuestionIDsArray)
		%>
		function CheckOther<%=QuestionIDsArray(i)%>(QuestionAnswer){
			if (QuestionAnswer == "Other"){
				document.getElementById('CreditQuestionOther<%=QuestionIDsArray(i)%>').disabled = false;
				document.getElementById('CreditQuestionOtherDisplay<%=QuestionIDsArray(i)%>').style.display = '';
				}
				else{
				document.getElementById('CreditQuestionOther<%=QuestionIDsArray(i)%>').value = '';
				document.getElementById('CreditQuestionOther<%=QuestionIDsArray(i)%>').disabled = true;
				document.getElementById('CreditQuestionOtherDisplay<%=QuestionIDsArray(i)%>').style.display = 'none';
				}
				
		}
		<%
	NEXT
	%>
	</script>

	<%
	END IF
%>
<p>



<table width="750" class="table table-bordered">
<caption style="background-color: #477EB7;color:White;font-size: 13px;font-weight:bold;"><div class="caption_text">Status</div></caption>
<tr>
	<th>Debtor No</th>
	<td><input type="text" name="DebtorNo" size="10" READONLY style='background:#e5e5e5'"></td>
	<th>Existing Customer</th>
	<td><input type="text" name="ExistingDebtor" id="ExistingDebtor" value="<%=ExistingDebtor%>" size="3" READONLY></td>
</tr>
<tr>
	<th valign="top">Notes</th>
	<td colspan="3"><textarea cols="56" rows="5" name="Notes" onBlur="ValidateField('Text','NotesValidation',this.value)"><%=Notes%></textarea>&nbsp;<a id="NotesValidation"></a></td>
</tr>
<tr>
	<th>Application Status</th>
	<td colspan="2">
		<select name="ApplicationStatus" onChange="ActivateSMS(this.value);ajaxFunction('CreditReportExists','Input','/Common/Ajax/CheckCreditReport.asp?IDNo=' + document.NewApplicationForm.IDNo.value);">
			<option value="<%=ApplicationStatus%>" SELECTED><%=ApplicationStatus%></option>
			<option value="Pending Sale">Pending Sale</option>
			<option value="Completed Sale">Completed Sale</option>
			<option value="Cancelled">Cancelled</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<b id="SendSMS" style="display:none"><input type="checkbox" name="SendSMS" value="Yes">Send 'Welcome' SMS</b>
	</td>
	<td align="right"><input type="submit" id="SubmitButton" value="Save Application >>>"></td>
</tr>
</table>
<input type="hidden" size="100" id="InvalidCharacter" value="" READONLY>
<input type="hidden" name="ValidIDNo" value="">
</form>

<p>
<form action="Actions/ImportCreditReport_Action.asp" method="post" target="ImportFrame" enctype="multipart/form-data" accept-charset="utf-8">
<table width="750" class="table table-bordered">
<caption style="background-color: #477EB7;color:White;font-size: 13px;font-weight:bold;"><div class="caption_text">Credit Report Upload</div></caption>
<tr>
	<th>Credit Report</th>
	<td><input type="hidden" name="IdentityNumber" id="IdentityNumber" value=""><input name="attach1" type="file" size=35><input name="cmdSubmit" type="submit" value="Upload >>>>>>>>"><iframe name="ImportFrame" id="ImportFrame" width="20" height="20" marginwidth="0" marginheight="0" scrolling="no" frameborder="0"></iframe></td>
</tr>
<tr>
	<th valign="top">Existing Reports</th>
	<td><a id="CurrentCreditReports"></a></td>
</tr>
</table>

<input type="hidden" name="CreditReportExists" id="CreditReportExists">
</form>


	</td>
	<!-- <td width="10"></td>
    <td width="4" class="Container" background="/images/r_border.png"></td> -->
</tr>
<!-- <tr>
	<td width="4" class="Container" background="/images/l_border.png"></td>
	<td colspan="3" height="10"></td>
	<td width="4" class="Container" background="/images/r_border.png"></td>
</tr>
<tr>
    <td width="4" height="4" class="Container" background="/images/bl_corner.png"></td>
    <td colspan="3" class="Container" background="/images/b_border.png"></td>
    <td width="4" height="4" class="Container" background="/images/br_corner.png"></td>
</tr> -->
</table>

<div id="jqwindow">
                <div id="windowHeader">
                    <span>
                        <img src="/images/icons/Person.png" alt="" style="margin-right: 15px" /><a id="WindowHeader"></a>
                    </span>
                </div>
                <div style="overflow: hidden;" id="windowContent">
                    <iframe name="ModalWindowFrame" id="ModalWindowFrame" width="100%" height="90%" border="1"></iframe>
					<div align="center"><input type="button" id="ok" value="OK" onClick="GetDeals();"></div>
                </div>
				
</div>


<script>
function RefreshCreditReport(){
	var IDNo = document.NewApplicationForm.IDNo.value;
	ajaxFunction('CreditReportTable','Html','/Transunion/Includes/CreditReports.asp?IDNo=' + IDNo + '&UserID=<%=UserID%>');
	document.getElementById('GenerateCreditReportButton').disabled = false;
}


function startTimer(secs){
	timeInSecs = parseInt(secs)-1;
	ticker = setInterval("tick()",1000);   // every second
}

function tick() {
	var secs = timeInSecs;
	
	if (secs>0) {
		timeInSecs--;
		}
		else {
		clearInterval(ticker); // stop counting at zero
		document.getElementById('CreditReportRefresh').style.display = '';
		}

	document.getElementById("timer").innerHTML = secs + 's';
}

function OpenCreditReport(FileLocation){
	document.getElementById('ModalWindowFrame').src=FileLocation;
	document.getElementById('WindowHeader').innerHTML = 'Credit Report';
	$('#jqwindow').jqxWindow('open');
}

function GenerateCreditReport(){
	
	var ValidIDNo = document.NewApplicationForm.ValidIDNo.value;
	var IDNo = document.NewApplicationForm.IDNo.value;
	var Firstname = document.NewApplicationForm.FirstName.value;
	var Lastname = document.NewApplicationForm.LastName.value;
	var Username = document.getElementById('Username').value;
	var Password = document.getElementById('Password').value;
	var NoOfReportsWithin3Months = document.getElementById('NoOfReportsWithin3Months').value;
	
	
	if (ValidIDNo == 'Yes' && Firstname != '' && Lastname != '' && Username != '' && Password != ''){
		document.getElementById('GenerateCreditReportButton').disabled = true;
		//document.getElementById('GenerateCreditReportButton').value = 'Generating...Please be patient...';
		document.getElementById('CreditReportTable').innerHTML = '<div align="center"><font color=orange>Generating...Please be patient...<span id="timer"></span></font></div>'
		ajaxFunction('CreditReportTable','Html','/Transunion/Includes/CreditReports.asp?Generate=Yes&IDNo=' + IDNo + '&Firstname=' + Firstname + '&Lastname=' + Lastname + '&Username=' + Username + '&Password=' + Password + '&NoOfReportsWithin3Months=' + NoOfReportsWithin3Months);
		//document.getElementById('GenerateCreditReportButton').value = 'Generate >>>>';
		document.getElementById('CreditReportRefresh').style.display = 'none';
		startTimer(19);  // 19 seconds 
		}
		else{
		alert('Please ensure you have entered a valid ID Number, Firstname, Lastname, Username and Password!')
		}
}


function GetDeals(){
	var PayDay = document.NewApplicationForm.PayDay.value
	var ContractType = document.NewApplicationForm.ContractType.value
	
	
	if (PayDay != ''){
		var RandomNumber = Math.random();
		document.getElementById('DealID').value = '';
		ajaxFunction('DealsDropDownList','Eval','/Common/Ajax/DealsNEW3.asp?Random=' + RandomNumber + '&PayDay=' + PayDay + '&ContractType=' + ContractType + '&Payroll=<%=REQUEST("Payroll")%>');
		ajaxFunction('DealsDropDownList','Eval','/Common/Ajax/DealsNEW3.asp?Random=' + RandomNumber + '&PayDay=' + PayDay + '&ContractType=' + ContractType + '&Payroll=<%=REQUEST("Payroll")%>');
		document.getElementById('DealsDropDownList').style.display = '';
		document.getElementById('DealsDummy').innerHTML = '';
		}
}

function SetPayrollFrequency(PayDay){
	document.getElementById('DealID').value = '';
	document.getElementById('DealsDropDownList').style.display = 'none';
	document.getElementById('DealsDummy').innerHTML = '----SELECT PAYDAY FIRST----';
	var PayrollFrequency = document.NewApplicationForm.PayrollFrequency.value
	document.getElementById('GrossPayrollFrequencyType').innerHTML = PayrollFrequency + '&nbsp;'
	document.getElementById('NetPayrollFrequencyType').innerHTML = PayrollFrequency + '&nbsp;'
	ajaxFunction('PayDayDates','Html','/Common/Ajax/PayDayDates.asp?GetDeals=Yes&PayrollFrequency=' + PayrollFrequency + '&PayDay=' + PayDay);
	
}



    // Calendar.setup({
    //     inputField      :    "EmploymentStartDate",   // id of the input field
    //     ifFormat        :    "%Y-%m-%d",       // format of the input field
    //     showsTime       :    false,
	// 	singleClick 	: 	 true
    // });
	
	Calendar.setup({
        inputField      :    "FirstDebitOrder",   // id of the input field
        ifFormat        :    "%Y-%m-%d",       // format of the input field
        showsTime       :    false,
		singleClick 	: 	 true
    });
</script>

<script>

	var calculationCount = 0;

	function calculateAffordability()
	{
		var debtorPayFrequency = document.getElementById('NetPayrollFrequencyType').innerHTML;
		payFreq = debtorPayFrequency.replace("&nbsp;","");
		
		payMulitplier = 1

		if(payFreq == 'Weekly')
		{
			payMulitplier = 4
		}
		else if (payFreq == 'Fortnightly')
		{
			payMulitplier = 2
		}

		var dealPrice = 0;
		
		var elementExists = !!document.getElementById("DealValue");
		dealPrice = document.NewApplicationForm.DealValue.value.substr(1);
		
		var questions = document.getElementById("affordabilityQuestionIds").value.split(",");
		
		var total = 0;
		var nettIncome = document.getElementById("NetPayrollIncome").value;
		nettIncome = nettIncome * payMulitplier;

		var affordabilityPercentage = 0
		
		for (var i = 0; i < questions.length; i++) 
		{
			var quest = "AffordabilityQuestion"+questions[i].toString()
			var questValue = document.getElementById(quest).value
			
			if(questValue !== "" && !isNaN(questValue))
			{				
    			total = total + parseInt(questValue);
			}			
		}
		
		total = parseInt(total) + parseInt(dealPrice)
		
		//Calculate what percentage of his disposal income is consumed.
		
		if(total > 0)
		{
			affordabilityPercentage = (total / nettIncome)*100
		}
		//console.log(affordabilityPercentage);

		if(affordabilityPercentage > 85)
		{			
			//Decline
			document.getElementById("affordApprove").style.display="none";
			document.getElementById("affordDecline").style.display="block";
		}
		else
		{
			//Approve
			document.getElementById("affordDecline").style.display="none";
			document.getElementById("affordApprove").style.display="block";
		}
		
		calculationCount++;
		document.getElementById("affordabilityTotal").innerHTML = Math.round(affordabilityPercentage) + "%. <br>" + calculationCount + " affordability calculations performed";
		document.getElementById("calculationChanges").value = calculationCount;
		document.getElementById("affordabilityPercentageToSave").value = Math.round(affordabilityPercentage);
	} 


function ShowGoogleMap(){
	if (document.getElementById('GoogleMapFrame').style.display == "none"){
		document.getElementById('GoogleMapFrame').style.display = ""
		document.GoogleMapFrame.location.href = '/Common/GoogleMaps.asp'
	}
	else {
		document.getElementById('GoogleMapFrame').style.display = "none"
	}
	
	
}

function CopyGoogleAddress(AddressType){
	var street_number = window.frames['GoogleMapFrame'].document.getElementById('street_number').value
	var street = window.frames['GoogleMapFrame'].document.getElementById('route').value
	var city = window.frames['GoogleMapFrame'].document.getElementById('locality').value
	var province = window.frames['GoogleMapFrame'].document.getElementById('administrative_area_level_1').value
	var postal_code = window.frames['GoogleMapFrame'].document.getElementById('postal_code').value
	var place_name = window.frames['GoogleMapFrame'].document.getElementById('place_name').value
	var suburb = window.frames['GoogleMapFrame'].document.getElementById('sublocality_level_2').value
	
	
	if (street_number == ''){
		var street_address = street
		}
		else{
		var street_address = street_number + ' ' + street
		}
		
	
	if (street_address == place_name){
		address_line1 = street_address
		address_line2 = ''
		}
		else{
		address_line1 = place_name
		address_line2 = street_address
		}
	
	if (AddressType == "Home"){
		document.NewApplicationForm.HomeAddress1.value = address_line1
		document.NewApplicationForm.HomeAddress2.value = address_line2
		document.NewApplicationForm.HomeAddress3.value = ''
		document.NewApplicationForm.HomeSuburb.value = suburb
		document.NewApplicationForm.HomeCity.value = city
		document.NewApplicationForm.HomePostCode.value = postal_code
		document.NewApplicationForm.HomeProvince.value = province
		}
		else{
		document.NewApplicationForm.DeliveryAddress1.value = address_line1
		document.NewApplicationForm.DeliveryAddress2.value = address_line2
		document.NewApplicationForm.DeliveryAddress3.value = ''
		document.NewApplicationForm.DeliverySuburb.value = suburb
		document.NewApplicationForm.DeliveryCity.value = city
		document.NewApplicationForm.DeliveryPostCode.value = postal_code
		document.NewApplicationForm.DeliveryProvince.value = province
		}
		
	alert('Google Address Copied!\n\nNB: Please re-confirm address with client and make sure Postal Code is correct.')
}


function ValidateFirstDebitOrderDate(){
	
	var PTPType = 'Debit Order'
	var PTPDate = document.getElementById('FirstDebitOrder').value
	var Automation = 'Manual'
	
	if (PTPType == "Debit Order"){
		
		if ( new Date(PTPDate) > new Date() && new Date(PTPDate) < new Date('<%=DateAdd("d",60,DATE())%>')){
			ajaxFunction('DebitOrderStatus','Eval','/Common/Ajax/DebitOrderStatus.asp?NewApp=Yes&PTPDate=' + PTPDate + '&Automation=' + Automation);
			}
			else if (new Date(PTPDate) > new Date('<%=DateAdd("d",60,DATE())%>')){
			alert('Please make sure the date is not more than 60 days from today!')
			document.getElementById('FirstDebitOrder').value = ''
			}
			else if (PTPDate != ""){
			alert('Please make sure the date is after today!')
			document.getElementById('FirstDebitOrder').value = ''
			}
		
	}
}




function ActivateSMS(AppStatus){
	if (AppStatus == 'Completed Sale'){
		document.getElementById('SendSMS').style.display = ''
		document.NewApplicationForm.SendSMS.checked = true
		}
		else{
		document.getElementById('SendSMS').style.display = 'none'
		document.NewApplicationForm.SendSMS.checked = false
		}

}

function getAge(dateString) {
    var today = new Date();
    var birthDate = new Date(dateString);
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }
    return age;
}

 // Javascript code copyright 2009 by Fiach Reid : www.webtropy.com
 // This code may be used freely, as long as this copyright notice is intact.
 function Calculate(Luhn)
 {
    var sum = 0;
    for (i=0; i<Luhn.length; i++ )
    {
		sum += parseInt(Luhn.substring(i,i+1));
    }
	var delta = new Array (0,1,2,3,4,-4,-3,-2,-1,0);
	for (i=Luhn.length-1; i>=0; i-=2 )
    {		
		var deltaIndex = parseInt(Luhn.substring(i,i+1));
		var deltaValue = delta[deltaIndex];	
		sum += deltaValue;
	}	
	var mod10 = sum % 10;
	mod10 = 10 - mod10;	
	if (mod10==10)
	{		
		mod10=0;
	}
	return mod10;
 }

 function CheckIDNo()
 {
	
 	document.getElementById('IDNoValidation').innerHTML = "<font color=red size=-2><em>Checking...</em></font>"
	document.NewApplicationForm.ValidIDNo.value = 'No';
	document.NewApplicationForm.IDNo.value = document.NewApplicationForm.CurrentIDNo.value
	
	var Luhn = document.NewApplicationForm.IDNo.value
 	var LuhnLen = Luhn.length;
	var LuhnDigit = parseInt(Luhn.substring(Luhn.length-1,Luhn.length));
	var LuhnLess = Luhn.substring(0,Luhn.length-1);
	var DateOfBirth = Luhn.substring(0,6)
	
	if (DateOfBirth.substring(0,2) > 20){
		var DateOfBirth = '19' + DateOfBirth
		}
		else{
		var DateOfBirth = '20' + DateOfBirth
		}
	
	var DateOfBirth = DateOfBirth.substring(0,4) + '-' + DateOfBirth.substring(4,6) + '-' + DateOfBirth.substring(6,8)
	
	var Age = getAge(DateOfBirth)
	
	var GenderChar = Luhn.substring(6,7)
	if (GenderChar < 5){
		var Gender = 'Female';
		}
		else{
		var Gender = 'Male';
		}
		
	var CitizenChar = Luhn.substring(10,11)
	if (CitizenChar == '0'){
		var Citizen = 'South African';
		}
		else{
		var Citizen = 'Foreigner';
		}
		
	if (Calculate(LuhnLess)==parseInt(LuhnDigit) && (LuhnLen == 13)){
		
		document.NewApplicationForm.ValidIDNo.value = 'Yes';
		document.getElementById('IdentityNumber').value = document.NewApplicationForm.IDNo.value
		document.getElementById('IDNoValidation').innerHTML = '<img src=/Images/icons/thumbsup.png alt= width=16 height=16 border=0>'
		document.NewApplicationForm.Gender.value = Gender
		document.getElementById('SubmitButton').value = 'Checking if customer exists...'
		document.getElementById('SubmitButton').disabled = true;
		//ajaxFunction('ExistingClient','Eval','/Contracts/CheckExistingClient.asp?IDNo=' + Luhn + '&Age=' + Age + '&Gender=' + Gender + '&Citizen=' + Citizen);
		document.getElementById('ModalWindowFrame').src='/Application/CheckExistingClientTU.asp?UserID=<%=UserID%>&IDNo=' + Luhn + '&Age=' + Age + '&Gender=' + Gender + '&Citizen=' + Citizen;
		document.getElementById('WindowHeader').innerHTML = 'Existing Client Check';
	
		newWindow();
			$('#jqwindow').jqxWindow('open');
		//document.NewApplicationForm.CurrentIDNo.disabled = true;
		document.getElementById('CreditReportTable').innerHTML = '<div align="center"><font color=orange>Checking for existing credit reports...Please be patient...</font></div>'
		ajaxFunction('CreditReportTable','Html','/Transunion/Includes/CreditReports.asp?IDNo=' + Luhn + '&UserID=<%=UserID%>');
		}	
		else{
		document.NewApplicationForm.ValidIDNo.value = 'No';
		document.NewApplicationForm.ExistingDebtor.value = 'No';
		document.getElementById('IDNoValidation').innerHTML = '<img src=/Images/icons/thumbsdown.png alt= width=16 height=16 border=0>'
		document.getElementById('IdentityNumber').value = ''
		}
 }
 
 
 function CopyAddress(){
	document.NewApplicationForm.DeliveryAddress1.value = document.NewApplicationForm.HomeAddress1.value
	document.NewApplicationForm.DeliveryAddress2.value = document.NewApplicationForm.HomeAddress2.value
	document.NewApplicationForm.DeliveryAddress3.value = document.NewApplicationForm.HomeAddress3.value
	document.NewApplicationForm.DeliverySuburb.value = document.NewApplicationForm.HomeSuburb.value
	document.NewApplicationForm.DeliveryCity.value = document.NewApplicationForm.HomeCity.value
	document.NewApplicationForm.DeliveryPostCode.value = document.NewApplicationForm.HomePostCode.value
	document.NewApplicationForm.DeliveryProvince.value = document.NewApplicationForm.HomeProvince.value
}

function GetBranchCode(){
	var BankName = document.NewApplicationForm.BankName.value
	var BankAccountType = document.NewApplicationForm.BankAccountType.value
	if (BankName != '' && BankAccountType != ''){
		ajaxFunction('BankBranchCode','Input','/Common/Ajax/GetBranchCode.asp?Bank=' + BankName + '&AccountType=' + BankAccountType);
		}
}



function KeepingCell(Answer){
	var KeepingCellAnswer = Answer;
	if (KeepingCellAnswer == 'Yes'){
		document.NewApplicationForm.CellNoToKeep.disabled = false;
		document.NewApplicationForm.CellNoToKeep.value = document.NewApplicationForm.CellNo.value
	}
	if (KeepingCellAnswer == 'No'){
		document.NewApplicationForm.CellNoToKeep.disabled = true;
		document.NewApplicationForm.CellNoToKeep.value = '';
		document.NewApplicationForm.ContractType.value = 'New';
	}
	
}

function CheckBankAccount(){
	var BankName = document.NewApplicationForm.BankName.value
	var AccountNo = document.NewApplicationForm.BankAccountNo.value
	var BranchCode = document.NewApplicationForm.BankBranchCode.value
	var AccountType = document.NewApplicationForm.BankAccountType.value
	if (AccountNo != '' && BranchCode != '' && AccountType != ''){
		document.getElementById('BankAccountNoValidation').innerHTML = "<font color=red size=-2><em>Checking...</em></font><input type=hidden name=ValidAccountNo value=No>"
		ajaxFunction('BankAccountNoValidation','Html','/Common/Ajax/ValidateBankAccount.asp?x=x&AccountNo=' + AccountNo + '&BranchCode=' + BranchCode + '&AccountType=' + AccountType + '&BankName=' + BankName);
		}
		else{
		document.getElementById('BankAccountNoValidation').innerHTML = '<img src=/Images/icons/thumbsdown.png alt= width=16 height=16 border=0><input type=hidden name=ValidAccountNo value=No>';
		}

}

function QuestionAccountNo(){
	document.getElementById('BankAccountNoValidation').innerHTML = "<font color=red>?</font><input type=hidden name=ValidAccountNo value=No>"
}

function ValidateField(FieldType,FieldName,FieldValue){
	
	Invalid = 'No'
	var StrLength = FieldValue.length
	var InvalidCharacterField = document.getElementById('InvalidCharacter').value

	if (FieldType == "Number"){
		var LegalChars = /^[0-9]+$/; // only no's
		}
		else if (FieldType == "Text"){
		var LegalChars = /\b^[a-zA-z0-9\.\-\s]+$\b/; // only text
		}
	
	if (LegalChars.test(FieldValue) == false && StrLength > 0) {
			Invalid = 'Yes'
			}
	
	if (Invalid == 'Yes'){
		document.getElementById(FieldName).innerHTML = '<img src=/Images/icons/thumbsdown.png alt= width=16 height=16 border=0>'
		document.getElementById('InvalidCharacter').value = InvalidCharacterField + '|' + FieldName + '|'
		}
		else{
		document.getElementById(FieldName).innerHTML = ''
		document.getElementById('InvalidCharacter').value = InvalidCharacterField.replace('|' + FieldName + '|', '')
		}
	
}

function checkMinRequired(){
		
	var ApplicationStatus = document.NewApplicationForm.ApplicationStatus.value;
	//var agree=;
	var affordability = document.getElementById("calculationChanges").value
	var affordabilityPercentage = document.getElementById("affordabilityPercentageToSave").value
	if(affordability == "" && ApplicationStatus == "Completed Sale")
	{
		alert("Please calculate affordability")
		return false;
	}
	else if (affordabilityPercentage > 85 && ApplicationStatus != "Cancelled")
	{
		alert("Please cancel this application or select a different deal. Applicant can't afford current selection")
		
	}

	if (ApplicationStatus == "") {
		alert("Please select an Application Status.")
		return false;
		}
	else{
		if (confirm("Are you sure you wish to save this Application?")){
			
			if (document.getElementById('CreditReportExists').value != "Yes" && ApplicationStatus == "Completed Sale") {
				alert('No credit report exists for this applicant! Please upload one.')
				return false;
				}
			
			<%
			IF QuestionIDs & "x" <> "x" THEN
				
				QuestionIDsArray = Split(QuestionIDs, ",", -1, 0) 'Create an array
			
				FOR i = LBOUND(QuestionIDsArray) TO UBOUND(QuestionIDsArray)
					%>
					if (document.getElementById('CreditQuestion<%=QuestionIDsArray(i)%>').value == "" && ApplicationStatus == "Completed Sale") {
						alert("You have not entered an answer for Credit Question <%=i+1%>.")
						return false;
						}
					if (document.getElementById('CreditQuestion<%=QuestionIDsArray(i)%>').value == "Other" && document.getElementById('CreditQuestionOther<%=QuestionIDsArray(i)%>').value == "" && ApplicationStatus == "Completed Sale") {
						alert("You have selected 'Other' for Credit Question <%=i+1%>, but have not completed the 'Other' answer.")
						return false;
						}
					<%
				NEXT
			
			END IF
			%>
			
			if (document.getElementById('InvalidCharacter').value != "") {
				alert("You have INVALID characters in some of your fields marked with a Thumbs Down. Please fix!")
				return false;
				}
			
			if (document.NewApplicationForm.FirstName.value == "") {
				alert("You did not enter a First Name.")
				return false;
				}
			if (document.NewApplicationForm.LastName.value == "") {
				alert("You did not enter a Last Name.")
				return false;
				}	
			if (document.NewApplicationForm.ValidIDNo.value != "Yes") {
				alert("You did not enter a valid ID Number.")
				return false;
				}	
			if (document.NewApplicationForm.CellNo.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a cell number.")
				return false;
				}
			if (document.NewApplicationForm.Gender.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Gender.")
				return false;
				}
			if (document.NewApplicationForm.HomeAddress1.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a HomeAddress1.")
				return false;
				}
			if (document.NewApplicationForm.HomeCity.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Home City.")
				return false;
				}
			if (document.NewApplicationForm.HomeProvince.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Home Province.")
				return false;
				}
			if (document.NewApplicationForm.HomePostCode.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Home PostCode.")
				return false;
				}
			if (document.NewApplicationForm.DeliveryAddress1.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Delivery Address1.")
				return false;
				}
			if (document.NewApplicationForm.DeliveryCity.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Delivery City.")
				return false;
				}
			if (document.NewApplicationForm.DeliveryProvince.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Delivery Province.")
				return false;
				}
			if (document.NewApplicationForm.DeliveryPostCode.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Delivery PostCode.")
				return false;
				}
			// mr = document.getElementById("mr");
			// sgl = document.getElementById("sgl");	
			// if((mr.checked == false) && (sgl.checked == false)){ 
			// 	alert("Marital status must be checked ");
			// 	return false;
			// }
			// if(document.NewApplicationForm.numberofDependants.value == ""){
			// 	alert("You did not enter the number of dependants");
			// 	return false;
			// }
			if (document.NewApplicationForm.EmployerName.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter an Employer Name.")
				return false;
				}
			EStartDate = document.getElementById("EmploymentStartDate").value;
			if (EStartDate == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter an Employment Start Date.")
				return false;
				//document.NewApplicationForm
				}
			if (document.NewApplicationForm.EmployerContact.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter an Employer Contact.")
				return false;
				}
			if (document.NewApplicationForm.EmployerContactNumber.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter an Employer Contact Number.")
				return false;
				}
			if (document.NewApplicationForm.JobDescription.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Job Description.")
				return false;
				}
			if (document.NewApplicationForm.PayrollFrequency.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Payroll Frequency.")
				return false;
				}
			if (document.NewApplicationForm.GrossPayrollIncome.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Gross Payroll Income.")
				return false;
				}
			if (document.NewApplicationForm.NetPayrollIncome.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Net Payroll Income.")
				return false;
				}
			if (document.NewApplicationForm.PayDay.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Pay Day.")
				return false;
				}
			if (document.NewApplicationForm.BankName.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Bank Name.")
				return false;
				}
			if (document.NewApplicationForm.BankAccountType.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Bank Account Type.")
				return false;
				}
			if (document.NewApplicationForm.BankBranchCode.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Bank Branch Code.")
				return false;
				}
			if (document.NewApplicationForm.BankAccountNo.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Bank Account No.")
				return false;
				}
			if (document.NewApplicationForm.BankAccountName.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Bank Account Name.")
				return false;
				}
			if (document.NewApplicationForm.ValidAccountNo.value != "Yes" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a Valid Bank Account No.")
				return false;
				}
			if (document.NewApplicationForm.KeepingCellNo.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not choose whether the customer wants to keep their cell number.")
				return false;
				}
			if (document.NewApplicationForm.FirstDebitOrder.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter a First Debit Order Date.")
				return false;
				}
			if (document.NewApplicationForm.ActivationMonth.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You did not enter an Activation Month.")
				return false;
				}
			if (document.NewApplicationForm.DealID.value == "" && ApplicationStatus == "Completed Sale") {
				alert("You must select a Deal.")
				return false;
				}
						
			
			return true;
			}
		else{
			return false;	
			}
			
		}
		
	
}

function idleLogout() {
    var t;
	var IdleTimeSeconds = 60 //number of seconds
	var IdleTime = IdleTimeSeconds * 1000
	
    window.onload = resetTimer;
    window.onmousemove = resetTimer;
    window.onmousedown = resetTimer; // catches touchscreen presses
    window.onclick = resetTimer;     // catches touchpad clicks
    window.onscroll = resetTimer;    // catches scrolling with arrow keys
    window.onkeypress = resetTimer;

    function logout() {
        if (confirm('You have not worked on this page for ' + IdleTimeSeconds + ' seconds. Click OK to leave this page.')){
			window.location.href="Blank.asp";
			}
		
    }

    function resetTimer() {
        clearTimeout(t);
        t = setTimeout(logout, IdleTime);  // time is in milliseconds
    }
}

<%
IF REQUEST("SalesRestore") <> "Yes" THEN 
	%>
	idleLogout();
	<%
END IF
%>	
</script>

</body>