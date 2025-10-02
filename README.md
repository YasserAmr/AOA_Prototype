# AOA_Prototype QML Project

## Overview
A simple Qt6 / QML user interface replicating the given Figma prototype.
This project is a QML-based UI prototype built with Qt Quick and custom QML components.  
It demonstrates interactive buttons, dynamic image updates, and state transitions with animations.

The main features include:

- Custom buttons with FontAwesome icons (`CustomButton` and `CustomButton2`).
- Interactive image that changes based on button clicks (`CustomImage`).
- Animated state transitions for starting/stopping actions.
- Two-panel layout: Left panel with controls, right panel reserved for content.

## Notes
- Built using Qt 6.9.1, QML, and CMake on Windows 11 (MinGW).
- Replicates the layout, button behavior, and animations from the provided prototype.
- Uses FontAwesome icons for UI elements.

## AI Usage
ChatGPT suggested some parts of the QML animation code

## Planned Changes and Time Estimation

### 1. **Improve Button Animations**
- **Current:** `CustomButton2` triggers a scale animation on `CustomImage` and fades out/in the columns using `opacity`.
- **Proposed:** 
  - Smooth transitions for button icons/text while switching states.  
  - Add `ParallelAnimation` to combine scale + opacity simultaneously for a more polished effect.  
- **Time Estimate:** 1-1.5 hours

### 2. **Add QML Text Animations**
- **Current:** Button text changes instantly when state changes.
- **Proposed:** Animate text appearance using `NumberAnimation` or `Behavior on text` (fade/slide).  
- **Time Estimate:** 1–2 hours

### 3. **Refactor Reusable Components**
- **Current:** Several repetitive `CustomButton` and `Column` setups.
- **Proposed:** Create reusable QML components for columns of buttons and age groups to reduce duplication.  

### 4. **Refactor Button Components**
- **Current:** there is `CustomButton` and `CustomButton2`.
- **Proposed:** could use one CustomButton.  

### 5. **Refactor Button Components**
- **Current:** Icons sizes not accurate.
- **Proposed:** fix icon sizes.  

### 6. **Add Color Animations**
- **Current:** Color animation not applied.
- **Proposed:** Apply color animation.

### 6. **Label should be a separate component in a separate file**
- **Current:** It's implemented in the FirstPage.qml file.
- **Proposed:** Create CustomLable.qml file.
 
v1.1 – Added QML Animations

**Total Estimated Time:** ~6–10 hours  

## Changes in v1.2– Added QML Animations
- Added **Start/Stop button** (`CustomButtonStartStop`) with animated text and background.
- Animated **age group and favourite planet columns** with `opacity` and `AnchorAnimation`.
- Custom images (`CustomImageLeft`/`Right`) now support dynamic icons and colors.
- Refactored button components: removed `CustomButton2` and standardized to `CustomButtonStartStop`.
- Added color animations and smooth theme transitions.
- Label now implemented as a **separate component** (`CustomLable.qml`).

## Planned Changes and Time Estimation

### 1. Add QML Text Animations
- **Current:** Button text changes instantly on state change.
- **Proposed:** Animate text appearance using `NumberAnimation` or `Behavior` (fade/slide).

  ### 2. Add QML Test 


 ### 3. Add C++ back end 


- **Time Estimate:** 1–2 hours
