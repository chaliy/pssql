$here = (Split-Path -parent $MyInvocation.MyCommand.Definition)
import-module -name $here\PsSql\PsSql.psm1

invoke-sql $here\TestScripts\Simple.sql