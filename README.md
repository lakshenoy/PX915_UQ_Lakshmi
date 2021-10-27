# PX915_UQ_Lakshmi
Files to reproduce the uncertainty quantification of a result from Lakshmi's summer project.

The jupyter notebook reproducible_result.ipynb contains the code used to calculate the [100] surface energy and 
its error value presented in the report, as well as the code for an alternative brute-force method to compute it.

The second sparse file of the GAP potential was too large to upload here. Please download it from:
https://files.warwick.ac.uk/lakshmishenoy/browse/PX915_UQ_Lakshmi

Please make sure the GAP file (gp4.xml) and its two sparse files are present in the same directory as the notebook.

To run this notebook, you will need ase and quippy, which can be installed as follows:
$ pip install ase
$ pip install quippy

I'd recommend running this on a hetsys node, as the brute-force method involves drawing many samples the large GP posterior.
