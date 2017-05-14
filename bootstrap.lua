local _run = require("runtime")
function output()
   repeat            -- choice     --
      repeat            -- sequence   --
         _run.testSTR('{')
         if not _switch then break   end
         repeat            -- repetition --
            repeat            -- choice     --
               repeat            -- sequence   --
                  _run.testSTR('$')
                  if not _switch then break   end
                  io.write('io.write(_input)')
                  io.write("\n")
               until true        -- sequence   (end)
               if _switch then break end
               repeat            -- sequence   --
                  local _input = _run.parseSTR()
                  if not _switch then break   end
                  io.write('io.write(')
                  io.write(_input)
                  io.write(')')
                  io.write("\n")
               until true        -- sequence   (end)
            until true        -- choice     (end)
         until not _switch -- repetition (end)
         _switch = true
         if not _switch then error() end
         _run.testSTR('}')
         if not _switch then error() end
         io.write('io.write("\\n")')
         io.write("\n")
      until true        -- sequence   (end)
   until true        -- choice     (end)
end -- (output)
function primary()
   repeat            -- choice     --
      repeat            -- sequence   --
         local _input = _run.parseID()
         if not _switch then break   end
         io.write(_input)
         io.write('()')
         io.write("\n")
      until true        -- sequence   (end)
      if _switch then break end
      repeat            -- sequence   --
         local _input = _run.parseSTR()
         if not _switch then break   end
         io.write('_run.testSTR(')
         io.write(_input)
         io.write(')')
         io.write("\n")
      until true        -- sequence   (end)
      if _switch then break end
      repeat            -- sequence   --
         _run.testSTR('.id')
         if not _switch then break   end
         io.write('local _input = _run.parseID()')
         io.write("\n")
      until true        -- sequence   (end)
      if _switch then break end
      repeat            -- sequence   --
         _run.testSTR('.number')
         if not _switch then break   end
         io.write('local _input = _run.parseNUM()')
         io.write("\n")
      until true        -- sequence   (end)
      if _switch then break end
      repeat            -- sequence   --
         _run.testSTR('.string')
         if not _switch then break   end
         io.write('local _input = _run.parseSTR()')
         io.write("\n")
      until true        -- sequence   (end)
      if _switch then break end
      repeat            -- sequence   --
         _run.testSTR('.empty')
         if not _switch then break   end
         io.write('_switch = true')
         io.write("\n")
      until true        -- sequence   (end)
      if _switch then break end
      repeat            -- sequence   --
         _run.testSTR('(')
         if not _switch then break   end
         choice()
         if not _switch then error() end
         _run.testSTR(')')
         if not _switch then error() end
      until true        -- sequence   (end)
      if _switch then break end
      repeat            -- sequence   --
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
      until true        -- sequence   (end)
   until true        -- choice     (end)
end -- (primary)
function sequence()
   repeat            -- choice     --
      repeat            -- sequence   --
         io.write('repeat')
         io.write("\n")
         repeat            -- choice     --
            repeat            -- sequence   --
               primary()
               if not _switch then break   end
               io.write('if not _switch then break   end')
               io.write("\n")
            until true        -- sequence   (end)
            if _switch then break end
            repeat            -- sequence   --
               output()
               if not _switch then break   end
            until true        -- sequence   (end)
         until true        -- choice     (end)
         if not _switch then error() end
         repeat            -- repetition --
            repeat            -- choice     --
               repeat            -- sequence   --
                  primary()
                  if not _switch then break   end
                  io.write('if not _switch then error() end')
                  io.write("\n")
               until true        -- sequence   (end)
               if _switch then break end
               repeat            -- sequence   --
                  output()
                  if not _switch then break   end
               until true        -- sequence   (end)
            until true        -- choice     (end)
         until not _switch -- repetition (end)
         _switch = true
         if not _switch then error() end
         io.write('until true')
         io.write("\n")
      until true        -- sequence   (end)
   until true        -- choice     (end)
end -- (sequence)
function choice()
   repeat            -- choice     --
      repeat            -- sequence   --
         io.write('repeat')
         io.write("\n")
         sequence()
         if not _switch then error() end
         repeat            -- repetition --
            repeat            -- choice     --
               repeat            -- sequence   --
                  _run.testSTR('|')
                  if not _switch then break   end
                  io.write('if _switch then break end')
                  io.write("\n")
                  sequence()
                  if not _switch then error() end
               until true        -- sequence   (end)
            until true        -- choice     (end)
         until not _switch -- repetition (end)
         _switch = true
         if not _switch then error() end
         io.write('until true')
         io.write("\n")
      until true        -- sequence   (end)
   until true        -- choice     (end)
end -- (choice)
function rule()
   repeat            -- choice     --
      repeat            -- sequence   --
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
      until true        -- sequence   (end)
   until true        -- choice     (end)
end -- (rule)
function program()
   repeat            -- choice     --
      repeat            -- sequence   --
         _run.testSTR('.syntax')
         if not _switch then break   end
         local _input = _run.parseID()
         if not _switch then error() end
         io.write('local _run = require("runtime")')
         io.write("\n")
         repeat            -- repetition --
            rule()
         until not _switch -- repetition (end)
         _switch = true
         if not _switch then error() end
         _run.testSTR('.end')
         if not _switch then error() end
         io.write(_input)
         io.write('()')
         io.write("\n")
      until true        -- sequence   (end)
   until true        -- choice     (end)
end -- (program)
program()
