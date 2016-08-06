local function printTable(t,indent)

      local function printTableFunc(t,indent)
        if indent == nil then indent = "" end
        local returnTable = {}
        for key,value in pairs(t) do
          if type(value) == "table" then
            local indent2 = indent.."["..key.."]"
            table.insert(returnTable,{["value"]=value,["indent"]=indent2})
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
        return returnTable
      end
      
      local function callLocal(value,indent2)
        if value ~= nil then
          if type(value) == "table" then
            local currentValue,currentIndent = "",""
            returnedTable = printTableFunc(value,indent2)
            if returnedTable ~= nil then
              for key,t in pairs(returnedTable) do
                callLocal(t.value,t.indent)
              end
            end
          elseif type(value) == "string" or type(value) == "number" then
            local prefix = ""
            prefix = indent
            print(prefix.." -> ","","VALUE == "..value)
          elseif type(value) == "boolean" then
            local prefix = ""
            prefix = indent
            print(prefix.." -> ","","BOOLEAN == "..tostring(value))
          else
            local value = type(value)
            local prefix = ""
            if indent ~= nil then prefix = indent end
            print(prefix.." -> ","","TYPE == "..value)
          end 
        end
      end
      
      callLocal(t,indent)
end

return printTable
