Requirements:

* Vagrant
* VirtualBox

---

Use:

* `vagrant up` Create VM, run `VMSetup.sh` then restart the VM
* `vagrant destroy` Destroy the VM
* `vagrant ssh VM_NAME -- -X` remote connect to the VM with X11 Forwarding enabled
* `vagrant --help` for anything else 👀️

To change the VDI default location set:

`VBoxManage setproperty machinefolder "<new_path>"`

---

Details:

* Like named, `shared` folder is shared with the VM, at `/shared`
* VM's Name is bash>`echo $(whoami)VM`
* VM's IP is `192.168.56.110`
* VM's user is `vagrant`, same for the password
* Actual specs:
  * 4 VCpus
  * 4 Go RAM
  * 128 MB VRam

Feel free to Fork and change `VMSetup.sh` as your wish
