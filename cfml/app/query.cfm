<cfquery name="qTestQuery" datasource="pgjdbc">
    SELECT personname
    FROM person                         
</cfquery> 

<cfdump var="#qTestQuery#">