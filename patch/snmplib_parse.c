diff -ur a/snmplib/parse.c b/snmplib/parse.c
--- a/snmplib/parse.c	2021-07-11 00:17:21.726271559 +0200
+++ b/snmplib/parse.c	2021-07-11 00:17:27.578291254 +0200
@@ -3638,7 +3638,7 @@
     register int    type;
     char            token[MAXTOKEN];
     char            modbuf[256];
-#define MAX_IMPORTS	256
+#define MAX_IMPORTS	512
     struct module_import import_list[MAX_IMPORTS];
     int             this_module;
     struct module  *mp;
