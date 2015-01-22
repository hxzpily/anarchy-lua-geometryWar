-- new script file

function OnAfterSceneLoaded(self)

self.movementSpeed = 100.0f;
self.orientationSpeed = 200.0f;
self.defaultFireRate = 0.2f;
self.bulletDefaultPos = Game:GetEntity("bulletDefaultPos");
self.defaultLife = 5.0f;

self.minEdgeX = Game:GetEntity("collBottom"):GetPosition().x;
self.maxEdgeX = Game:GetEntity("collTop"):GetPosition().x;
self.minEdgeY = Game:GetEntity("collLeft"):GetPosition().y;
self.maxEdgeY = Game:GetEntity("collRight"):GetPosition().y;

self.currentLife = self.defaultLife;
self.fireRate = self.defaultFireRate;

end


function OnThink(self)

moveCharacter(self);
orientCharacter(self);
fire(self);
Debug:PrintLine(tostring(self.currentLife));

end


function moveCharacter(self)

-- Move the player to his dir
if (Input:IsKeyPressed(Vision.KEY_Z)) then
  self:IncPosition(self:GetObjDir_Right() * self.movementSpeed * Timer:GetTimeDiff());
end
if (Input:IsKeyPressed(Vision.KEY_S)) then
  self:IncPosition(-self:GetObjDir_Right() * self.movementSpeed * Timer:GetTimeDiff());
end

-- check that the player is not out of bounds (X axis)
if (self:GetPosition().x > self.maxEdgeX) then
  self:SetPosition(self.maxEdgeX, self:GetPosition().y, self:GetPosition().z);
elseif (self:GetPosition().x < self.minEdgeX) then
  self:SetPosition(self.minEdgeX, self:GetPosition().y, self:GetPosition().z);
end

-- check that the player is not out of bounds (Y axis)
if (self:GetPosition().y > self.maxEdgeY) then
  self:SetPosition(self:GetPosition().x, self.maxEdgeY, self:GetPosition().z);
elseif (self:GetPosition().y < self.minEdgeY) then
  self:SetPosition(self:GetPosition().x, self.minEdgeY, self:GetPosition().z);
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
