# React

## Simple Command

- `npx create-react-app my-app` create project by
- or
- `sudo npm install -g create-react-app <app_name>`
- `npm start` start project by
- `npm install <module name> --save` install module
- `npm run build` first build you project

## Note

props:
    passing data from parent to child and child to parent we use props. send data to child assing value into self variable into compontnt calling time, get data from child use handelar function.
context:
    passing data from parent to nested chill and nested child to parent we use context.
axios:
    We use axios to use API.
react-redux:
    passing data from one component to other componet is complex and very annoying. To handel data gobaly over component we user redux. In redux we have to use <action> and <reducer>.
redux-thunk:
    In redux we have to assign an object. but API colling take time to return object. Instated of object axios return a function. But redux does not support function assinign. This type of problem we solved by redux-thunk. by dispatch an function.
Link:
    in html we use anchor tag to navigate a specific page. but anchor tag fully reload current page. This anchor tag make non single page application. To make non reload page we use <Link> tag to navigat a page.
History:
    <BrowserRouter> use history object by default. we can navigate othre page by change history object value. but BrowserRouter History object some proble, Like every time sand into <action>. Thats why Insted of <BrowserRouter> we use <Router> and use user define <History>.

## Problem & Solution

1. Problem
    npm ERR! Linux 5.0.0-37-generic:
**Solution**
    Install letest or expected nodejs version

2. Problem
    Error: Cannot find module '../scripts/start':
**Solution**
    delete node_module and run "npm install"
