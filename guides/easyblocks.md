# Common EasyBlocks

*Easyblocks* are Python modules that specify how to configure and compile the code.

To see the possible parameters of an easyblock:
```bash
eb -a -e NAME
```
For example *NAME* can be: *Bundle*, *ConfigureMake* (default), *CMakeMake*, *EB_Boost*.


## The **Bundle** Easyblock
This easyblock does nothing. It basically just creates a modulefile.

It is very useful if you want to make *meta-modules* which loads dependencies or group together other modules.
