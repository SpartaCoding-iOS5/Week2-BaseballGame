# ⚾ NumberBaseball  
The NumberBaseball project is a simple number-guessing game developed as a Command Line Tool.

## 🗒️ Overview  
The NumberBaseball project is a number-guessing game implemented as a Command Line Tool.  
Players attempt to guess a secret number, with the game providing feedback through "strikes" (correct digits in the correct position) and "balls" (correct digits in the wrong position).  
The objective is to guess the correct number within a set number of tries.  
The project emphasizes clean code structure by separating core functionalities, such as validation and judgment logic, into different files.

## 📅 Project Scope  
| Developer   |  Links                          | Project Timeline      |  
| --------    | --------------------------------- | ---------------------- |  
| DoyleHWorks | [GitHub](https://github.com/DoyleHWorks) <br> [Velog](https://velog.io/@doylehworks/posts?tag=ProjectNumberBaseball)  | 2024-10-04 <br> ~ 2024-10-08 |  

## 🛠️ Tech Stack  
- **Programming Language:** Swift 5  
- **Development Environment:** Xcode 16.1  
- **Version Control:** Git, GitHub  
- **Testing:** Manual testing through Command Line Interface (CLI)  

## 📂 Folder Organization  
```
NumberBaseball/  
├── Core/  
│   ├── GameJudge  
│   ├── GameManager  
│   ├── Player  
│   └── TargetNumberGenerator  
├── Data/  
│   └── ValidTargetNumbers  
├── InterruptiblePrompts/  
│   ├── ExitPrompt  
│   ├── HelpPrompt  
│   ├── QuitGamePrompt
│   └── ShowRecordsPrompt
├── Protocols/  
│   └── InterruptiblePrompt  
└── main  
```

## 🖥️ Core Workflow Diagram  
![image](https://github.com/user-attachments/assets/5c5fc8ac-6df9-48ad-8d67-c75eb06a38fb)

## 🏗️ **Design and Implementation Insights**  

### 🛠️ Key Features  

#### 🎯 **Random Target Number Generation**  
- **TargetNumberGenerator** struct generates a unique 3-digit number with no duplicate digits.  
- Uses the **array** from `ValidTargetNumbers` to randomly select a valid target number.  
- The target number is selected asynchronously, with a countdown displayed to enhance the user experience.  

#### 💡 **Input Validation and Hint System**  
- Validates input using the **set** from `ValidTargetNumbers` for fast lookup.  
- **GameJudge** provides feedback with **strikes** and **balls** to refine player guesses.

#### 📝 **Attempt Tracking and Game Records**  
- Tracks game data in the **Player** class:  
  - `records`: Stores a history of results, including game outcomes and guesses.
  - `currentGameNumber`: Tracks the current game session number for organizing game records.
  - `didWinTheGame`: Indicates whether the player won the current game.
  - `pitchCount`: Counts the number of attempts made in the current game.
  - `currentTargetNumber`: Stores the secret target number for the current game.
- Results and stats can be displayed using `showRecord()` (for the current game) or `showRecords()` (for all games).

#### 🔄 **Game Flow Management**  
- The main loop offers a CLI menu to start a game, view stats, access help, or exit.  
- **GameManager** ensures smooth transitions during gameplay.  

#### ❓ **Help Command**  
- Displays game rules and valid inputs via **HelpPrompt**.  
- Hints at the **Game Cancel Command** (`quit`) for exiting mid-game.

#### 🚪 **Game Cancel Command**  
- Players can type **quit** during gameplay.  
- This invokes the **QuitGamePrompt** (blue block), prompting (Y/N) confirmation:  
  - "Y": Exits to the main menu.  
  - "N": Returns to the game.  
- Even if the player exits mid-game, **game records are saved** unless no attempts (`pitchCount = 0`) were made.
  
#### 🔚 **Program Exit**  
- In the main menu, selecting **Exit** invokes the **ExitPrompt**.  
  - "Y": Closes the program.  
  - "N": Returns to the main menu.

#### 💾 **Future Feature: Player Database**  
- Planned to extend `Player` class to store data persistently, allowing for detailed performance analysis and leaderboards.
- The initializer includes a setup for storing game records and tracking game progress.  
- A convenience initializer hints at future expansion, allowing for streamlined data handling, such as loading past records or initializing player data for a comprehensive **Player Database**.

### 🤔 Considerations  

#### ⏳ **Asynchronous Target Number Generation**  
- The process of generating the target number is handled **asynchronously** to enhance performance and maintain a smooth user experience.  
- A **background thread** is used for number generation, preventing delays or blocking in the main game loop.  
- During this time, a **countdown animation** is displayed, building anticipation and keeping the player engaged.  
- This approach improves responsiveness and adds a layer of polish to the game’s interface.  

#### 🧮 **ValidTargetNumbers: Array of All Valid Numbers**  
- Since the number of valid target numbers is limited, an **array** is used for scalability.  
- **[Int]** is chosen over **[String]** due to its lighter memory footprint and easier handling in numerical operations.
- Initially planned to manage the data through a **CSV file**, but due to technical challenges, it was **hardcoded**. This approach is a temporary solution, with improvements planned for future iterations.

#### ⏱️ **Time Complexity: ValidTargetNumbers.array vs. ValidTargetNumbers.set**  
- `ValidTargetNumbers.array`: An array containing all valid numbers.  
- `ValidTargetNumbers.set`: A set derived from `ValidTargetNumbers.array`.  
  - Random access: **Array** is O(1), **Set** is O(n).  
  - Membership check (`contains()`): **Array** is O(n), **Set** is O(1).  
- The data structure is selected based on the specific operation's efficiency.  

#### ⚖️ **Time Complexity: GameJudge - Scoring Method**  
- Explored various methods for scoring, including string, array, and mathematical approaches.  
- Ultimately, a **mathematical approach** using integers was chosen for a balance between memory efficiency and complexity.  

#### 🚦 **Effective Exception Handling**  
- Utilized **HelpPrompt** to provide concise, clear responses to invalid inputs.  
- Messages were refined to ensure players can easily understand the provided guidance.  

#### 🎨 **User Experience Enhancements**  
- Added a **countdown** with a slight delay for certain commands to increase engagement.  
- Enabled players to proceed by pressing **Enter** when viewing help or game records.  
- Adjusted message tone based on the context to enhance user friendliness.  

## 📦 How to Install  
1. Clone this repository:  
   ```bash  
   git clone https://github.com/DoyleHWorks/NumberBaseball.git  
   ```  
