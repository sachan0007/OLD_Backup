Install below plugins

Maven integration plugin
Checkstyle Plug-in
FindBugs Plug-in
Static Analysis Collector Plug-in
Cobertura Plugin



Install below softwares under Global tool configuration

Maven | Maven 3.5.2
Java | You need Oracle account for same | JDK 8u162
Git



Create a jenkins job CodeStability


Create a jenkins job StaticCodeAnalysis as a downstream job of CodeStability & it should not clone the code, it should display the result of findbug & checkstyle.


Create a Jenkins job CodeCoverage  as a downstream job of CodeStability & it should not clone the code, it should display the result of CodeCoverage.  
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------  
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------  
