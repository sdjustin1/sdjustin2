<cfquery name="qTestQuery" datasource="pgjdbc">
    SELECT *
    FROM person                         
</cfquery> 

<cfdump var="#qTestQuery#">