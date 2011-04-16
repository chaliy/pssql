##
##    Adds some commands to with SQL databases.
##

function Invoke-Sql {
[CmdletBinding()]
Param(
    [Parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true, Mandatory=$true, Position=0)]    
    [String]$Script
)
	if ($Script.EndsWith(".sql")){
		$Sql = [IO.File]::ReadAllText($Script)
	} else {
		$Sql = $Script
	}

	$connection = New-object System.Data.SqlClient.SqlConnection("Server = .;Integrated Security=True" )
	$connection.Open() | Out-Null	
	$connection.Add_InfoMessage([System.Data.SqlClient.SqlInfoMessageEventHandler]{
		Write-Host $_
	})
	
	$Sql -split "(?m)^GO" | %{    
        if (-not [String]::IsNullOrEmpty($_)) { 
    		$cmd = $connection.CreateCommand()
    		$cmd.CommandTimeout = 30
    		$cmd.CommandText = $_
    		$cmd.ExecuteNonQuery() | Out-Null
    		$cmd.Dispose()
        }
	}
	$connection.Dispose()
	
<#
.Synopsis
    Invoke any SQL stuff you input in.
.Description     
.Parameter Script
    SQL script to execute
.Example
    Invoke-Sql instnwnd.sql 

    Description
    -----------
    Executes instnwnd.sql script.

#>
}

Export-ModuleMember Invoke-Sql
