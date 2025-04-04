To get the layout as an option in the debian keyboard settings, copy the following 
into `/usr/share/X11/xkb/rules/evdev.xml`, one entry below the other swedish svorak layout entries:

```
<variant>
  <configItem>
    <name>svorak_a5</name>
    <description>Swedish (svorak_a5)</description>
  </configItem>
</variant>
```
