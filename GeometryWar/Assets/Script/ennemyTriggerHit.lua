-- new script file

-- Called when a bullet collide with an enemy
function OnObjectEnter(self, object)

if (object.bullet == true) then

  -- Get the base player and the base ennemy
  local lPlayer = Game:GetEntity("Character");
  local lEnnemy = self:GetParent();
  
  -- Add ennemy gain to player score
  lPlayer.currentScore = lPlayer.currentScore + lEnnemy.defaultGain; 
  
  -- Delete the ennemy and the bullet
  lEnnemy:Remove();
  object:Remove();
  
end

end
