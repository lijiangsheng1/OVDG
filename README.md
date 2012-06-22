OVDG
====

Open Virtualization Develop Guide,Chinese edition.The Book based DocBook.

More detail, Please read this book's chapter Guide.

## 环境部署：
  Download list file from internet:
  [docbook](https://www.oasis-open.org/docbook/xml/5.0b5/)
  [docbook-xsl](http://docbook.sourceforge.net/docbook-xsl)
  [apache-fop](http://xmlgraphics.apache.org/fop/)

保持上述软件的目录与OVDG是同一目录，并为每个软件保留其名称的软链接。

  执行`xml-format.sh -k xml/ovdg.xml`即可。

如果你觉得自己手动设置太过于麻烦，那么可以使用如下项目构建：
  [docbook-ant-tools](http://code.google.com/p/docbook-ant-tools/)
