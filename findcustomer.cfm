<cfquery name="findcustomer" datasource="Book_Store" dbtype="ODBC">

select * from customer where first_name='#first_name#'

</cfquery>



<Head>
	<title> Book Store DB </title>
</Head>
<Body>

<font size="+8">Find Customer's Record:</font> <br> <br>




<cfif findcustomer.RecordCount gt 0>

<Cfoutput query="findcustomer">



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

<br><br>


</cfoutput>

<cfelse>


<font size="+6"> Customer Does not Exist </font>

</cfif>





<P align=center></p>

<P align=center><A href="http://localhost:8500/Yon_website/SampleWebSite.htm">Back to Home</A></P>



</Body>
</html>

