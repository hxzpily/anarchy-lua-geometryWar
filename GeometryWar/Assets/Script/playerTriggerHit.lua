-- new script file
function OnObjectEnter(self, object)

--Debug:PrintLine("Hit");
if (object.ennemy == true) then
  Debug:PrintLine("je suis un ennemy");
  self:GetParent().currentLife = self:GetParent().currentLife - 1.0f;
  object:Remove();
end

end
