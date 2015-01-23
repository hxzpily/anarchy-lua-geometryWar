-- new script file

function OnAfterSceneLoaded(self)

self.ennemy = true;
self.defaultGain = 5.0f;
self.speed = math.random(30.0f, 50.0f);

self.target = Game:GetEntity("Character");

end



function OnThink(self)

move(self);

end



function move(self)

local lDir = self.target:GetPosition() - self:GetPosition();
lDir:normalize();
self:SetPosition(self:GetPosition() + lDir * self.speed * Timer:GetTimeDiff());

end
