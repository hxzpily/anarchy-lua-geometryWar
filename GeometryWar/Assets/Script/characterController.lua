-- new script file

function OnAfterSceneLoaded(self)
  initPrefab(self);
end


function OnThink(self)
  if (self.init == nil) then
    initPrefab(self);
  end
  moveCharacter(self);
  orientCharacter(self);
  fire(self);
  updatePlayerGUI(self);
end


function initPrefab(self)
  self.init = true;
  self.movementSpeed = 100.0f;
  self.orientationSpeed = 200.0f;
  self.defaultFireRate = 0.2f;
  self.bulletDefaultPos1 = Game:GetEntity("bulletDefaultPos1");
  self.bulletDefaultPos2 = Game:GetEntity("bulletDefaultPos2");
  self.defaultLife = 5.0f;
  self.minEdgeX = Game:GetEntity("collBottom"):GetPosition().x;
  self.maxEdgeX = Game:GetEntity("collTop"):GetPosition().x;
  self.minEdgeY = Game:GetEntity("collLeft"):GetPosition().y;
  self.maxEdgeY = Game:GetEntity("collRight"):GetPosition().y;
  self.currentLife = self.defaultLife;
  self.fireRate = self.defaultFireRate;
  self.currentScore = 0.0f;
  self.defaultSpawnPos = { };
  self.timeInLive = 0.0f;
  
  getDefaultSpawn(self);
  
  -- Hit member function
  self.hit = nil;
  self.hit = function(damage)
                self.defaultLife = self.defaultLife - damage;
                G.mainMovie:Invoke("_root.SetNumberOfLife", tostring(self.defaultLife));
                if (self.defaultLife <= 0.0f) then
                  die(self);
                end
                self:SetPosition(self.defaultSpawnPos[math.random(0, 4)]);
             end
             
  -- Increment score function
  self.incScore = nil;
  self.incScore = function(points)
                    self.currentScore = self.currentScore + points;
                    updatePlayerGUI(self);
                  end
                  
  G.mainMovie:Invoke("_root.SetNumberOfLife", tostring(self.defaultLife));
end


function getDefaultSpawn(self)
  local i = 0;
  while i < 5 do
    local lName = "PlayerSpawn" .. tostring(i+1);
    self.defaultSpawnPos[i] = Game:GetEntity(lName):GetPosition();
    i = i + 1;
  end
end


function updatePlayerGUI(self)
  self.timeInLive = self.timeInLive + Timer:GetTimeDiff();
  local lSecondes = math.modf(self.timeInLive);
  if (lSecondes >= 60) then
    lSecondes = lSecondes - (60 * math.modf(lSecondes / 60));
  end
  if (lSecondes < 10) then
    lSecondes = "0" .. lSecondes;
  end
  local lMinutes = math.modf(self.timeInLive / 60.0f);
  G.mainMovie:Invoke("_root.SetTime", tostring(lMinutes .. ":" .. lSecondes));
  G.mainMovie:Invoke("_root.SetScore", tostring(self.currentScore + math.modf(self.timeInLive)));
end


function die(self)
  local lScore = self.currentScore + math.modf(self.timeInLive);
  local lBestScore = G.bestScore;
  if (lBestScore == nil) then
    lBestScore = 0;
  else
    lBestScore = tonumber(lBestScore);
  end
  if (lScore > lBestScore) then
    G.bestScore = tostring(lScore);
    fichier = io.open("Score.txt", "w");
    fichier:write(tostring(lScore));
    fichier:close();
  end
  Application:LoadScene("Scenes/Menu/mainMenu.vscene");
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
    Game:InstantiatePrefab(self.bulletDefaultPos1:GetPosition(), "Prefabs/bullet.vprefab", nil);
    Game:InstantiatePrefab(self.bulletDefaultPos2:GetPosition(), "Prefabs/bullet.vprefab", nil);
    self.fireRate = self.defaultFireRate;
  end
end
