<html>
<head>
<title>Update customer Record</title>
<cfquery name="update" datasource="Book_Store" dbtype="ODBC">
update Customer set custoemr_id='#custoemr_id#' ,first_name='#first_name#' ,last_name='#last_name#', address='#address#', username='#username#', passwordU='#passwordU#' where first_name='#first_name#'
</cfquery>
<Body>
<h1> Customer's Record has been updated</h1><br>
<P align=center></p>

<P align=center><A href="http://localhost:8500/Yon_website/SampleWebSite.htm">Back to Home</A></P>


</Body>
</html>
