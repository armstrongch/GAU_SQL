use [GoblinAssaultUltra];
go

create procedure dbo.CreateGame (
	@GameName		varchar(30),
	@PlayerNickName	varchar(30),
	@GameId			int output,
	@HostPlayerId	int output,
	@ErrorMessage	varchar(100) output
)
begin
	
	if exists (select 1 from dbo.Game where UPPER(GameName) = UPPER(@GameName))
		
		select @ErrorMessage = "A game with this name already exists.";
	
	else
	begin
		
		insert into Game (GameId, GameName)
		select ifnull(max(GameId), 0) + 1, @GameName
		from Game;
		
		select @GameId = GameId
		from Game
		where GameName = @GameName;
		
		insert into Player
			(PlayerId, NickName, CurrentGameId)
		select
			ifnull(max(PlayerId), 0) + 1,
			@PlayerNickName,
			@GameId
		from Player;
		
		select @
		
	end
	
end