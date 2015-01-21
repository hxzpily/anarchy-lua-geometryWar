-- new script file
function OnAfterSceneLoaded(self)

self.movementSpeed = 100.0f;
self.orientationSpeed = 100.0f;
self.fireRate = 10.0f;

end

function OnThink(self)

moveCharacter(self);
orientCharacter(self);

end

function moveCharacter(self)

if (Input:IsKeyPressed(Vision.KEY_Z)) then
  self:IncPosition(self:GetObjDir_Right() * self.movementSpeed * Timer:GetTimeDiff());
end
if (Input:IsKeyPressed(Vision.KEY_S)) then
  self:IncPosition(-self:GetObjDir_Right() * self.movementSpeed * Timer:GetTimeDiff());
end

end


function orientCharacter(self)

if (Input:IsKeyPressed(Vision.KEY_D)) then
  self:IncOrientation(-self.orientationSpeed * Timer:GetTimeDiff(), 0.0f, 0.0f);
end
if (Input:IsKeyPressed(Vision.KEY_Q)) then
  self:IncOrientation(self.orientationSpeed * Timer:GetTimeDiff(), 0.0f, 0.0f);
end

end
