-- new script file

-- called when the missile leaves the field
function OnObjectEnter(self, object)

if (object.bullet == true) then

  -- Delete the bullet
  object:Remove();
  
end

end
