# VS Code

### `.vscode/setting.json`

```json
{
  // Python
  "python.linting.pylintEnabled": false,
  "python.linting.flake8Enabled": true,
  "python.linting.enabled": true,
  "python.linting.flake8Args": [
    "--max-line-length=255",
    "--ignore=E402,F403,F405"
  ], // will display error
  "python.formatting.provider": "black",
  "python.formatting.blackArgs": ["--line-length", "90"], // formate with max 90 char
  "python.analysis.typeCheckingMode": "basic",
  // VS Code
  "editor.fontSize": 16,
  "editor.renderWhitespace": "all",
  // VS Code Ligature
  "editor.fontFamily": "'Fira Code'",
  "editor.fontLigatures": "'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'zero', 'onum'",
  "python.pythonPath": "/bin/python"
}
```

### Common Extentions

```json
[
     // Common Tools
    "github.copilot",
    "esbenp.prettier-vscode",
    "eamodio.gitlens",
    "redhat.vscode-yaml",
    "yzhang.markdown-all-in-one",
    "coenraads.bracket-pair-colorizer",
    "zhuangtongfa.material-theme",
    "visualstudioexptteam.vscodeintellicode",

    // Python Support
    "ms-python.python",
    "ms-python.vscode-pylance",
    "magicstack.magicpython",

    // Django Support
    "batisteo.vscode-django",
    "wholroyd.jinja",

    "christian-kohler.npm-intellisense",
    "dbaeumer.vscode-eslint",
    "eg2.vscode-npm-script",
    "formulahendry.auto-close-tag",
    "formulahendry.auto-rename-tag",

    // Vue Support
    "ishiyama.vue-autoimport",
    "octref.vetur",
    "xabikos.javascriptsnippets",
    "sdras.vue-vscode-snippets",
    "tombonnike.vscode-status-bar-format-toggle",

    // Typescript Support
    "rbbit.typescript-hero",
    "stringham.move-ts",
    "pmneo.tsimporter"
]
```
