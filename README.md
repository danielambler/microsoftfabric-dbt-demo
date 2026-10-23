# Microsoft Fabric and DBT Core
- [Microsoft Fabric and DBT Core](#microsoft-fabric-and-dbt-core)
  - [About The Project](#about-the-project)
  - [TLDR;](#tldr)
  - [About Microsoft Fabric](#about-microsoft-fabric)
  - [About DBT](#about-dbt)
  - [Repository structure](#repository-structure)
  - [Getting Started](#getting-started)

## About The Project
This repository hosts a dbt project that can be used as a demo with Microsoft Fabric.

## TLDR; 
The howto to use this project in fabric is [here](/doc/howto-fabric-dbt-core.md)

## About Microsoft Fabric
[Microsoft Fabric](https://www.microsoft.com/en-us/microsoft-fabric) is an AI-powered data analytics platform that unifies data engineering, data science, and business intelligence into a single, integrated experience. It empowers organizations to manage, analyze, and visualize data seamlessly across teams using tools like Power BI, Synapse, and Data Factory.

## About DBT
[dbt (data build tool)](https://www.getdbt.com/) is a modern analytics engineering tool that enables data analysts and engineers to transform raw data into clean, tested, and documented datasets using SQL. It helps teams manage data transformations in a version-controlled, modular, and scalable way, integrating seamlessly with modern data warehouses.

## Repository structure
- Any documentation can be found in the [docs](https://github.com/microsoft/microsoftfabric-dbt-demo/tree/main/docs) folder.

- The dbt project itself is saved in the [src/msfabric_dbt_demo](https://github.com/microsoft/microsoftfabric-dbt folder.-demo/tree/main/src/msfabric_dbt_demo)

- Utility Notebook templates are saved in the [fabric/Notebooks](https://github.com/microsoft/microsoftfabric-dbt-demo/tree/main/fabric/Notebooks) folder.

- Data dictionaries for the sample NYC Taxi datasets are saved in the [data_dictionaries](https://github.com/microsoft/microsoftfabric-dbt-demo/tree/main/data_dictionaries) folder.

## Getting Started
1. Prerequisites

* Currently assumes running on a Linux based Github codespace.
* Knowledge of creating items in Microsoft Fabric.
* Knowledge of running projects with dbt.
* You will need an application regsitration/service principal to run the dbt project.

2. Installation instruction
    - Install [Git](https://git-scm.com/downloads) or [GitHub Desktop](https://desktop.github.com/)

3. Create a local copy
   Download [latest release](https://docs.github.com/en/repositories/releasing-projects-on-github/viewing-your-repositorys-releases-and-tags#viewing-releases), if none available [clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) the repository

 ```
    git clone https://github.com/danielambler/microsoftfabric-dbt-demo.git
 ```

 4. Environment Setup
```
# For pip
> python -m venv .\venv
> venv\Scripts\activate
> pip install -r requirements.txt

# For conda
> conda create --name venv --file requirements.txt
> conda activate
```

* Add the following variables to your environment using your favourite method.  These are used in the **profiles.yml** file.  

|Name|Notes|
|--|--|
|FAB_WH_SQL_SERVER|The connection string for the Warehouse SQL endpoint.|
|FAB_TENANT_ID|The id of the tenant where the Fabric capacity is hosted.|
|FAB_SPN_CLIENT_ID|The client id of your application.|
|FAB_SPN_CLIENT_SECRET|A valid secret for your application.|

5. Install Microsoft ODBC 18 Driver
```
 $ . setup/install_Microsoft_ODBC_18.sh 
```

6. Fabric And Azure Setup
* Register your application in Azure.
* Create a Workspace.
* Grant your service principal **Contributor** access on your workspace.
* Create a Warehouse object named **wh_gold**.
* Copy and run the Notebook /fabric/notebooks/**nb_populate_warehouse** to download some demo data into your warehouse.

7. Validating Setup
* Navigate to the dbt project root

```
$ cd src/msfabric_dbt_demo
```

* To validate your setup, run **dbt debug**

8. Run The Project
* Run **dbt build**.

9. Generate Documentation
* Run **dbt docs generate** to rebuild the documentation.
* Run **dbt docs serve** to view the documentation.