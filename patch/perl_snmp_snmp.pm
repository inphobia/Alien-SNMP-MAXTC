--- a/perl/SNMP/SNMP.pm 2021-07-11 09:16:39.487065921 +0200
+++ b/perl/SNMP/SNMP.pm 2021-07-11 09:18:13.679383202 +0200
@@ -11,6 +11,7 @@

 use strict;
 use warnings;
+use Alien::SNMP::MIBDEV;

 require Exporter;
 require DynaLoader;
