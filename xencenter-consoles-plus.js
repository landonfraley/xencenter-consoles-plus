$(document).ready(RefreshPage);

function RefreshPage()
{
	retrieveURL();
}

function checkResult(Result) 
{
	var myResult = Result.result;
	$("#errorMessage").html(myResult.Status + " " + myResult.Value);
	if (myResult.Status == "Failure") 
	{
		var message = myResult.ErrorDescription[0];
		for (var i=1; i<myResult.ErrorDescription.length; i++) 
		{
			message+=","+myResult.ErrorDescription[i];
		}
		$("#errorMessage").html(message);
		return;
	}
	if (myResult.Value == "")
	{
		return;
	}
	myResult = eval("("+myResult.Value+")");
	return myResult;
}

function retrieveURL()
{
	var tmprpc;
	function retrieveOtherConfig() 
	{
		var toExec = "tmprpc." + window.external.SelectedObjectType + ".get_other_config(checkCustomField, window.external.SessionUuid, window.external.SelectedObjectRef);";
		eval(toExec);
	}
	tmprpc = new $.rpc(
		"xml", 
		retrieveOtherConfig,
		null,
		[window.external.SelectedObjectType + ".get_other_config"]
	);
}

function checkCustomField(ocResult)
{
	var result = checkResult(ocResult);
	if (result == null)
	{
		return;
	}
    if (result["XenCenter.CustomFields.xcpURL"])
	{
		window.location = result["XenCenter.CustomFields.xcpURL"];
    }
	$("#errorMessage").html("You need to set the custom field 'xcpURL' to the URL you want displayed and re-scan the plugins directory.");
}
