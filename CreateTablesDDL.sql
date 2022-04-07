use [GoblinAssaultUltra];
go

if (object_id('dbo.fk_CurrentGameId', 'F') is not null)
	alter table dbo.Player drop constraint fk_CurrentGameId;
go

drop table if exists [dbo].[Game];
go

drop table if exists [dbo].[Player];
go

drop table if exists [dbo].[GoblinAssaultUltra];
go

create table Game (
	GameId			int not null,
	GameName		varchar(30) not null,
	HostPlayerId	int,
	primary key (GameId)
);
go

create table Player (
	PlayerId		int not null,
	NickName		varchar(30) not null,
	CurrentGameId	int not null,
	FactionCd		varchar(4),
	HealthCount		int,
	GoldCount		int,
	primary key (PlayerId),
	constraint fk_CurrentGameId foreign key (CurrentGameId) references Game(GameId)
);
go

alter table Game
add constraint fk_HostPlayerId foreign key (HostPlayerId) references Player(PlayerId);
go