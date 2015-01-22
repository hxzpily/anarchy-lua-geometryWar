-- new script file
function OnObjectEnter(self, object)

--Debug:PrintLine("Hit");
if (object.bullet == true) then
  self:GetParent():Remove();
  object:Remove();
end

end
