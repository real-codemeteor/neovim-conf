# Neovim Config

## Shortcuts

### Neo Tree

<kbd>Ctrl</kbd>+<kbd>e</kbd> Browse the files of the current project in a floating window

### Telescope

<kbd>Leader</kbd><kbd>t</kbd><kbd>b</kbd> Show a list of all the current open buffers  
<kbd>Leader</kbd><kbd>t</kbd><kbd>g</kbd> Lets you search for text in all the files of your project  
<kbd>Leader</kbd><kbd>t</kbd><kbd>f</kbd> Lets you search for a specefic filename in the files of your project.  
<kbd>Leader</kbd><kbd>t</kbd><kbd>r</kbd> Gives a list of references under the cursor

### Auto completion

<kbd>Ctrl</kbd>+<kbd>e</kbd> Cancel auto complete  
<kbd>Ctrl</kbd>+<kbd>b</kbd> Move down in the docs  
<kbd>Ctrl</kbd>+<kbd>f</kbd> Move up in the docs  
<kbd>Ctrl</kbd>+<kbd>Space</kbd> Open the auto complete menu  
<kbd>Enter</kbd> Accept the selected completion.  

### Unit testing
<kbd>Leader</kbd><kbd>n</kbd><kbd>t</kbd><kbd>f</kbd> Run all tests in the current file  
<kbd>Leader</kbd><kbd>n</kbd><kbd>t</kbd><kbd>w</kbd> Run tests watcher  
<kbd>Leader</kbd><kbd>n</kbd><kbd>t</kbd><kbd>r</kbd> Run the nearest test 
<kbd>Leader</kbd><kbd>n</kbd><kbd>t</kbd><kbd>s</kbd> Toggle test summary  
<kbd>Leader</kbd><kbd>n</kbd><kbd>t</kbd><kbd>o</kbd> Toggle the output of the test runner

### Refactoring

<kbd>Leader</kbd><kbd>r</kbd><kbd>n</kbd> Rename the current word  
<kbd>Leader</kbd><kbd>r</kbd><kbd>r</kbd> Show the refactoring menu   

### Debugging

When debugging python applications, make sure you have debugpy installed in your virtual environment.  
```bash
poetry add --group dev debugpy
```

<kbd>Leader</kbd><kbd>b</kbd> Toggle breakpoint  
<kbd>F5</kbd> Start Debugging  
<kbd>Shift</kbd>+<kbd>F5</kbd> Stop Debugging  
<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>F5</kbd> Restart Debugging  
<kbd>F10</kbd> Step Over  
<kbd>F11</kbd> Step Into  
<kbd>F12</kbd> Step out  

### LSP
<kbd>Leader</kbd><kbd>c</kbd><kbd>a</kbd> Code action
<kbd>Leader</kbd><kbd>g</kbd><kbd>f</kbd> Format the current file
<kbd>Leader</kbd><kbd>g</kbd><kbd>n</kbd> Go to next error/warning
<kbd>Leader</kbd><kbd>g</kbd><kbd>N</kbd> Go to previous error/warning

