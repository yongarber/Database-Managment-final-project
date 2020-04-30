<cfquery name="addcustomer" datasource="Book_Store" dbtype="ODBC" username="root" password="yongarber@200">

insert into customer values('#custoemr_id#' ,'#first_name#' ,'#last_name#', '#address#','#phone_number#', '#username#', '#passwordU#')
</cfquery>


<Head>
	<title> Add Customer </title>
</Head>
<Body>
<h1> Customer has been added</h1><br>
<P align=center></p>

<P align=center><A href="http://localhost:8500/Yon_website/SampleWebSite.htm">Back to Home</A></P>


</Body>
</html>


