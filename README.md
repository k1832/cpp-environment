# Try Out Development Containers: C++
## Setting up the development container
### VS Code Remote - Containers
Follow these steps to open this sample in a container using the VS Code Remote - Containers extension:

1. If this is your first time using a development container, please ensure your system meets the pre-reqs (i.e. have Docker installed) in the [getting started steps](https://aka.ms/vscode-remote/containers/getting-started).

2. To use this repository, open a locally cloned copy of the code:
   - Clone this repository to your local filesystem.
   - Press <kbd>F1</kbd> and select the **Remote-Containers: Open Folder in Container...** command.
   - Select the cloned copy of this folder, wait for the container to start, and try things out!

## Things to try

Once you have this sample opened, you'll be able to work with it like you would locally.

> **Note:** This container runs as a non-root user with sudo access by default. Comment out `"remoteUser": "vscode"` in `.devcontainer/devcontainer.json` if you'd prefer to run as root.

Some things to try:

1. **Edit:**
   - Open `main.cpp`
   - Try adding some code and check out the language features.
   - Notice that the C++ extension is already installed in the container since the `.devcontainer/devcontainer.json` lists `"ms-vscode.cpptools"` as an extension to install automatically when the container is created.
1. **Terminal:** Press <kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>\`</kbd> and type `uname` and other Linux commands from the terminal window.
1. **Build, Run, and Debug:**
   - Open `main.cpp`
   - Add a breakpoint (e.g. on line 7).
   - Press <kbd>F5</kbd> to launch the app in the container.
   - Once the breakpoint is hit, try hovering over variables, examining locals, and more.

## [atcoder-tools](https://github.com/kyuridenamida/atcoder-tools)
### aliases
- `at`  
-> `atcoder-tools`
### functions
- `at-gen`  
Example: `at-gen abc200`  
This should run following tasks.
   1. Generate contest directory.
   2. Change directory to **abc200**.
   3. Open `main.cpp` for problem A.
- `at-open`  
Example: `at-open abc200`  
This should run following tasks.
   1. Change directory to **abc200**.
   2. Open `main.cpp` for problem A.
- `at-clean`  
Remove all files/directory (other than `.gitignore`) in `atcoder/`.
