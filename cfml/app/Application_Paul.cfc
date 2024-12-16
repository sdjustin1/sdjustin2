component {

				this.name="cfmlServerless";
				this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0); //10 days
				this.sessionManagement=false;
				this.clientManagement=false;
				this.setClientCookies=false;
	
				public function onRequest(string path) {
					setting enablecfoutputonly="true" requesttimeout="180" showdebugoutput="true";
					application.counter++;
					include listLast(arguments.path,'/');
				}

	this.datasources["pgjdbc"] = {
		class: 'org.postgresql.Driver'
		, connectionString: 'jdbc:postgresql://' & server.system.environment.DB_CONNECTION_STRING
		, username: server.system.environment.DB_USERNAME
		, password: server.system.environment.DB_PASSWORD
	}

	this.defaultdatasource = "pgjdbc"

	function onApplicationStart() {
		application.counter = 0;
		application.resultsArray = [];
		return true;
	}

	function getCounter() {
		return application.counter;
	}

	public function getLambdaContext() {
		//see https://docs.aws.amazon.com/lambda/latest/dg/java-context-object.html
		return getPageContext().getRequest().getAttribute("lambdaContext");
	}

	public void function logger(string msg) {
		getLambdaContext().getLogger().log(arguments.msg);
	}

	public string function getRequestID() {
		if (isNull(getLambdaContext())) {
			//not running in lambda
			if (!request.keyExists("_request_id")) {
				request._request_id = createUUID();
			}
			return request._request_id;
		} else {
			return getLambdaContext().getAwsRequestId();
		}
	}

				function onMissingTemplate(){
					include '404.cfm';
				}

				function onError( any Exception, string EventName ) {
					writeOutput("Some error has occured");
					abort;
				}
}