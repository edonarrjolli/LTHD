USE olist_dwh
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[proc_generate_excel1]
AS
BEGIN

BEGIN TRY
Begin transaction procedureExec

exec master..xp_cmdshell 'sqlcmd -s, -W -w 2048 -Q  "set nocount on; SELECT * FROM [olist_dwh].[dbo].[olist_raport]" | findstr /v /c:"-" /b > "E:\sql\test.csv"'


COMMIT TRAN
	END TRY 

	BEGIN CATCH
			DECLARE @ERROR INT,
					@MESSAGE VARCHAR(4000),
					@XSTATE INT;

			SELECT @ERROR=ERROR_NUMBER(),
				   @MESSAGE=ERROR_MESSAGE(),
				   @XSTATE=XACT_STATE();



			RAISERROR('TransactionArchive: %d: %s', 16, 1, @error, @message);

			ROLLBACK TRAN
			END CATCH

END



GO


