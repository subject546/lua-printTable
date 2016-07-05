printTable = require "printTable"

t = {
     "this is a string",
     1,2,3,4,5,6,7,8,9,
     true,false,
     ["x"]="this string can be found at 't.x'",
     {  "this is a string",
         1,2,3,4,5,6,7,8,9,
         true,false,
         ["x"]="these values are inside a table inside a table"
     }
    }

printTable(t)
