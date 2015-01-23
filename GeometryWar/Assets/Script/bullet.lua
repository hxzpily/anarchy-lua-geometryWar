-- new script file

function OnAfterSceneLoaded(self)

self.rigidBody = self:GetComponentOfType("vHavokRigidBody");
self.direction = Game:GetEntity("Character"):GetObjDir_Right();
self.speed = 200.0f;
self.bullet = true;

end

function OnThink(self)

if (self.rigidBody == nil) then
  self.rigidBody = self:GetComponentOfType("vHavokRigidBody");
  self.direction = Game:GetEntity("Character"):GetObjDir_Right();
  self.speed = 200.0f;
  self.bullet = true;
end

self:IncPosition(self.direction * self.speed * Timer:GetTimeDiff());

end
