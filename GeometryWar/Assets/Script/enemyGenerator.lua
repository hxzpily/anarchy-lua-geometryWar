-- new script file

function OnAfterSceneLoaded(self)
  self.defaultGenRate = 3.0f;
  self.defaultNbSpawnPerRate = 1.0f;
  self.defaultSpawnPos = { };
  getDefaultSpawn(self);
  self.currentGenRate = self.defaultGenRate;
end


function getDefaultSpawn(self)
  local i = 0;
  while i < 10 do
    local lName = "EnemySpawn" .. tostring(i+1);
    self.defaultSpawnPos[i] = Game:GetEntity(lName):GetPosition();
    i = i + 1;
  end
end


function OnThink(self)
  generateEnemy(self);
end


function generateEnemy(self)
  self.currentGenRate = self.currentGenRate - Timer:GetTimeDiff();
  if (self.currentGenRate <= 0.0f) then
    local i = 0.0f;
    while i < self.defaultNbSpawnPerRate do
      Game:InstantiatePrefab(self.defaultSpawnPos[math.random(0, 9)], "Prefabs/Ennemy.vprefab", nil);
      i = i + 1.0f;
    end
    self.currentGenRate = self.defaultGenRate;
  end
end
