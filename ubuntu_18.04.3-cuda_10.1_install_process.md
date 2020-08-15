Use black Kingston 16 GB USB driver to install ubuntu 18.04.3 LTS - 
has kernel 5.0.0 that is compatible with CUDA toolkit 10.1.243 (10.1 Update 2)

`$ sudo reboot`<br/>
go to bios and disable secure boot

disable option to check for long term ubuntu versions
disable option to automatically download updates

`
sudo apt update  
`

Install apt and apt-get packages

download CUDA toolkit 10.1.243 (10.1 Update 2) runfile from Nvidia website

Create a file at `/etc/modprobe.d/blacklist-nouveau.conf` and add the following:<br/>
`blacklist nouveau`<br/>
`options nouveau modeset=0`<br/>

If you already have nvidia installed, uninstall it:<br/>
`sudo apt-get purge nvidia-*`<br/>
`sudo reboot`<br/>

Upon restart, drop into the tty terminal with Ctrl+Alt+Fx (x = 1, 2, 3) and log in

Find the CUDA toolkit runfile you downloaded and run it: `sudo bash ./NAME_OF_RUNFILE.run`<br/>

Follow the prompts to install the driver and CUDA. If the installation fails, you will need to check /var/log/nvidia-installer.log or /var/log/cuda-installer.log to find out why. You can test if the installation was successful by running nvidia-smi.Check the reported driver and CUDA versions

Leave the tty terminal and return to the gui: Ctrl+Alt+F7

Add the following lines to `~/.bashrc`:<br/>
`
export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH<br/>
export PATH=/usr/local/cuda-10.1/bin${PATH:+:${PATH}}<br/>
export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}<br/>
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH<br/>
set -o noclobber
`
