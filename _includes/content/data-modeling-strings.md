| Format mask      | Description                                                  |
|------------------|--------------------------------------------------------------|
| `YYYY` or `yyyy` | four digit year such as `2017`                               |
| `YY` or `yy`     | last two digits of year such as `17`                         |
| `M`              | month with no leading zero `1`-`12`                          |
| `MM`             | Two digit month `01`-`12`                                    |
| `MMM`            | Three letter month such as `Jan`                             |
| `D`              | Day of year without a leading zero `0`-`365`                 |
| `DD`             | Day of year with up to one leading zero `01`-`365`           |
| `DDD`            | Day of year with up to two leading zeroes `001`-`365`        |
| `d`              | Day of month with no leading zero `1`-`31`                   |
| `dd`             | Two digit day of month `01`-`31`                             |
| `HH`             | Two digit `24` hour representation of hour `00`-`23`         |
| `hh`             | Two digit `12` hour representation of hour `01`-`12`         |
| `H`              | 24 hour representation of hour with no leading zero `0`-`23` |
| `h`              | 12 hour representation of hour with no leading zero `1`-`12` |
| `mm`             | Minutes `00`-`59`                                            |
| `m`              | Minutes with no leading zero `0`-`59`                        |
| `ss`             | Seconds `00`-`59`                                            |
| `s`              | Seconds with no leading zero `0`-`59`                        |
| `a`              | AM/PM indicator                                              |

Valid delimiters include most non-alphabet characters. This includes but is not
limited to:

- `\` (forward slash)
- `/` (backward slash)
- `|` (pipe symbol)
- `:` (colon)
- `-` (dash)
- `_` (underscore)
- `=` (equal sign)

Examples of valid format masks you can produce for display are as follows:

- `MM/dd/yyyy`
- `MMM`
- `DD/MM/yyyy`
- `MM/dd/yyyy HH:mm`
- `DD/MM/yyyy HH:mm`
