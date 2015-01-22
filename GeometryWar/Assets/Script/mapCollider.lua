-- new script file
function OnObjectEnter(self, object)

--Debug:PrintLine("Hit");
if (object.bullet == true) then
  object:Remove();
end

end
