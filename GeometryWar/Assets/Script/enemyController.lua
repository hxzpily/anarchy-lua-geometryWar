-- new script file

function OnAfterSceneLoaded(self)
  initPrefab(self);
end


function initPrefab(self)
  self.init = true;
  self.ennemy = true;
  self.defaultMaxEnemyType = 3.0f;
  self.defaultColorType = { Vision.VColorRef(0.0f, 0.0f, 255.0f),
                            Vision.VColorRef(255.0f, 255.0f, 0.0f),
                            Vision.VColorRef(255.0f, 0.0f, 128.0f) };
  self.enemyType = math.random(1, self.defaultMaxEnemyType);
  self:GetChild(0):SetColor(self.defaultColorType[self.enemyType]);
  self.defaultGain = 5.0f * self.enemyType;
  self.defaultLife = self.enemyType;
  self.speed = math.random(30.0f, 50.0f) + self.enemyType * 2.0f;
  self.target = Game:GetEntity("Character");
  -- Hit function definition
  self.hit = nil;
  self.hit = function(damage)
              self.defaultLife = self.defaultLife - damage;
              if (self.defaultLife <= 0.0f) then
                Game:GetEntity("Character").incScore(self.defaultGain);
                self:Remove();
              end
             end
end


function OnThink(self)
  if (self.init == nil) then
    initPrefab(self);
  end
  move(self);
end


function move(self)
  local lDir = self.target:GetPosition() - self:GetPosition();
  lDir:normalize();
  self:SetPosition(self:GetPosition() + lDir * self.speed * Timer:GetTimeDiff());
end
