#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=48
#SBATCH --mem-per-cpu=31418
#SBATCH --time=48:00:00
#SBATCH --partition=hmem

# Setup Environment
module purge
module load GCCcore/10.3.0 Python/3.9.5
export OMP_NUM_THREADS=48

# Set Filenames
infile='data_v4.xyz'
outfile='gp4.xml'
spfile='sparse.dat'

# Two-body Descriptor
two_body="distance_2b add_species     = T \
                      cutoff          = 5.0 \
                      delta           = 0.055 \
                      n_sparse        = 100 \
                      sparse_method   = uniform \
                      covariance_type = ARD_SE \
                      theta_uniform   = 1.0"
# SOAP Descriptor
soap="soap l_max	= 12 \
	   n_max	= 12 \
	   cutoff	= 5.0 \
	   cutoff_transition_width = 1.0 \
	   delta	= 0.7 \
	   atom_sigma	= 0.5 \
	   zeta		= 4 \
	   sparse_method = cur_points \
           covariance_type = dot_product \
	   print_sparse_index = ${spfile} \
           config_type_n_sparse = {slice_sample_high:500:\
                                   phonons_54_high:500:\
                                   phonons_128_high:500:\
				   default:5000}"

# Gap-fit Settings
settings="force_mask_parameter_name = force_mask
          sparse_jitter         = 1e-12 \
          default_sigma		= {0.005 0.2 1.0 0.0} \
	  config_type_sigma	= {slice_sample_high:0.0001:0.01:0.01:0.0:\
	  			   phonons_54_high:0.001:0.05:1.0:0.0:\
				   phonons_128_high:0.001:0.05:1.0:0.0}"

# Run the Program
#srun gap_fit atoms_filename=$infile gap={$two_body} $settings gp_file=$outfile
#srun gap_fit atoms_filename=$infile gap={$soap} $settings gp_file=$outfile
srun gap_fit atoms_filename=$infile gap={{$two_body}:{$soap}} $settings gp_file=$outfile


