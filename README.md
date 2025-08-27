# CDL_MFAC_PMSM_Simulation
This repository provides the simulation codes and schemes for the paper submission related to **Controller-based Dynamic Linearized Model-free Adaptive Control(CDL-MFAC)** applied to **Permanent Magnetic Linear Synchronous Motor (PMLSM)** systems. 


The repository is created for the purpose of anonymous peer review.


---

## ⚙️ Requirements

- MATLAB R2021a or later
- No additional toolboxes are required beyond the standard MATLAB environment  

---

## ▶️ Usage

1. Clone or download this repository.  
2. Open MATLAB and set the working directory to this project folder.  
3. Run the following .slx file in the MATLAB Simulation (clean data in workspace before simulation):

   ```Simulation
   PMLSM_CDL_MFAC_FFDLc.slxc
   PMLSM_MFAC_FFDL.slx
   PMLSM_PID.slx

4. Run the following .m file in MATLAB to save data in workspace:

   ```MATLAB
   save_data.m

5. Run the following .m file in MATLAB to generate figures:

   ```MATLAB
   calculate_index.m
