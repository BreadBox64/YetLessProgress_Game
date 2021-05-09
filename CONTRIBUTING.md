# Styleguide
## Git Commit Messages
* Use the present tense ("Add feature" not "Added feature")
* Start the commit message with an applicable emoji incased in square brackets:
  * [⚙️] ```:gear:``` when contributing lots of things at once
  * [🎨] ```:art:``` when improving the format/structure of the code
  * [🐎] ```:racehorse:``` when improving performance
  * [📝] ```:memo:``` when writing docs
  * [🐛] ```:bug:``` when fixing a bug
  * [🔥]```:fire:``` when removing code or files
  * [🎛️] ```:control_knobs:``` when adding back-end code.
  * [😐] ```:neutral_face:``` when adding front-end code.
## Processing Style
* Use 2 spaces for indents
* Indent anything which is contained within something else (Even switch statement cases!)
* **Always** have the opening curly bracket (```{```) on the same line as the control statement seperated by one space: ```while(something) { }```
* Brackets (Or parentheses) always are next to the control statement: ```if(thing) doStuff;```
* Only use single line if statements (As seen above) if the only action preformed is a function call, use the ternary operator for variable assignments
* The first letter of each word is uppercase except for the first word in function and variable names (```int wierdNumberCombo;```)
* Only use comments where the purpose of the code needs explanation:
  * (```// Checks network connectivity``` not ```// Sends a request for a text file to the server```)
* Single line comments have one space after the double slash, and multiple line comments have the first line empty (The line with ```//*```)
* See an example below:
```processing
class wow {
  int somethingImportant;
  wow(int input) {
    somethingImportant = input;
  }
  
  void execute() {
    switch(somethingImportant) {
      case 5 :
        doThing();
      break;
      case 3 :
        doOtherThing();
      break;
      default :
        doThirdThing();
      break;
    }
  }
}

wow[] list;

void setup() {
  size(200, 200)
  list = new wow[5];
  for(int i = 0; i < 5; i++) {
    list[i] = new wow(int(random(3, 5)));
  }
}
```
