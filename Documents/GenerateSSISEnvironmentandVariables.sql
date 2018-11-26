/**************************************************************************************
   This script creates a script to generate and SSIS Environment and its variables.
   Replace the necessary entries to create a new envrionment
   ***NOTE: variables marked as sensitive have their values masked with '<REPLACE_ME>'.
       These values will need to be replace with the actual values
**************************************************************************************/

DECLARE @ReturnCode INT=0, @folder_id bigint

/*****************************************************
   Variable declarations, make any changes here
*****************************************************/
DECLARE @folder sysname = 'Test' /* this is the name of the new folder you want to create */
       , @env sysname = 'Test1' /* this is the name of the new environment you want to create */
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
       , @SensitivePwd sql_variant= N'<REPLACE_ME>'
       , @Single float= N'1'
       , @String sql_variant= N'I am a string'
       , @UInt32 bigint= N'320'
       , @UInt64 bigint= N'640'
;
/* Starting the transaction */
BEGIN TRANSACTION
   IF NOT EXISTS (SELECT 1 FROM [SSISDB].[catalog].[folders] WHERE name = @folder)
   BEGIN
       RAISERROR('Creating folder: %s ...', 10, 1, @folder) WITH NOWAIT;
       EXEC @ReturnCode = [SSISDB].[catalog].[create_folder] @folder_name=@folder, @folder_id=@folder_id OUTPUT
       IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;
   END

   RAISERROR('Creating Environtment: %s', 10, 1, @env) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment] @folder_name=@folder, @environment_name=@env
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   /******************************************************
       Variable creation
   ******************************************************/
   RAISERROR('Creating variable: Boolean ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'Boolean'
       , @sensitive=0
       , @description=N'Boolean Test Value'
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@Boolean
       , @data_type=N'Boolean'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: Byte ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'Byte'
       , @sensitive=0
       , @description=N'Byte Test Variable'
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@Byte
       , @data_type=N'Byte'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: DateTime ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'DateTime'
       , @sensitive=0
       , @description=N''
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@DateTime
       , @data_type=N'DateTime'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: Decimal ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'Decimal'
       , @sensitive=0
       , @description=N''
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@Decimal
       , @data_type=N'Decimal'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: Double ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'Double'
       , @sensitive=0
       , @description=N''
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@Double
       , @data_type=N'Double'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: InsensitivePwd ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'InsensitivePwd'
       , @sensitive=0
       , @description=N''
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@InsensitivePwd
       , @data_type=N'String'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: Int16 ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'Int16'
       , @sensitive=0
       , @description=N''
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@Int16
       , @data_type=N'Int16'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: Int32 ...', 10, 1) WITH NOWAIT;

   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'Int32'
       , @sensitive=0
       , @description=N''
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@Int32
       , @data_type=N'Int32'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: Int64 ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'Int64'
       , @sensitive=0
       , @description=N''
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@Int64
       , @data_type=N'Int64'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: SByte ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'SByte'
       , @sensitive=0
       , @description=N''
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@SByte
       , @data_type=N'SByte'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: SensitivePwd ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'SensitivePwd'
       , @sensitive=1
       , @description=N'Sensitive Password'
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@SensitivePwd
       , @data_type=N'String'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: Single ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'Single'
       , @sensitive=0
       , @description=N''
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@Single
       , @data_type=N'Single'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: String ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'String'
       , @sensitive=0
       , @description=N'Test String'
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@String
       , @data_type=N'String'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: UInt32 ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'UInt32'
       , @sensitive=0
       , @description=N''
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@UInt32
       , @data_type=N'UInt32'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

   RAISERROR('Creating variable: UInt64 ...', 10, 1) WITH NOWAIT;
   EXEC @ReturnCode = [SSISDB].[catalog].[create_environment_variable]
       @variable_name=N'UInt64'
       , @sensitive=0
       , @description=N''
       , @environment_name=@env
       , @folder_name=@folder
       , @value=@UInt64
       , @data_type=N'UInt64'
   IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;

COMMIT TRANSACTION

RAISERROR(N'Complete!', 10, 1) WITH NOWAIT;
GOTO EndSave

QuitWithRollback:
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
RAISERROR(N'Variable creation failed', 16,1) WITH NOWAIT;

EndSave:
GO