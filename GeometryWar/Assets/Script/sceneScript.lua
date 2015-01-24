-- new script file

function OnAfterSceneLoaded()
	local lCamShape = Game:GetEntity("mainCameraPosition");
  local lMainCamera = Game:GetCamera();
  lMainCamera:SetUseEulerAngles(true);
  lMainCamera:SetPosition(lCamShape:GetPosition());
  lMainCamera:SetOrientation(lCamShape:GetOrientation());
  if (G.mainMovie == nil) then
	  G.mainMovie = Scaleform:LoadMovie("Flash/MainMenu.gfx", 0, 0);
    if (Application:GetPlatformName() == "WIN32DX9") then
      GUI:LoadResourceFile("GUI/MenuSystem.xml");
      GUI:SetCursorVisible(true);
      Scaleform:SetAbsoluteCursorPositioning(true);
    end
  end
  G.mainMovie:Invoke("_root.OpenHUD");
end


function OnBeforeSceneUnloaded()
  if (Application:IsInEditor()) then
    GUI:SetCursorVisible(false);
    G.mainMovie = nil;
	  Scaleform:UnloadAllMovies();
  end	
end


function OnUpdateSceneBegin()
	if (Input:IsKeyPressed(Vision.KEY_A)) then
    Debug:PrintLine("Open main menu");
    Application:LoadScene("Scenes/Menu/mainMenu.vscene");
  end
end
