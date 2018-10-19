---
typora-root-url: ./
---

# 1、设置code Formatter

​	统一设置成java-google-style

## 1.1 Eclipse 设置Formatter

​	从菜单Windows->Preferences，找到Java->Code Style->Formatter，

![eclipse_java_formatter](/imgs/eclipse_java_formatter.jpg)



选择codetemplates.xml文件即可。

## 1.2 Idea设置Formatter

1、	设置indent为2

![idea_edit_indent_2](/imgs/idea_edit_indent_2.jpg)



2、 从菜单File->Settings中找到Plugins，选择Browse Repositories。搜索Eclipse Code Formatter

![idea_plugin_code_formatter](/imgs/idea_plugin_code_formatter.jpg)



选择安装，重启



3、从Settings中找到Eclipse Code Formatter

![idea_plugin_set_codeformatter](/imgs/idea_plugin_set_codeformatter.jpg)





# 2、设置Code Template

## 2.1 Eclipse设置 template

​	从菜单Windows->Preferences，找到Java->Code Style->Code Template

![eclipse_set_codetemplate](/imgs/eclipse_set_codetemplate.jpg)

选中codetemplates.xml，导入即可



## 2.2  Idea设置template

### 2.2.1 设置环境

将`fileTemplates`和`templates`两个文件夹拷贝到

```
C:\Users\${CurrentUser}\.IntelliJIdea2018.2\config
```

其中`${CurrentUser}`为当前用户名

### 2.2.2  使用

​	Idea中增加的方法注释与eclipse中使用方式不同，使用提示符+快捷键的方式，输入methodcomment，按回车即可，

![idea_method_template_shotcut](/imgs/idea_method_template_shotcut.jpg)



出来的注释需要手动补齐内容，

![idea_set_method_comment_content](/imgs/idea_set_method_comment_content.jpg)







