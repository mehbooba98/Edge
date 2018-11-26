/*****************************************************
   Variable declarations, make any changes here
*****************************************************/
DECLARE @folder sysname = 'Test2' /* this is the name of the new folder you want to create */
       , @env sysname = 'Test2' /* this is the name of the new environment you want to create */
       , @Boolean bit= N'1'
       , @Byte tinyint= N'0'
       , @DateTime datetime= N'Jan  1 1900 12:00AM'
       , @Decimal decimal(38,18)= N'1.234500000000000000'
       , @Double float= N'6.78'
       , @InsensitivePwd sql_variant= N'ImIns3nsitive!'
       , @Int16 smallint= N'16'
       , @Int32 int= N'32'
       , @Int64 bigint= N'64'
       , @SByte smallint= N'0'
       , @SensitivePwd sql_variant= N'ImAS3ns1t1vePwd2!'
       , @Single float= N'1'