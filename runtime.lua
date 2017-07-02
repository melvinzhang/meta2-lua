local input = io.read("*all") -- should take place at module call time
local loc   = 1               -- beginning of the input

local function forward(n)          loc = loc + n                   end
local function getchar(String, i)  return string.sub(String, i, i) end

local function skip_whitespace()
   while (string.find(" \t\n\r", getchar(input, loc), 1, true)
       and loc < string.len(input)) do
      forward(1)
   end
end

-- Tries to extract the next token.  If found, returns it and advances past it
local function read(finder)
   skip_whitespace()
   local token = finder() -- extract the token with the finder
   if token
   then
      forward(string.len(token)) -- token fond => advance past it
      _switch = true
   else
      _switch = false
   end
   return token -- returns the token or nil
end

local function match(pattern)
   return function() return string.match(input, pattern, loc) end
end

function test_prefix(String)
   return function()
             local prefix = string.sub(input, loc, loc + string.len(String) - 1)
             return prefix == String and prefix or nil
          end
end

local function testSTR (String) return read(test_prefix(String)) end
local function parseSTR()       return read(match("^'[^']*'")  ) end

local function parse(String)    return read(match(String))       end

local M = {} -- public interface
M.testSTR  = testSTR
M.parseSTR = parseSTR
M.parse    = parse
return M
