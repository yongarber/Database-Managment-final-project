<html>
<head>
<title>Delete Customer</title>
<cfquery name="delete" datasource="Book_Store" dbtype="ODBC">
delete from customer where first_name='#first_name#'
</cfquery>
<Body>
<h1> Customer has been deleted</h1><br>
<P align=center></p>

<P align=center><A href="http://localhost:8500/Yon_website/SampleWebSite.htm">Back to Home</A></P>


</Body>
</html>
