local CATEGORY_NAME = "NLR"

function ulx.removenlr( calling_ply, target_plys )
	for i=1, #target_plys do
		target_plys[ i ]:RemoveNLR()
	end

	ulx.fancyLogAdmin( calling_ply, "#A removed NLR from #T", target_plys )
end
local strip = ulx.command( CATEGORY_NAME, "ulx removenlr", ulx.removenlr, "!removenlr" )
strip:addParam{ type=ULib.cmds.PlayersArg }
strip:defaultAccess( ULib.ACCESS_ADMIN )
strip:help( "Removes NLR from the target(s)." )
