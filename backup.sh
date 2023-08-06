cd /cs/
cd -
cd /cs/ghassan
cd -
echo $(pwd)
cd -
echo $(pwd)

code_backup_dir="/cs/ghassan3/students/asa409/"
data_backup_dir="/cs/ghassan2/students_less/asa409/"

code_backup_file="code_backup_$(date +%y-%m-%d).tar.gz"
data_backup_file="data_backup_$(date +%y-%m-%d).tar.gz"

echo $code_backup_dir
# Create the backup archive
# tar --use-compress-program="pigz -p32 --best" -cf $code_backup_dir/tree_lifting_$code_backup_file"  "/localhome/asa409/projects/VascuSynth_lifting/src/baselines/PIFu/" -f "$code_backup_dir/tree_lifting_$code_backup_file"  | pv

if [[ $1 -eq 1 ]]
then

tar --use-compress-program="pigz -p32 --best" --exclude "*wandb*" --exclude "*experiments*" --exclude "*results*" -cf "$code_backup_dir/tree_lifting_$code_backup_file" $(find /localhome/asa409/projects/VascuSynth_lifting/src/baselines/PIFu/ -type f \( -name \*.py -o -name \*.so  \))

tar --use-compress-program="pigz -p32 --best" --exclude "*wandb*" --exclude "*experiments*" --exclude "*results*" -cf "$code_backup_dir/DermSynth3D_private_$code_backup_file" $(find /localhome/asa409/projects/DermSynth3D_private/ -type f \( -name \*.py -o -name \*.so  \))

tar --use-compress-program="pigz -p32 --best" --exclude "*wandb*" --exclude "*experiments*" --exclude "*results*" -cf "$code_backup_dir/arssr_$code_backup_file" $(find /localhome/asa409/projects/ArSSR/ -type f \( -name \*.py -o -name \*.so  \))

tar --use-compress-program="pigz -p32 --best" --exclude "*wandb*" --exclude "*experiments*" --exclude "*results*" -cf "$code_backup_dir/nerp_$code_backup_file" $(find /localhome/asa409/projects/NeRP/ -type f \( -name \*.py -o -name \*.so  \))

find "$code_backup_dir" -type f -name "*_code_backup_*.tar.gz" -mtime +4 -delete
# tar --use-compress-program="pigz -p32 --best" -c "/localhome/asa409/projects/DermSynth3D_private/draft" -f "$code_backup_dir/dermsynth3d_$code_backup_file" | pv 
# tar --use-compress-program="pigz -p32 --best" -c "/localhome/asa409/projects/ArSSR/" -f "$code_backup_dir/arssr_$code_backup_file" | pv 
# tar --use-compress-program="pigz -p32 --best" -c "/localhome/asa409/projects/NeRP/" -f "$code_backup_dir/nerp_$code_backup_file" | pv
elif [[ $1 -eq 2 ]]
then 
tar --use-compress-program="pigz -p32 --best" -c "/localhome/asa409/projects//VascuSynth_lifting/WT_vascusynth/watertight_pifu_new/" -f "$data_backup_dir/tree_lifting_$data_backup_file" | pv 
tar --use-compress-program="pigz -p32 --best" -c "/localhome/asa409/projects//data/mednerf_drr_dataset.zip" -f "$data_backup_dir/nerp_$data_backup_file"  | pv 
tar --use-compress-program="pigz -p32 --best" -c "/localhome/asa409/projects//data/mednerf_drr_poses_pixelnerf.zip" -f "$data_backup_dir/nerp_$data_backup_file" | pv

find "$data_backup_dir" -type f -name "*_data_backup_*.tar.gz" -mtime +1 -delete
fi


