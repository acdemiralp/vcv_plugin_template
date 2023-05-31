## VCV Rack Plugin Template
A concise template for creating VCV rack plugins.

### Requirements
- [VCV Rack 2](https://vcvrack.com/Rack#get)
- If Mac: [Homebrew](https://brew.sh)
- If Windows: [MSYS2](https://www.msys2.org)

### Getting Started
- Run `setup.[bat|sh]` in a directory of your choice. This will:
  - Install the necessary packages.
  - Install the Rack SDK in `./sdk`.
  - Create a plugin in `./plugin`.
  - Create a simple module with an input, an output, a light, a parameter, and a custom widget in `./plugin`.

### Building and Installing Your Plugin
- Run `./plugin/build.[bat|sh]`. This will:
  - Build the plugin dependencies.
  - Build the plugin.
  - Create a distributable.
  - Install the distributable to the local user plugins folder.

### Visual Studio Code Utilities
- The `./plugin` folder contains a `.vscode` folder providing:
  - A build task that runs `./plugin/build.bat`.
  - Debug and release launch configurations that run VCV rack with your plugin.
  - An MSYS2 MINGW64 terminal.
- These utilities are currently Windows-only. They further require VCV Rack and MSYS2 to be installed to their default locations. Yet you can easily modify them to your setup as necessary.

### Further Resources
- [VCV Plugin Development Tutorial](https://vcvrack.com/manual/PluginDevelopmentTutorial)
- [VCV Panel Guide](https://vcvrack.com/manual/Panel)
- [VCV Rack API Documentation](https://vcvrack.com/docs-v2)