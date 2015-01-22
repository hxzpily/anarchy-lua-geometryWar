-- new script file
function OnObjectEnter(self, object)

--Debug:PrintLine("Hit");
if (object.bullet == true) then
  Debug:PrintLine("je suis une bullet");
  self:GetParent():Remove();
  object:Remove();
end

end
