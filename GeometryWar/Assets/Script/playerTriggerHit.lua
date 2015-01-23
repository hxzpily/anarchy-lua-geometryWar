-- new script file

-- Called when the ennemy collide with the player
function OnObjectEnter(self, object)
  if (object.ennemy == true) then
    self:GetParent().hit(1);
    object:Remove();
  end
end
