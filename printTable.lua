local function printTable(t,indent)
  if indent == nil then indent = "" end
  for key,value in pairs(t) do
    if type(value) == "table" then
      local indent2 = indent.."["..key.."]"
      local function printTableFunc1(t,indent)
        if indent == nil then indent = "" end
        for key,value in pairs(t) do
          if type(value) == "table" then
            local indent2 = indent.."["..key.."]"
            currentFunction = debug.getinfo(1,'n').name
            return value,indent2,currentFunction
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
      local function printTableFunc2(t,indent)
        if indent == nil then indent = "" end
        for key,value in pairs(t) do
          if type(value) == "table" then
            local indent2 = indent.."["..key.."]"
            currentFunction = debug.getinfo(1,'n').name
            return value,indent2,currentFunction
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
      local function callLocal(value,indent2,currentFunction) 
        local currentValue,currentIndent = "",""
        if currentFunction == false then
          currentValue,currentIndent,currentFunction = printTableFunc1(value,indent2)
          callLocal(currentValue,currentIndent,currentFunction)
        elseif currentFunction == "printTableFunc1" then
          currentValue,currentIndent,currentFunction = printTableFunc2(value,indent2)
          callLocal(currentValue,currentIndent,currentFunction)
        elseif currentFunction == "printTableFunc2" then
          currentValue,currentIndent,currentFunction = printTableFunc1(value,indent2)
          callLocal(currentValue,currentIndent,currentFunction)
        end
      end
      callLocal(value,indent2,false)
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
