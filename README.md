# META II implemented in Lua

META II is a domain specific language (DSL) for describing compilers. The META
II compiler takes as input the DSL and outputs a compiler. The META II compiler
can be described in this DSL.

Started from http://loup-vaillant.fr/projects/metacompilers/

## Compiling the DSL
The META II compiler reads the DSL from standard input and writes the compiler (implemented in Lua) to standard output.

For example, to generate the compiler for arithemetic expressions, we can use the following pipeline:

```
cat examples/arithmetic.meta | lua meta.lua > examples/arithmetic.lua
```

Similarly the META II compiler is generated as follows:
```
cat meta.meta | lua meta.lua > meta2.lua
```

We can check that the output of the above (`meta2.lua`) is identical to `meta.lua`


## Description of META II compiler in META II
```
.syntax program

  output   = '{'
             * ( '$'      {'io.write(_input)'}
               | .string  {'io.write(' $  ')'})
             '}'          {'io.write("\\n")' };

  primary  = .id       { $ '()'                         }
           | .string   {'_run.testSTR(' $ ')'           }
           | '.id'     {'local _input = _run.parse("^%a[%a%d]*")' }
           | '.number' {'local _input = _run.parse("^%d+")'}
           | '.string' {'local _input = _run.parseSTR()'}
           | '.empty'  {'_switch = true'                }
           | '(' choice ')'
           | '*'       {'repeat'                        }
             primary   {'until not _switch'             }
                       {'_switch = true'                };

  sequence = {'repeat'    }
               (primary {'if not _switch then break   end'} | output)
             * (primary {'if not _switch then error() end'} | output)
             {'until true'};

  choice   = {'repeat'    }
             sequence * ('|' {'if _switch then break end'} sequence)
             {'until true'};

  rule     = .id {'function ' $ '()'} '=' choice ';' {'end'};

  program  = '.syntax' .id {'local _run = require("runtime")'}
             * rule '.end' {$ '()'                           };

.end
```

## Influenced by META II
### OMeta
Uses Parsing Expression Grammar which allows for limited backtracking and allows predicates to be written in the host language. See http://www.tinlizzie.org/ometa/

### Ohm
Improves OMeta be separates the semantic actions from the parser. See https://github.com/harc/ohm
