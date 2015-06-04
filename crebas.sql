/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     2009-03-22 21:18:22                          */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.uniterms')
            and   type = 'U')
   drop table dbo.uniterms
go

execute sp_revokedbaccess dbo
go

/*==============================================================*/
/* User: dbo                                                    */
/*==============================================================*/
execute sp_grantdbaccess dbo
go

/*==============================================================*/
/* Table: uniterms                                              */
/*==============================================================*/
create table dbo.uniterms (
   name                 nchar(10)            collate Polish_CI_AS not null,
   description          varchar(500)         collate Polish_CI_AS null,
   sA                   varchar(50)          collate Polish_CI_AS null,
   sB                   varchar(50)          collate Polish_CI_AS null,
   sOp                  varchar(50)          collate Polish_CI_AS null,
   eA                   varchar(50)          collate Polish_CI_AS null,
   eB                   varchar(50)          collate Polish_CI_AS null,
   eC                   varchar(50)          collate Polish_CI_AS null,
   fontSize             smallint             null,
   fontFamily           varchar(50)          collate Polish_CI_AS null,
   switched             char(1)              collate Polish_CI_AS null
)
on "PRIMARY"
go

