-- new script file

function OnAfterSceneLoaded(self)

self.defaultGenRate = 5.0f;
self.defaultNbSpawnPerRate = 1.0f;
self.defaultSpawnPos = { Game:GetEntity("EnemySpawn1"):GetPosition(),
                         Game:GetEntity("EnemySpawn2"):GetPosition(),
                         Game:GetEntity("EnemySpawn3"):GetPosition(),
                         Game:GetEntity("EnemySpawn4"):GetPosition(),
                         Game:GetEntity("EnemySpawn5"):GetPosition(),
                         Game:GetEntity("EnemySpawn6"):GetPosition(),
                         Game:GetEntity("EnemySpawn7"):GetPosition(),
                         Game:GetEntity("EnemySpawn8"):GetPosition(),
                         Game:GetEntity("EnemySpawn9"):GetPosition(),
                         Game:GetEntity("EnemySpawn10"):GetPosition() };


self.currentGenRate = self.defaultGenRate;

end



function OnThink(self)

generateEnemy(self);

end



function generateEnemy(self)

self.currentGenRate = self.currentGenRate - Timer:GetTimeDiff();

if (self.currentGenRate <= 0.0f) then
  
  local i = 0.0f;

  while i < self.defaultNbSpawnPerRate do
  
    Game:InstantiatePrefab(self.defaultSpawnPos[math.random(0, 10)], "Prefabs/Ennemy.vprefab", nil);
    i = i + 1;
    
  end
  
  self.currentGenRate = self.defaultGenRate;

end

end
