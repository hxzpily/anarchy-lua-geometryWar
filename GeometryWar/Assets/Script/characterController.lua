-- new script file
function OnAfterSceneLoaded(self)

self.movementSpeed = 100.0f;
self.orientationSpeed = 200.0f;
self.defaultFireRate = 0.2f;
self.fireRate = self.defaultFireRate;
self.bulletDefaultPos = Game:GetEntity("bulletDefaultPos");

end

function OnThink(self)

moveCharacter(self);
orientCharacter(self);
fire(self);

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

function fire(self)

self.fireRate = self.fireRate - Timer:GetTimeDiff();
if (self.fireRate <= 0.0f and Input:IsKeyPressed(Vision.KEY_SPACE)) then
  Game:InstantiatePrefab(self.bulletDefaultPos:GetPosition(), "Prefabs/bullet.vprefab", nil);
  self.fireRate = self.defaultFireRate;
end

end
