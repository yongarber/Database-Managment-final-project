<Head>
	<title> View Customer Information </title>
</Head>
<font size="+8">CUSTOMER TABLE:</font> <br> <br>

<cfquery name="viewcustomer" datasource="Book_Store" dbtype="ODBC">
select * from customer
</cfquery>

<Cfoutput query="viewcustomer">

Customer ID	: #custoemr_id# 
Customer First Name	: #first_name#
Customer Last Name	: #last_name#
Customer Address	: #address#
Customer Phone Number	: #phone_number#

</CFOutput>

<P align=center></p>

<P align=center><A href="http://localhost:8500/Yon_website/SampleWebSite.htm">Back to Home</A></P>






