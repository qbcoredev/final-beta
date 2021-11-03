local label = 
[[ 
                          QBUS DUMPSTERS
                     MADE BY PIXELLIFE/PHANTOMDDK
]]

-- Returns the current version set in fxmanifest.lua
function GetCurrentVersion()
	return GetResourceMetadata( GetCurrentResourceName(), "version" )
end 

-- Grabs the latest version number from the web GitHub
PerformHttpRequest( "https://raw.githubusercontent.com/PhantomDDK/qb-dumpsters/main/version.txt", function( err, text, headers )
	-- Wait to reduce spam 
	Citizen.Wait( 2000 )

	-- Print the branding!
	print( label )

	-- Get the current resource version 
	local curVer = GetCurrentVersion()
	
	if ( text ~= nil ) then 
		-- Print out the current and latest version 
		print( "  ||    Current version: " .. curVer )
		print( "  ||    Latest recommended version: " .. text .."\n  ||" )
		
		-- If the versions are different, print it out
		if ( text ~= curVer ) then
			print( "  ||    ^1Your Pixel Life QBUS DUMPSTERS version is outdated, visit the FiveM forum post to get the latest version.\n^0  \\\\\n" )
		else
			print( "  ||    ^2Pixel Life QBUS DUMPSTERS server is up to date!\n^0  ||\n  \\\\\n" )
		end
	else 
		-- In case the version can not be requested, print out an error message
		print( "ERROR" )
	end 
end )
