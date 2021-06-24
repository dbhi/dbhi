- Add 'title' attribute to the links in the navbar.
- Add 'Edit on GitHub' link to all the pages. Link to both `vue` and `md` sources.
- Allow to export some pages/parts to markdown/pdf.
- Adapt marked to apply custom Bulma CSS classes as a complement to using class 'content': https://marked.js.org/#/USING_PRO.md

# Router

- Support jumping to `/tools/docker`.
- Support jumping to `/tools/install`.

# Persistent

- Remember which example is selected in 'Examples'.
- Remember which use case is selected in 'Use cases'.

# Tools

- Add short/brief description of each tool.
- Better title than 'Third-party tools'.
- Better intro.
- Describe main docker images (`*-latest`, `*-mambo`, `*-dr`, etc.).
- Add reference to `setup_pynq.sh` script.

# Footer

- Select license or remove the corresponding shield.
- 'Commits since' shield won't work until a release is published.

# Flow

- Elaborate web version of the LaTeX/TikZ diagram, split intro multiple 'mutated' smaller diagrams.
- Add the long step-by-step list that was removed from the paper.
- 'Animate' small diagrams to transition from one to another. Display it as slides of a presentation.

# Run

- Allow to zoom in/out.
- Now, `viz.js` is used to render the DOT graphs. However, the project is archived because it is based on compiling the Graphviz source code with [Emscripten](http://kripken.github.io/emscripten-site/), and better alternatives exist (see [mdaines/viz.js](https://github.com/mdaines/viz.js)). It is suggested to use [`dagrejs`](https://github.com/dagrejs) instead. `dagrejs` is a layout library that relies on third-party projects for rendering. Currently `D3`, `JointJS` and `Cytoscape.js` are supported (see [A Note on Rendering](https://github.com/dagrejs/dagre/wiki#a-note-on-rendering)). It would be interesting to replace `viz.js` with `dagrejs` and [`Cytoscape.js`](http://js.cytoscape.org/), since it would allow multiple interactive features such as moving nodes, grouping them in boxes, making collapsible elements, etc. [demo](http://cs.brown.edu/people/jcmace/d3/graph.html?id=small.json) is an example; using JointJS tho. This seems to be a better approach than e.g. [magjac/d3-graphviz](https://github.com/magjac/d3-graphviz).

# Examples

- Add 'interactive' tree-view of the files involved in each examples. Add link to the corresponding subdir in the repo.
  - Add (un)fold all buttons.
  - For each item, show brief description on hover, or in a modal/popup, or in the same line (ragged right).
  - For each item, show icon corresponding to the file type.
- Add description of each example.
- Add results table of each example where each row corresponds to a target device and use case, and each column represents a measurement.
- Add table summarizing all the results.

# Use cases

- Show warning (e.g. change color of 0/0 tag) when not all the rows are being shown. Show a popup on click, showing a message to suggest opening the key.
- Change the cursor when hovering a row, to let the user know that it is clickable.
- Include buttons to select all or to clear all the filters.
- Add references from 'Dependencies' tags to `/tools/<tool>`.
- Generate list of steps automatically from dependencies graphviz diagram.
- Show graphviz diagram. Filter it when a case is selected.
- Add 'eye' symbol to optionally filter all the rows except the selected one. If it is unselected in this mode, disable 'eye' filter automatically.
- Show example script to build the artifacts of the selected case.
  - Script based on calls to `dbhi build` and `dbhi test`.

## Dependencies SVG

- Make it 'interactive'.
  - When hovering an item, reduce the opacity of all the elements which are not in the dependency chain.
  - If click on an item, 'fix' the visible chain.
  - Add 'details' icon to each box/element. Show modal/popup with relevant info: brief description, used tool, inputs, outputs.

- [magjac/d3-graphviz](https://github.com/magjac/d3-graphviz)
  - [d3-graphviz Demo](https://bl.ocks.org/magjac/4acffdb3afbc4f71b448a210b5060bca)

- Since gonum allows to export to [Cytoscape.js](http://js.cytoscape.org/) format, it might be worth trying to build a basic GUI app on top of it. I.e., trigger certain events (show/hide blocks/modals) when the user clicks on a node.

# Doc

- Intro about the features built in the CLI tool:
  - `site` subcommands to generate and serve the site.
  - `build` subcommands to generate artifacts.
  - `test` subcommands to execute the artifacts and measure usage of cpu, mem, etc.
  - `install` subcommand to handle the installation of dependencies.
  - Format of `.dbhi.json`.
  - Format of `project.json`.
- cobra doc of `cli`. See [Generating Markdown Docs For Your Own cobra.Command](https://github.com/spf13/cobra/blob/master/doc/md_docs.md).
- godoc of `cli` (`cli/cmd`, `cli/lib`, `cli/utils`).
- papers
  - https://github.com/eueung/hugo-paper-now

# Similar projects

- https://gitlab.com/reds-public/fss
- https://compas.cs.stonybrook.edu/projects/fpgacloud/vm-hdl-cosim/
- https://github.com/wzab/wzab-hdl-library/tree/master/vzmq
- https://github.com/texane/vpcie
