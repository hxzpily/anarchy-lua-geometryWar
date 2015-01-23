-- new script file

-- Called when the ennemy collide with the player
function OnObjectEnter(self, object)

if (object.ennemy == true) then

  -- Get the base player
  local lParent = self:GetParent();
  
  -- Decreases the player's life
  lParent.currentLife = lParent.currentLife - 1.0f;
  
  -- Remove the ennemy
  object:Remove();
  
end

end
