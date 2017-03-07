## 用户设置
```json
"editor.tabSize": 2,
    "editor.fontSize": 18,
    "editor.lineHeight": 24,
    "editor.fontFamily": "'Segoe Print'",
    "http.proxy": "http://127.0.0.1:8118",
//    自动更新插件
    "extensions.autoUpdate": true,
    // 配置语言的文件关联(如: "*.extension": "html")。这些关联的优先级高于已安装语言的默认关联。
    "files.associations": {
        "*.vue": "html"
    },
    "eslint.autoFixOnSave": true,
    "eslint.options": {
        "extensions":[
            ".js",
            ".vue"
        ]
    },
    "eslint.validate": [
      "javascript",
      "javascriptreact",
      "vue",
      "vue-html"
    ],
    "search.exclude": {
      "**/node_modules": true,
      "**/bower_components": true,
      "**/dist": true
    },
    "emmet.syntaxProfiles": {
        "javascript": "jsx",
        "vue": "html",
        "vue-html": "html"
    },
    "workbench.colorTheme": "Atom One Dark",
    "workbench.iconTheme": "simple-icons",
    "vsicons.projectDetection.autoReload": true
```

## 快捷建设置
```json
{
    "key": "ctrl+d",
    "command": "editor.action.deleteLines",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "ctrl+shift+/",
    "command": "editor.action.blockComment",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "alt+shift+down",
    "command": "editor.action.copyLinesDownAction",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "alt+q",
    "command": "editor.action.addSelectionToNextFindMatch",
    "when": "editorFocus"
  }
```

## 代码片段
-  vue
```json
"Create vue template": {
    "prefix": "vuec",
    "body": [
        "<template>",
        "</template>",
        "<script>",
        "export default {",
        "  name: \"${1:component_name}\",",
        "  data () {",
        "    return {",
        "    };",
        "  }",
        "}",
        "</script>",
        "<style lang=\"${2:css}\" scoped>",
        "</style>"
    ],
    "description": "Create vue template"
}
```

## 常用插件
+ auto close Tag: 自动闭合
+ Auto Import ：（重要）自动引入模块
+ auto rename tag:
+ beautify : 代码格式化工具
+ Can I Use：那些 css 支持 那个浏览器
+ Color Picher: 颜色显示
+ Document This： 注释小助手 
+ ESLint： js代码检测
+ Git History: 查看历史
+ HTML CSS Snippets： 不需要输入< 就能有html标签提示
+ HTML CSS Class Cpmpletion：class 提示
+ JavaScript (ES6) code snippets：ES6 支持
+ language-stylus: css stylus 的支持
+ Lodsh：js 函数提示支持
+ OutPut Colorizer: 输出颜色显示
+ Path Intellisense：路径提示
+ Preview on Web Server
+ Vue2 Snippets: Vue 2 提示
+ Vue Helper: Vue