local _run = require("runtime")
function expr()
repeat
repeat
exp2()
if not _switch then break   end
repeat
repeat
repeat
_run.testSTR('+')
if not _switch then break   end
exp2()
if not _switch then error() end
io.write('add')
io.write("\n")
until true
if _switch then break end
repeat
_run.testSTR('-')
if not _switch then break   end
exp2()
if not _switch then error() end
io.write('sub')
io.write("\n")
until true
until true
until not _switch
_switch = true
if not _switch then error() end
until true
until true
end
function exp2()
repeat
repeat
exp3()
if not _switch then break   end
repeat
repeat
repeat
_run.testSTR('*')
if not _switch then break   end
exp3()
if not _switch then error() end
io.write('mul')
io.write("\n")
until true
if _switch then break end
repeat
_run.testSTR('/')
if not _switch then break   end
exp3()
if not _switch then error() end
io.write('div')
io.write("\n")
until true
until true
until not _switch
_switch = true
if not _switch then error() end
until true
until true
end
function exp3()
repeat
repeat
local _input = _run.parseNUM()
if not _switch then break   end
io.write('push ')
io.write(_input)
io.write("\n")
until true
if _switch then break end
repeat
_run.testSTR('(')
if not _switch then break   end
expr()
if not _switch then error() end
_run.testSTR(')')
if not _switch then error() end
until true
until true
end
expr()
