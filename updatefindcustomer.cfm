<cfquery name="findcustomerquery" datasource="Book_Store" dbtype="ODBC">

select * from customer where first_name='#first_name#'

</cfquery>



<Head>
	<title> Book Store Database </title>
</Head>
<Body>

<font size="+8">Updating Customer's Record:</font> <br> <br>




<cfif findcustomerquery.RecordCount gt 0>

<Cfoutput query="findcustomerquery">

<FORM action=http://localhost:8500/Yon_website/updateupdatecustomer.cfm method=post> 



Customer ID	: 

<input name=custoemr_id type=text value=#custoemr_id#>

Customer's First Name:

<input name=first_name type=text value=#first_name#>


Customer's Last Name:

<input name=last_name type=text value=#last_name#>


Customer's Address:

<input name=address type=text value=#address#>

Customer's Phone Number:

<input name=phone_number type=text value=#phone_number#>

Customer's Username:

<input name=username type=text value=#username#>

Customer's Password:

<input name=passwordU type=text value=#passwordU#>

<br><br>
<input name=submit type=submit value="Update Customer's Record">


</form>


</cfoutput>

<cfelse>


<font size="+6"> Customer Does not Exist </font>

</cfif>





</Body>
</html>

