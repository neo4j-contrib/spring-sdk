${sdk.fullname} ${spring-data-neo4j.version}
========================================

Welcome to ${sdk.fullname} release ${spring-data-neo4j.version}, the best NOSQL database
for Spring Enterprise developers. This distribution of ${sdk.fullname} includes the 
complete ${server.fullname} ${neo4j.version} server plus everything you need to start building Spring 
applications that can model, persist and explore complex, highly-connected data.

In the box
----------

${server.fullname} runs as a server application, exposing a Web-based management
interface and RESTful endpoints for data access, along with logging and JMX.

Here in the installation directory, you'll find:

* bin - scripts and other executables
* conf - server configuration
* data - database, log, and other variable files
* doc - more light reading
* lib - core libraries
* plugins - user extensions (think: stored procedures)
* system - super-secret server stuff

Make it go
----------

To get started with ${server.fullname}, let's start the server and take a
look at the web interface...

1. open a console and navigate to the install directory
2. start the server
   * Windows: use `bin\Neo4j.bat`
   * Linux/Mac: use `bin/neo4j start`
3. in a browser, open [webadmin](http://localhost:${org.neo4j.webserver.port}/webadmin/)
4. from any REST client or browser, open (http://localhost:${org.neo4j.webserver.port}/db/data) 
   in order to get a REST starting point, e.g.
   `curl -v http://localhost:${org.neo4j.webserver.port}/db/data`
5. shutdown the server
   * Windows: type Ctrl-C to terminate the batch script
   * Linux/Mac: use `bin/neo4j stop`

Learn more
----------

There is a humble user guide available in the `doc` directory, a collection of 
short operational and informational articles. 

Out on the internets, you'll find:

* [${neo4j-home.url.title}](${neo4j-home.url})
* [${neo4j-docs.url.title}](${neo4j-docs.url})
* [${getting-started.url.title}](${getting-started.url})
* [${neo4j-wiki.url.title}](${neo4j-wiki.url})
* [${neo4j-components.url.title}](${neo4j-components.url})

For more links, a handy [guide post](doc/guide-post.html) in the `doc` 
directory will point you in the right direction.

License(s)
----------
Various licenses apply. Please refer to the LICENSE and NOTICE files for more
detailed information.



