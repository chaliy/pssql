PsSql Utils
=============

Set of commands ( right now only one :) ) to work with SQL database.


Example
=======

For example to execute PRINT

    invoke-sql "PRINT 'Hello world!"

Or to execute SQL script

    invoke-sql instnwnd.sql
    
Installation
============

If you have <a href="https://github.com/chaliy/psget">PsGet</a> installed, you can execute:

    install-module https://github.com/chaliy/pssql/raw/master/PsSql/PsSql.psm1
    
Or manual steps

    1. Copy PsSql.psm1 to your modules folder (e.g. $Env:PSModulePath\PsSql\ )
    2. Execute Import-Module PsSql (or add this command to your profile)
    3. Enjoy!