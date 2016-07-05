local function printTable(t,indent)
  if indent == nil then indent = "" end
  for key,value in pairs(t) do
    if type(value) == "table" then
      local indent2 = indent.."["..key.."]"
      printTable(value,indent2)
    elseif type(value) == "string" or type(value) == "number" then
      local prefix = ""
      prefix = indent
      print(prefix.."["..key.."]".." -> ","","VALUE == "..value)
    elseif type(value) == "boolean" then
      local prefix = ""
      prefix = indent
      print(prefix.."["..key.."]".." -> ","","BOOLEAN == "..tostring(value))
    else
      local value = type(value)
      local prefix = ""
      if indent ~= nil then prefix = indent end
      print(prefix.."["..key.."]".." -> ","","TYPE == "..value)
    end
  end 
end

return printTable
