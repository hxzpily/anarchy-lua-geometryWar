-- new script file

function OnAfterSceneLoaded(self)
  initPrefab(self);
end


function OnThink(self)
  if (self.init == nil) then
    initPrefab(self);
  end
  self:IncPosition(self.direction * self.speed * Timer:GetTimeDiff());
end


function initPrefab(self)
  self.init = true;
  self.rigidBody = self:GetComponentOfType("vHavokRigidBody");
  self.direction = Game:GetEntity("Character"):GetObjDir_Right();
  self.speed = 200.0f;
  self.bullet = true;
  self.defaultDamage = 1.0f;
end
