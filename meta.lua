local _run = require("runtime")
function output()
repeat
repeat
_run.testSTR('{')
if not _switch then break   end
repeat
repeat
repeat
_run.testSTR('$')
if not _switch then break   end
io.write('io.write(_input)')
io.write("\n")
until true
if _switch then break end
repeat
local _input = _run.parseSTR()
if not _switch then break   end
io.write('io.write(')
io.write(_input)
io.write(')')
io.write("\n")
until true
until true
until not _switch
_switch = true
if not _switch then error() end
_run.testSTR('}')
if not _switch then error() end
io.write('io.write("\\n")')
io.write("\n")
until true
until true
end
function primary()
repeat
repeat
local _input = _run.parseID()
if not _switch then break   end
io.write(_input)
io.write('()')
io.write("\n")
until true
if _switch then break end
repeat
local _input = _run.parseSTR()
if not _switch then break   end
io.write('_run.testSTR(')
io.write(_input)
io.write(')')
io.write("\n")
until true
if _switch then break end
repeat
_run.testSTR('.id')
if not _switch then break   end
io.write('local _input = _run.parseID()')
io.write("\n")
until true
if _switch then break end
repeat
_run.testSTR('.number')
if not _switch then break   end
io.write('local _input = _run.parseNUM()')
io.write("\n")
until true
if _switch then break end
repeat
_run.testSTR('.string')
if not _switch then break   end
io.write('local _input = _run.parseSTR()')
io.write("\n")
until true
if _switch then break end
repeat
_run.testSTR('.empty')
if not _switch then break   end
io.write('_switch = true')
io.write("\n")
until true
if _switch then break end
repeat
_run.testSTR('(')
if not _switch then break   end
choice()
if not _switch then error() end
_run.testSTR(')')
if not _switch then error() end
until true
if _switch then break end
repeat
_run.testSTR('*')
if not _switch then break   end
io.write('repeat')
io.write("\n")
primary()
if not _switch then error() end
io.write('until not _switch')
io.write("\n")
io.write('_switch = true')
io.write("\n")
until true
until true
end
function sequence()
repeat
repeat
io.write('repeat')
io.write("\n")
repeat
repeat
primary()
if not _switch then break   end
io.write('if not _switch then break   end')
io.write("\n")
until true
if _switch then break end
repeat
output()
if not _switch then break   end
until true
until true
if not _switch then error() end
repeat
repeat
repeat
primary()
if not _switch then break   end
io.write('if not _switch then error() end')
io.write("\n")
until true
if _switch then break end
repeat
output()
if not _switch then break   end
until true
until true
until not _switch
_switch = true
if not _switch then error() end
io.write('until true')
io.write("\n")
until true
until true
end
function choice()
repeat
repeat
io.write('repeat')
io.write("\n")
sequence()
if not _switch then error() end
repeat
repeat
repeat
_run.testSTR('|')
if not _switch then break   end
io.write('if _switch then break end')
io.write("\n")
sequence()
if not _switch then error() end
until true
until true
until not _switch
_switch = true
if not _switch then error() end
io.write('until true')
io.write("\n")
until true
until true
end
function rule()
repeat
repeat
local _input = _run.parseID()
if not _switch then break   end
io.write('function ')
io.write(_input)
io.write('()')
io.write("\n")
_run.testSTR('=')
if not _switch then error() end
choice()
if not _switch then error() end
_run.testSTR(';')
if not _switch then error() end
io.write('end')
io.write("\n")
until true
until true
end
function program()
repeat
repeat
_run.testSTR('.syntax')
if not _switch then break   end
local _input = _run.parseID()
if not _switch then error() end
io.write('local _run = require("runtime")')
io.write("\n")
repeat
rule()
until not _switch
_switch = true
if not _switch then error() end
_run.testSTR('.end')
if not _switch then error() end
io.write(_input)
io.write('()')
io.write("\n")
until true
until true
end
program()
