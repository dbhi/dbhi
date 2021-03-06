- Subcommand `site gen`. Support arguments `doc` and/or `egs`.
  - `doc`: generate markdown docs of the all the commands.
  - `egs`: generate JSON/markdown auxiliary files for section 'Examples' in `doc/site/src/assets/egs/`.
- Add subcommand `install test`, which allows to evaluate which dependencies are installed/available.
- Support optional flag to generate a bash script which is equivalent to a sequence of calls to `dbhi build` and/or `dbhi test`.
- Add subcommand `bug` to 'start a bug report'. E.g. https://github.com/kyoh86/richgo.
- Add subcommand `clean` to remove build and test artifacts.
- Add `--ieee=synopsys -frelaxed` to GHDL args only when required. I.e., provide option in the JSON to set GHDL args.

---

- https://github.com/Digilent/digilent-vivado-scripts
- https://github.com/pkg/errors
- https://github.com/kamilsk/breaker
- http://p.agnihotry.com/post/understanding_the_context_package_in_golang/
- https://github.com/natefinch/pie
