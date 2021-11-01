# PX915_UQ_Lakshmi
Files to reproduce the uncertainty quantification of a result from Lakshmi's summer project.

The jupyter notebook reproducible_result.ipynb contains the code used to calculate the [100] surface energy and its error value presented in the report. It also contains the code for an alternative brute-force method to compute these results.

Before running the notebook, please make sure the GAP file (gp4.xml) and its two sparse files are present in the same directory as the notebook. The second sparse file of the GAP potential was too large to upload here. Please download it from:
https://files.warwick.ac.uk/lakshmishenoy/browse/PX915_UQ_Lakshmi

I'd recommend running this notebook on a hetmathsys node, as the brute-force method involves drawing many samples from the large GP posterior.

To load python3 on one of the hetmathsys nodes, run:

$ module purge

$ module load iccifort/2019.5.281  impi/2018.5.288  ASE/3.22.0-Python-3.7.4

You'll also need ase and quippy, which can be installed by running:

$ pip install ase

$ pip install quippy-ase
