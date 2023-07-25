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
      "--ignore=E203,E501,W503"
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
  "python.pythonPath": "/bin/python",
  "[python]": {
      "editor.defaultFormatter": "ms-python.black-formatter"
  }
}
```

### Common Extensions

Create file inside projects **.vscode/extensions.json**. Open EXTENSIONS and write **@recommended**

```json
{
    "recommendations": [
        // Common Tools
        "esbenp.prettier-vscode",
        "eamodio.gitlens",
        "redhat.vscode-yaml",
        "yzhang.markdown-all-in-one",
        "coenraads.bracket-pair-colorizer",
        "zhuangtongfa.material-theme",
        "visualstudioexptteam.vscodeintellicode",
        "VisualStudioExptTeam.intellicode-api-usage-examples",
        "streetsidesoftware.code-spell-checker",
        // Python Support
        "ms-python.python",
        "ms-python.vscode-pylance",
        "magicstack.magicpython",
        // Django Support
        "batisteo.vscode-django",
        "wholroyd.jinja",
        // Node Support
        "wix.vscode-import-cost",
        "tombonnike.vscode-status-bar-format-toggle",
        "xabikos.javascriptsnippets",
        "dbaeumer.vscode-eslint",
        "eg2.vscode-npm-script",
        "formulahendry.auto-close-tag",
        "christian-kohler.npm-intellisense",
        "formulahendry.auto-rename-tag",
        // Vue Support
        "ishiyama.vue-autoimport",
        "octref.vetur",
        "sdras.vue-vscode-snippets",
        // Typescript Support
        "rbbit.typescript-hero",
        "stringham.move-ts",
        "pmneo.tsimporter",
        // Docker Support
        "ms-azuretools.vscode-docker",
        "ms-vscode-remote.remote-containers"
    ]
}
```
