# printTable.lua
 This is a publication of my simple lua printTable function witch is usefull for debuging or displaying lua tables.

## usage
 either copy the function from printTable.lua to your own script or import it.
 you won't have to set the indent thats for interal use as it will create the string of keys while it goes down the path. 
 you could however include the table name for easier reference. 
 
```lua
  printTable = require "printTable"
  
  printTable(table)
```

## output
 the key will be printed followed by a "->" then the value type and the value.
 `[key1][key2] -> 		BOOLEAN == true`
 
## value types
 there are currently 4 types supported
  - *table:*    this will just recal itself until it hits a value
  - *value:*    this will print out any string or number held in the table at the current key
  - *boolean:*  this will print out the state of the boolean (true / false)
  - *type:*      if the value type was not one of the above this will print what the type of this value is

## todo:
  - replace print with io.write
  - fix strange indenting when key is bigger than tab
  - make the internal function call independent of the name
