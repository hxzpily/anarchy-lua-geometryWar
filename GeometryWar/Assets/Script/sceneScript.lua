-- new script file

function OnAfterSceneLoaded()
	local lCamShape = Game:GetEntity("mainCameraPosition");
  local lMainCamera = Game:GetCamera();
  lMainCamera:SetUseEulerAngles(true);
  lMainCamera:SetPosition(lCamShape:GetPosition());
  lMainCamera:SetOrientation(lCamShape:GetOrientation());
  if (G.mainMovie == nil) then
	  G.mainMovie = Scaleform:LoadMovie("Flash/MainMenu.gfx", 0, 0);
    G.bestScore = 0.0f;
    G.time = "00:00:00";
    if (Application:GetPlatformName() == "WIN32DX9") then
      GUI:LoadResourceFile("GUI/MenuSystem.xml");
      GUI:SetCursorVisible(true);
      Scaleform:SetAbsoluteCursorPositioning(true);
    end
  end
  fichier = io.open("Score.txt", "r");
  G.bestScore = fichier:read();
  if (G.bestScore == nil) then
    G.bestScore = "0";
  end
  fichier:close();
  G.mainMovie:Invoke("_root.OpenHUD");
  Game:InstantiatePrefab(Game:GetEntity("PlayerSpawn5"):GetPosition(), "Prefabs/player.vprefab", nil);
end


function OnBeforeSceneUnloaded()
  if (Application:IsInEditor()) then
    GUI:SetCursorVisible(false);
    G.mainMovie = nil;
	  Scaleform:UnloadAllMovies();
  end	
end


function OnUpdateSceneBegin()
	if (Input:IsKeyPressed(Vision.KEY_M)) then
    Application:LoadScene("Scenes/Menu/mainMenu.vscene");
  end
end
