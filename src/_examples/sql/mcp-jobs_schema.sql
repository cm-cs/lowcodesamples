IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl-mcp-jobs]') AND type in (N'U'))
DROP TABLE [dbo].[tbl-mcp-jobs]
GO
CREATE TABLE [dbo].[tbl-mcp-jobs] (
    [id]               UNIQUEIDENTIFIER CONSTRAINT [DEFAULT_tbl-mcp-jobs_id] DEFAULT NEWID() NOT NULL,
    [requestReference] VARCHAR (50)     NULL,
    [requestType]      VARCHAR (50)     NULL,
    [requestUser]      TEXT             NULL,
    [notficationType]  CHAR (10)        CONSTRAINT [DEFAULT_tbl-mcp-jobs_notficationType] DEFAULT 'email' NULL,
    [timeGenerated]    DATETIME         CONSTRAINT [DEFAULT_tbl-mcp-jobs_timeGenerated] DEFAULT GETDATE() NOT NULL,
    [timeUpdated]      DATETIME         NULL,
    [status]           INT              CONSTRAINT [DEFAULT_tbl-mcp-jobs_status] DEFAULT 0 NOT NULL,
    [complete]         BIT              CONSTRAINT [DEFAULT_tbl-mcp-jobs_complete] DEFAULT 0 NOT NULL,
    [objectType]       VARCHAR (50)     NULL,
    [objectReference]  TEXT             NULL,
    [attributeChange]  VARCHAR (50)     NULL,
    [attributeValue]   TEXT             NULL,
    [approvalNeeded]   BIT              CONSTRAINT [DEFAULT_tbl-mcp-jobs_approvalNeeded] DEFAULT 0 NOT NULL,
    [approvalUsers]    TEXT             NULL
    CONSTRAINT [PK_tbl-mcp-jobs] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Job queue for Logic App workers', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tbl-mcp-jobs';

INSERT INTO [dbo].[tbl-mcp-jobs] (requestReference, requestType, requestUser, objectType, objectReference, attributeChange, attributeValue, approvalNeeded, approvalUsers) VALUES
 ('test1', 'aaduser_guestinvite', 'cm', 'aadguest', 'bob@external','none','none',1,'cm'), 
 ('test2', 'aaduser_guestinvite', 'cm', 'aadguest', 'peter@external','none','none',1,'cm'),
 ('test3', 'aaduser_test', NULL, 'aadguest', 'joe@external','none','none',0,NULL);

--CREATE USER "mi-example" FROM EXTERNAL PROVIDER;
--ALTER ROLE db_datawriter ADD MEMBER "mi-example";

UPDATE [dbo].[tbl-mcp-jobs] SET [status] = 5 WHERE [requestType] = 'aaduser_guestinvite';
