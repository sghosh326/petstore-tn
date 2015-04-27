LICENSE:
Copyright 2015 Resilient Networks Systems

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

@author Sandip Ghosh (sandip.ghosh@resilient-networks.com)

DESCRIPTION:
This is a re-creation of the classic Java Blueprints Pet Store application that used to be distributed with the first versions of Java from late 1990s. Just the data from the original application has been imported. The application is built using modern UI libraries, Bootstrap and Font Awesome, so it is a fully responsive app. The app uses MySQL database and is built using Jersey/Jackson/JQuery and JSP tag libraries.

It serves as a reference application to demonstrate the process of converting an application to a policy protected application using Trust Network as a Service (TNaaS), a process we have labeled as "Trust Enabled". Access to the application will require two factor authentication - Password and Phone Authentication against the user table in the petstore database. Operations within the application such as user activation and payment processing will have other policies associated with them.

BUILD INSTRUCTIONS
The project uses maven 2 to build.
Make sure you have maven 2.2 or higher and JDK version 6 or higher.

To build the application WAR and deploy to maven repository execute the command:
mvn clean install

DEPLOY INSTRUCTIONS
Visit: http://developer.resilient-networks.com/tnaas-guide/petstore-tn/
for details instructions of deploying the application and step by step guide to converting it to a TNaaS policy protected application
