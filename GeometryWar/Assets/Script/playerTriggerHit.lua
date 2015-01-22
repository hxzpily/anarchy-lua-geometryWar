-- new script file
function OnObjectEnter(self, object)

--Debug:PrintLine("Hit");
if (object.ennemy == true) then
  Debug:PrintLine("je suis un ennemy");
  object:Remove();
end

end
