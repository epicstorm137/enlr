local CATEGORY_NAME = "NLR"

function ulx.removenlr( calling_ply, target_plys )
	for i=1, #target_plys do
		target_plys[ i ]:RemoveNLR()
	end

	ulx.fancyLogAdmin( calling_ply, "#A removed NLR from #T", target_plys )
end
local nlrremove = ulx.command( CATEGORY_NAME, "ulx removenlr", ulx.removenlr, "!removenlr" )
nlrremove:addParam{ type=ULib.cmds.PlayersArg }
nlrremove:defaultAccess( ULib.ACCESS_ADMIN )
nlrremove:help( "Removes NLR from the target(s)." )
