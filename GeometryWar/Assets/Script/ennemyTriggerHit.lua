-- new script file

-- Called when a bullet collide with an enemy
function OnObjectEnter(self, object)
  if (object.bullet == true) then
    self:GetParent().hit(object.defaultDamage);
    object:Remove();
  end
end
