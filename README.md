# Astronomy Pictures
  
  
## Requirements
- [Flutter (2.2.3)](https://flutter.dev/docs/get-started/install)
- [Dart 2.13+](https://webdev.dartlang.org/tools/sdk#install)


## Architecture
- [Modular](https://github.com/Flutterando/modular)
- [rxNotifier](https://pub.dev/packages/rx_notifier)


## Workflow
- [Slidy CLI](https://github.com/Flutterando/slidy)

## Structure

    root
    ├── lib
    |   ├── app
    |   |   ├── modules
    |   |   |    └── module ------------------------- (Application module)
    |   |   |           ├── domain ------------------ (Hosts business cases)
    |   |   |           |    ├── entities ----------- (Corporate business cases)
    |   |   |           |    ├── params ------------- (API Parameters)
    |   |   |           |    ├── i_repositories ----- (Repository interfaces)
    |   |   |           |    └── usecases ----------- (Application Business cases)
    |   |   |           ├── external ---------------- (Hosts external access)
    |   |   |           |    ├── datasources -------- (Implementation of datasources)
    |   |   |           |    └── mapper ------------- (Entity serialization)
    |   |   |           ├── infra ------------------- (Domain support layer)
    |   |   |           |    ├── i_datasources ------ (Datasource Interfaces)
    |   |   |           |    └── repositories ------- (Implementation of repositories)
    |   |   |           └── presenter --------------- (I/O layer and application interactions with the user)
    |   |   └── shared ------------------------------
    |   |        ├── components --------------------- 
    |   |        ├── contracts ---------------------- 
    |   |        ├── errors ------------------------- 
    |   |        ├── services -----------------------  
    |   |        └── utils -------------------------- 
    ├── test ---------------------------------------- (Unit tests)
    |   └── app
    |       └── modules
    |            └── module
    |                   ├── domain
    |                   |    └── usecases -----------
    |                   ├── external
    |                   |    └── datasources --------
    |                   └── infra
    |                        └── repositories -------
    ├── README.md
    └── ...------------------------------------------
