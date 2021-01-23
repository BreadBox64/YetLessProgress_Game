# External API
## Units
Unit data is stored in a folder called 'unitData' which contains a JSON file for each unit set. The naming scheme is as follows: ```[ModName]-Period[X]``` Where X is the period of the unit set as a 1-base index. For example: ```BreadBox-Period1``` is the unit data for the vanilla game within the first game period. Each JSON file should have the following syntax:
```JSON

```
Here is an example from the vanilla code:
```JSON
[
  {
    "name" : "Swordsman",
    "cost" : 10,
    "time" : 1,
    "speed" : 5,
    "defense" : 10,
    "stockpile" : 30,
    "upgrades" : [
      "Archer",
      "Spearman",
      "Scout"
    ],
    "attacks" : [
      {
        "name" : ""
      },
      {
        
      }
    ]
    "actions" : [
      "BreadBox:Hunt",
      "BreadBox:Fortify",
      "BreadBox:DoubleTime"
    ]
  },
  
  {
    "name" : "Calvary",
    "cost" : 20,
    "time" : 2,
    "speed" : 10,
    "defense" 5,
    "stockpile" : 10,
    "upgrades" : [
      "Archer Calvary",
      "Messenger"
    ],
    "actions" : [
      "BreadBox:Hunt",
      "BreadBox:Dash"
    ]
  }
]
```

## Regions

## Nations

## Adding New Features
#### General Doc

#### Local Fork
#### Pull Request