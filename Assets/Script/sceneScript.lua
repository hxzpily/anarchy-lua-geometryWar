-- new script file

function OnAfterSceneLoaded()
	local lCamShape = Game:GetEntity("mainCameraPosition");
  local lMainCamera = Game:GetCamera();
  lMainCamera:SetUseEulerAngles(true);
  lMainCamera:SetPosition(lCamShape:GetPosition());
  lMainCamera:SetOrientation(lCamShape:GetOrientation());
end
