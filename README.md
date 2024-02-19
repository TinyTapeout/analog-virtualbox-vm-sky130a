# Tiny Tapeout Analog Design VM with Skywater 130 PDK

![](../../workflows/build_vm/badge.svg)

This repository contains the necessary files to build a virtual machine (VM) for analog design using the Skywater 130nm PDK. 

The VM is based on Ubuntu 22.04 and includes the following tools:

- [Magic](http://opencircuitdesign.com/magic/)
- [KLayout](https://www.klayout.de/)
- [Xschem](https://xschem.sourceforge.io/stefan/index.html)
- [Skywater 130nm PDK](https://github.com/google/skywater-pdk)

To download the VM, go to the [actions](https://github.com/TinyTapeout/analog-virtualbox-vm-sky130a/actions) tab and download the latest "tt_analog_virtualbox_ova" artifact. Import the OVA file into VirtualBox and start the VM.

## Using the VM

The default username for the VM is `ttuser` and the password is `magic`. You can change the password by running the `passwd` command.

The desktop includes shortcuts to start Magic, KLayout, and Xschem. The Skywater 130nm PDK is installed in the `/home/tt_user/pdk` directory.

## Building the VM locally

To build the VM locally, you need to have [Packer](https://www.packer.io/) and [VirtualBox](https://www.virtualbox.org/) installed. Then, run the following command:

```bash
packer init image.pkr.hcl
packer build image.pkr.hcl
```

Building the VM takes about 30 minutes, depending on your internet connection and hardware. The resulting OVA file will be in the `outputoutput-tinytapeout_analog_vm` directory.

## Customizing the VM

You can customize the VM by modifying the `image.pkr.hcl` file. For example, you can change the amount of memory, number of CPUs, or the size of the disk.

If you wish to install additional software, you add new scripts to the `scripts` directory and include them in the `image.pkr.hcl` file, in the `scripts` list of the `provisioner` block.

## License

This project is licensed under the terms of the [Apache License 2.0](LICENSE).
