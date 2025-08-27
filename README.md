


# CDL_MFAC_PMLSM_Simulation

This repository contains the simulation code and schemes for the paper submission related to **Controller-based Dynamic Linearized Model-free Adaptive Control (CDL-MFAC)** applied to **Permanent Magnetic Linear Synchronous Motor (PMLSM)** systems.

The repository is created for the purpose of anonymous peer review.

---

##  Requirements

- MATLAB R2023a or later
- No additional toolboxes are required beyond the standard MATLAB environment.

---


##  Usage

### 1. Clone or download the repository.

Clone this repository to your local machine or download it as a ZIP file.

### 2. Open MATLAB and set the working directory.

In MATLAB, set the working directory to this project folder by navigating to the directory or using the following command in the command window:

```matlab
cd 'path_to_repository'
```

### 3. Run the Simulation Files.

In MATLAB, open and run the following Simulink models. (Ensure that you clean the workspace data before starting the simulation.)

```Simulation
PMLSM_CDL_MFAC_FFDLc.slx
PMLSM_MFAC_FFDL.slx
PMLSM_PID.slx
```

These Simulink models simulate the PMLSM system with different control strategies: CDL-MFAC, MFAC, and PID.

### 4. Save Data in Workspace.

Before generating any results, run the following `.m` file to save the relevant data into the MATLAB workspace:

```MATLAB
save_data.m
```

This file prepares the necessary variables for the simulation.

### 5. Generate Figures.

To generate the simulation result figures (e.g., performance curves, control inputs, and error convergence), run the following MATLAB script:

```MATLAB
calculate_index.m
```

This script will generate the performance metrics and save the corresponding figures to the directory folder.

---

## Simulation Description

* **System**: Permanent Magnetic Linear Synchronous Motor (PMLSM)

* **Control Methods**:

  * **CDL-MFAC**: Controller-based Dynamic Linearized Model-free Adaptive Control
  * **MFAC**: Model-free Adaptive Control
  * **PID**: Proportional-Integral-Derivative Control

* **Outputs**:

  * Speed and current response curves
  * Control inputs
  * Error convergence results

---

## Notes

* This repository is shared **only for the purpose of peer review**.
* The repository will remain **anonymous** during the review phase.

---




